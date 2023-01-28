import 'package:flutter/material.dart';
import 'package:posted_social_media/model/post_model.dart';
import 'package:posted_social_media/repository/post_repository.dart';
import 'package:posted_social_media/utils/show_message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'dart:async';
import 'package:proximity_sensor/proximity_sensor.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool _isNear = false;
  int count = 1;
  late StreamSubscription<dynamic> _streamSubscription;

  @override
  void initState() {
    _checkNotificationEnabled();
    super.initState();
    listenSensor();
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  Future<void> listenSensor() async {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (foundation.kDebugMode) {
        FlutterError.dumpErrorToConsole(details);
      }
    };
    _streamSubscription = ProximitySensor.events.listen((int event) {
      setState(() {
        _isNear = (event > 0) ? true : false;
      });
    });
  }

  String? image;
  // @override
  // void initState() {
  //   callImg();
  //   super.initState();
  // }

  // callImg() async {
  //   prefs = await SharedPreferences.getInstance();
  //   image = prefs!.getString("image");
  // }

  Future<String> callImg() async {
    await Future.delayed(const Duration(seconds: 1));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    image = prefs.getString("image");
    return image!;
  }

  final _formKey = GlobalKey<FormState>();
  final _postText = TextEditingController();

  _createPost(PostModel postModel) async {
    bool isPosted = await PostRepository().createPost(postModel);
    if (isPosted) {
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }

  _displayMessage(bool isPosted) {
    if (isPosted) {
      Navigator.pushReplacementNamed(context, '/navigation');
      displaySuccessMessage(context, "Post Success");
    } else {
      displayErrorMessage(context, "Post Failed");
    }
  }

  _checkNotificationEnabled() {
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: const Text(
  //           'New Post',
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         backgroundColor: Colors.grey[100],
  //         foregroundColor: Colors.black,
  //         automaticallyImplyLeading: false,
  //       ),
  //       body: SingleChildScrollView(
  //           child: Column(children: [
  //         TextFormField(),
  //         TextFormField(),
  //         ElevatedButton(onPressed: () {}, child: Text('Post'))
  //       ])));
  // }
  // Uint8List? _file;
  bool isLoading = false;
  // final TextEditingController _descriptionController = TextEditingController();

  // _selectImage(BuildContext parentContext) async {
  //   return showDialog(
  //     context: parentContext,
  //     builder: (BuildContext context) {
  //       return SimpleDialog(
  //         title: const Text('Create a Post'),
  //         children: <Widget>[
  //           SimpleDialogOption(
  //               padding: const EdgeInsets.all(20),
  //               child: const Text('Take a photo'),
  //               onPressed: () async {
  //                 Navigator.pop(context);
  //                 Uint8List file = await pickImage(ImageSource.camera);
  //                 setState(() {
  //                   _file = file;
  //                 });
  //               }),
  //           SimpleDialogOption(
  //               padding: const EdgeInsets.all(20),
  //               child: const Text('Choose from Gallery'),
  //               onPressed: () async {
  //                 Navigator.of(context).pop();
  //                 Uint8List file = await pickImage(ImageSource.gallery);
  //                 setState(() {
  //                   _file = file;
  //                 });
  //               }),
  //           SimpleDialogOption(
  //             padding: const EdgeInsets.all(20),
  //             child: const Text("Cancel"),
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  // void postImage(String uid, String username, String profImage) async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   // start the loading
  //   try {
  //     // upload to storage and db
  //     String res = await FireStoreMethods().uploadPost(
  //       _descriptionController.text,
  //       _file!,
  //       uid,
  //       username,
  //       profImage,
  //     );
  //     if (res == "success") {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       showSnackBar(
  //         context,
  //         'Posted!',
  //       );
  //       clearImage();
  //     } else {
  //       showSnackBar(context, res);
  //     }
  //   } catch (err) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     showSnackBar(
  //       context,
  //       err.toString(),
  //     );
  //   }
  // }

  // void clearImage() {
  //   setState(() {
  //     _file = null;
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   // _descriptionController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // final UserProvider userProvider = Provider.of<UserProvider>(context);

    return _isNear
        ? const Scaffold(
            backgroundColor: Colors.black,
          )
        // _file == null
        //     ? Scaffold(
        //         appBar: AppBar(
        //           backgroundColor: Colors.grey[100],
        //           title: const Text(
        //             'New Post',
        //           ),
        //           foregroundColor: Colors.black,
        //           automaticallyImplyLeading: false,
        //         ),
        //         body: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             const Text('Choose an Image to Post'),
        //             IconButton(
        //               icon: const Icon(
        //                 Icons.upload,
        //               ),
        //               onPressed: () => _selectImage(context),
        //             ),
        //           ],
        //         ),
        //       )
        //     :
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[100],
              title: const Text(
                'New Post',
              ),
              foregroundColor: Colors.black,
              automaticallyImplyLeading: false,
              // centerTitle: false,
              actions: <Widget>[
                TextButton(
                  // onPressed: () => postImage(
                  //   userProvider.getUser.uid,
                  //   userProvider.getUser.username,
                  //   userProvider.getUser.photoUrl,
                  // ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      PostModel postModel = PostModel(
                        postText: _postText.text,
                        postImage: [],
                      );
                      AwesomeNotifications().createNotification(
                          content: NotificationContent(
                        id: count,
                        channelKey: 'basic_channel',
                        title: 'Posted',
                        body: "You have posted a new post",
                      ));
                      setState(() {
                        count++;
                      });

                      // const Text("Show Notification");
                      _createPost(postModel);
                    }
                  },
                  child: const Text(
                    "Post",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                )
              ],
            ),
            // POST FORM
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  isLoading
                      ? const LinearProgressIndicator()
                      : const Padding(padding: EdgeInsets.only(top: 0.0)),
                  const Divider(),
                  Form(
                    key: _formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FutureBuilder<String?>(
                          future: callImg(),
                          builder: (context, snapshot) {
                            final error = snapshot.error;
                            if (snapshot.hasError) {
                              final error = snapshot.error;

                              return const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://imgs.search.brave.com/LV50kakBXtmMQ16KT9ic5Kt5D0Fm1X8ThyWVRReCDrw/rs:fit:512:512:1/g:ce/aHR0cHM6Ly93d3cu/aWNvbnBhY2tzLm5l/dC9pY29ucy8yL2Zy/ZWUtdXNlci1pY29u/LTMyOTYtdGh1bWIu/cG5n'));
                            }

                            if (snapshot.hasData) {
                              String data = snapshot.data!;
                              return CircleAvatar(
                                  backgroundImage: NetworkImage(data));
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                        // CircleAvatar(
                        //     backgroundImage: image != null
                        //         ? NetworkImage('$image')
                        //         : const NetworkImage(
                        //             'https://imgs.search.brave.com/LV50kakBXtmMQ16KT9ic5Kt5D0Fm1X8ThyWVRReCDrw/rs:fit:512:512:1/g:ce/aHR0cHM6Ly93d3cu/aWNvbnBhY2tzLm5l/dC9pY29ucy8yL2Zy/ZWUtdXNlci1pY29u/LTMyOTYtdGh1bWIu/cG5n')),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextFormField(
                            controller: _postText,
                            decoration: const InputDecoration(
                                hintText: "Write a caption...",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Caption Cannot be empty';
                              }
                              return null;
                            },
                            maxLines: 8,
                          ),
                        ),
                        // SizedBox(
                        //   height: 45.0,
                        //   width: 45.0,
                        //   child: AspectRatio(
                        //     aspectRatio: 487 / 451,
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //           image: DecorationImage(
                        //         fit: BoxFit.fill,
                        //         alignment: FractionalOffset.topCenter,
                        //         image: MemoryImage(_file!),
                        //       )),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
          );
  }
}
