import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:posted_social_media/model/post_model.dart';
import 'package:posted_social_media/repository/post_repository.dart';
import 'package:posted_social_media/repository/profile_repository.dart';
import 'package:posted_social_media/response/profile_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shake/shake.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String? username = '';

  late ShakeDetector detector;

  @override
  void initState() {
    callId();
    super.initState();

    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        setState(() {
          Navigator.pushNamed(context, '/navigation');
        });
      },
    );
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  _likePost(postId) async {
    bool isLiked = await PostRepository().likePost(postId);
  }

  callId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("username");
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double likeSize = height * 0.04;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[100],
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
            iconSize: 35,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<ProfileResponse?>(
          future: ProfileRepository().profileById(username!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                List<PostModel> lstPost = snapshot.data!.posts!;
                // List<User> lstUser = snapshot.data!.user!.followers![1];
                // debugPrint(lstUser.toString());
                debugPrint(lstPost[0].postText);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height * 0.14,
                            width: width * 0.22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    NetworkImage(snapshot.data!.user!.image!),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.06),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        snapshot.data!.posts!.length.toString(),
                                        style: const TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),
                                      const Text('Posts'),
                                    ],
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Column(
                                    children: [
                                      Text(
                                        snapshot.data!.user!.followers!.length
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),
                                      const Text('Followers'),
                                    ],
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Column(
                                    children: [
                                      Text(
                                        snapshot.data!.user!.following!.length
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),
                                      const Text('Following'),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: width * 0.6,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromARGB(208, 117, 74, 74),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/editprofilescreen',
                                        arguments: username);
                                  },
                                  child: const Text('Edit Profile'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data!.user!.username!),
                          Text(
                            snapshot.data!.user!.name!,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            snapshot.data!.user!.bio!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: lstPost.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                  lstPost[index].user!.image!,
                                                ),
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: () {},
                                              child: Image.network(
                                                lstPost[0].user!.image!,
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
                                            Text(
                                              lstPost[index].user!.name!,
                                              // 'John Snow',
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  snapshot.data!.user!
                                                          .followers!.length
                                                          .toString() +
                                                      " followers",
                                                  // '50 followers'
                                                ),
                                                const SizedBox(width: 4),
                                              ],
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
                                      child: Text(
                                          lstPost[index].postText.toString()),
                                    ),
                                    // Container(
                                    //   child: lstPost[index].postImage.length != 0
                                    //       ? Image.network(
                                    //           "${lstPost[index]["images"][0]["secure_url"]}")
                                    //       : const SizedBox(
                                    //           height: 0,
                                    //           width: 0,
                                    //         ),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding:
                                            const EdgeInsetsDirectional.only(
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
                                                    _likePost(lstPost[index].id)
                                                  },
                                                  child: LikeButton(
                                                    size: likeSize,
                                                    isLiked:
                                                        lstPost[index].isLiked,
                                                    likeCount:
                                                        lstPost[index].numLikes,
                                                    likeBuilder: (isLiked) {
                                                      final color = isLiked
                                                          ? const Color(
                                                              0xff754A4A)
                                                          : Colors.grey;
                                                      return Icon(
                                                        Icons.favorite,
                                                        color: color,
                                                        size: likeSize,
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
                                                    Icons.mode_comment_outlined,
                                                    color: Colors.grey,
                                                    // color: Color(0xff754A4A),
                                                    size: 30,
                                                  ),
                                                ),
                                                Text(
                                                  lstPost[index]
                                                      .numComments
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w600),
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
                                                    // color: Color(0xff754A4A),
                                                    color: Colors.grey,
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
                          ],
                        );
                      },
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
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

  Widget _topProfile() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String? profilePic;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * 0.14,
            width: width * 0.22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueAccent,
              image: DecorationImage(
                image: NetworkImage('$profilePic!'),
              ),
            ),
          ),
          SizedBox(width: width * 0.06),
          Column(
            children: [
              Row(
                children: [
                  Column(
                    children: const [
                      Text(
                        '123',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      Text('Posts'),
                    ],
                  ),
                  SizedBox(width: width * 0.05),
                  Column(
                    children: const [
                      Text(
                        '123',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      Text('Followers'),
                    ],
                  ),
                  SizedBox(width: width * 0.05),
                  Column(
                    children: const [
                      Text(
                        '123',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      Text('Following'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: width * 0.6,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(208, 117, 74, 74),
                  ),
                  onPressed: () {},
                  child: const Text('Edit Profile'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}


// Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(snapshot.data![1]),
//                       Text(
//                         snapshot.data![2],
//                         style: const TextStyle(fontSize: 20),
//                       ),
//                       Text(
//                         snapshot.data![3],
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   )