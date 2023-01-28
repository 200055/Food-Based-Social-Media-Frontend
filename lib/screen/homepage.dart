import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:posted_social_media/repository/post_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  String? image;
  bool? isLiked;

  _likePost(postId) async {
    bool isLiked = await PostRepository().likePost(postId);
  }

  //get image stored in shared preferences
  Future<String> callImg() async {
    await Future.delayed(const Duration(seconds: 1));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    image = prefs.getString("image");
    return image!;

    throw 'error';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[100],
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // color: Colors.black,
            ),
            child: InkWell(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: FutureBuilder<String?>(
                  future: callImg(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Image.network(
                        'https://imgs.search.brave.com/LV50kakBXtmMQ16KT9ic5Kt5D0Fm1X8ThyWVRReCDrw/rs:fit:512:512:1/g:ce/aHR0cHM6Ly93d3cu/aWNvbnBhY2tzLm5l/dC9pY29ucy8yL2Zy/ZWUtdXNlci1pY29u/LTMyOTYtdGh1bWIu/cG5n',
                        fit: BoxFit.cover,
                      );
                    }
                    if (snapshot.hasData) {
                      String data = snapshot.data!;
                      return Image.network(
                        data,
                        fit: BoxFit.cover,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
            iconSize: 35,
          )
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<dynamic>>(
          future: PostRepository().getPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                List<dynamic> lstPost = snapshot.data!;
                debugPrint(lstPost.toString());
                return ListView.builder(
                  itemCount: lstPost.length,
                  itemBuilder: (BuildContext context, int index) {
                    String? username = lstPost[index]["user"]["username"];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: height * 0.065,
                                        width: width * 0.15,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          // color: Colors.amber,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "${lstPost[index]["user"]["image"]!}",
                                            ),
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Image.network(
                                            "${lstPost[index]["user"]["image"]!}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      // verticalDirection: VerticalDirection.up,
                                      // mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          onTap: () => {
                                            Navigator.pushNamed(
                                                context, '/otherprofilescreen',
                                                arguments: username),
                                          },
                                          child: Text(
                                            lstPost[index]["user"]["name"]!,
                                            overflow: TextOverflow.ellipsis,
                                            // 'John Snow',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(lstPost[index]["tweetContent"]!),
                                ),
                                Container(
                                  child: lstPost[index]["images"].length != 0
                                      ? Image.network(
                                          "${lstPost[index]["images"][0]["secure_url"]}")
                                      : const SizedBox(
                                          height: 0,
                                          width: 0,
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onDoubleTap: () => {
                                                _likePost(lstPost[index]["_id"])
                                              },
                                              child: LikeButton(
                                                size: 30,
                                                isLiked: lstPost[index]
                                                    ["isLiked"],
                                                likeCount: lstPost[index]
                                                    ["numLikes"],
                                                likeBuilder: (isLiked) {
                                                  final color = isLiked
                                                      ? const Color(0xff754A4A)
                                                      : Colors.grey;
                                                  return Icon(
                                                    Icons.favorite,
                                                    color: color,
                                                    size: 30,
                                                  );
                                                },
                                                // onTap: () {
                                                //   _likePost(
                                                //       lstPost[index]["_id"]);
                                                // },
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: const Icon(
                                                Icons.mode_comment,
                                                color: Colors.grey,
                                                // color: Color(0xff754A4A),
                                                size: 30,
                                              ),
                                            ),
                                            Text(
                                              lstPost[index]["numComments"]
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: const Icon(
                                                Icons.share_outlined,
                                                color: Colors.grey,
                                                // color: Color(0xff754A4A),
                                                size: 30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // const SizedBox(height: 7)
                      ],
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("No data"),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff754A4A)),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
