import 'package:flutter/material.dart';

class DonationPoint extends StatefulWidget {
  const DonationPoint({Key? key}) : super(key: key);

  @override
  _DonationPointState createState() => _DonationPointState();
}

class _DonationPointState extends State<DonationPoint> {
  @override
  Widget build(BuildContext context) {
    var rank;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Top Chiefs",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // decoration: BoxDecoration(
            //   // color: Color(0xFF41A2CD),
            //   border: Border.all(color: const Color(0xFF41A2CD)),
            //   borderRadius: const BorderRadius.only(
            //     bottomRight: Radius.circular(20),
            //     bottomLeft: Radius.circular(20),
            //   ),
            // ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.08), BlendMode.dstIn),
                          image: const NetworkImage(
                            "https://img.freepik.com/free-vector/charity-doodle-vector-background-donation-concept_53876-143434.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                        // color: const Color(0xFF41A2CD),
                        // border: Border.all(color: const Color(0xFF41A2CD)),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: const [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://static.vecteezy.com/system/resources/previews/006/487/917/original/man-avatar-icon-free-vector.jpg"),
                                radius: 50,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Prabesh aryal",
                            style: TextStyle(
                              fontSize: 22,
                              // color: Colors.white,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    constraints: const BoxConstraints(
                                        minWidth: 10,
                                        maxWidth: 140,
                                        maxHeight: 50),
                                    child: const Text(
                                      "5",
                                      // overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 42,
                                        fontWeight: FontWeight.w300,
                                        // color: Colors.white.withOpacity(0.9),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Post likes",
                                    style: TextStyle(
                                      fontSize: 19,
                                      // fontWeight: FontWeight.bold,
                                      // color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(("1").toString(),
                                      style: const TextStyle(
                                        fontSize: 42,
                                        fontWeight: FontWeight.w300,
                                        // color: Colors.white.withOpacity(0.9),
                                      )),
                                  const Text(
                                    "Rank",
                                    style: TextStyle(
                                      fontSize: 19,
                                      // fontWeight: FontWeight.bold,
                                      // color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Top Chiefs",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.53,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              border:
                                  Border.all(color: const Color(0xFF41A2CD)),
                            ),
                            margin: const EdgeInsets.all(1),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Row(
                                          children: const [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "https://static.vecteezy.com/system/resources/previews/006/487/917/original/man-avatar-icon-free-vector.jpg"),
                                              radius: 30,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text("Prabesh aryal")
                                          ],
                                        ),
                                        leading: Text(
                                          "#${index + 1}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        trailing: const Text("5",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(
                                      thickness: 1,
                                      color: Color(0xFF41A2CD),
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    itemCount: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Row(
                                          children: const [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "https://media.istockphoto.com/id/1227618801/vector/human-face-avatar-icon-profile-for-social-network-man-vector-illustration.jpg?s=170667a&w=0&k=20&c=YW_cwPaiX8pHXaOGiX_3tQKRk8NU0ef8ylNq23HdxDI="),
                                              radius: 30,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text("Ram prasad")
                                          ],
                                        ),
                                        leading: const Text(
                                          "#2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        trailing: const Text("3",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(
                                      thickness: 1,
                                      color: Color(0xFF41A2CD),
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    itemCount: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Row(
                                          children: const [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "https://media.istockphoto.com/id/979895328/vector/cartoon-bearded-man-face-friendly-hipster-male-avatar.jpg?s=170667a&w=0&k=20&c=L69LbQaBRVVRLSimEWVnAty16f3rOXNWAVyWfPGrvLg="),
                                              radius: 30,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text("shyam")
                                          ],
                                        ),
                                        leading: const Text(
                                          "#3",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        trailing: const Text("2",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(
                                      thickness: 1,
                                      color: Color(0xFF41A2CD),
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    itemCount: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Row(
                                          children: const [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "https://i.pinimg.com/564x/fb/14/60/fb1460e9e1648ba0d301ce0e95d017c9.jpg"),
                                              radius: 30,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text("sita@gmail.com")
                                          ],
                                        ),
                                        leading: const Text(
                                          "#4",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        trailing: const Text("4",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(
                                      thickness: 1,
                                      color: Color(0xFF41A2CD),
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    itemCount: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
