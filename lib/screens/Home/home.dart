import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:connectpamodziv04/models/story_view_model.dart';
// import 'package:connectpamodziv04/screens/create_page.dart';
// import 'package:connectpamodziv04/nav.dart';
// import 'package:connectpamodziv04/screens/profile.dart';
import 'package:like_button/like_button.dart';
import 'package:connectpamodziv04/widgets/story_widget.dart';
import '../../widgets/post_card.dart';
import '../Comments/commentspage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import '../data.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:connectpamodziv04/config/api.dart';
import 'package:connectpamodziv04/controllers/controllers.dart';
import 'package:connectpamodziv04/controllers/post_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

final _firestore = FirebaseFirestore.instance;

List<String> likedusers = [];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SizedBox spacing() {
    return SizedBox(
      width: 15.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      spacing(),
                      StoryWid(
                          img: StoryViewData[0].img,
                          name: StoryViewData[0].name),
                      spacing(),
                      StoryWid(
                          img: StoryViewData[1].img,
                          name: StoryViewData[1].name),
                      spacing(),
                      StoryWid(
                          img: StoryViewData[2].img,
                          name: StoryViewData[2].name),
                      spacing(),
                      StoryWid(
                          img: StoryViewData[3].img,
                          name: StoryViewData[3].name),
                      spacing(),
                      StoryWid(
                          img: StoryViewData[4].img,
                          name: StoryViewData[4].name),
                      spacing(),
                      StoryWid(
                          img: StoryViewData[5].img,
                          name: StoryViewData[5].name),
                      spacing(),
                      StoryWid(
                          img: StoryViewData[6].img,
                          name: StoryViewData[6].name),
                      spacing(),
                      StoryWid(
                          img: StoryViewData[7].img,
                          name: StoryViewData[7].name),
                      spacing(),
                      StoryWid(
                          img: StoryViewData[8].img,
                          name: StoryViewData[8].name),
                      spacing(),
                      StoryWid(
                          img: StoryViewData[9].img,
                          name: StoryViewData[9].name),
                      spacing(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          PostStream(),
        ],
      ),
    ]);
  }
}

class PostStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('posts').orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        List<PostCard> postCards = [];
        Future Likecheck(postid) async {
          var data = await _firestore
              .collection('posts')
              .doc(postid)
              .collection('liked')
              .get();
          return snapshot.data;
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
            ),
          );
        }
        final posts = snapshot.data.docs;

        for (var post in posts) {
          // var likedusrs = await Likecheck(post.id);
          // var data = likedusrs.data();
          final likesCount = post['likes'];
          final name = post['name'];
          final place = post['place'];
          final profilePic = post['profilepicurl'];
          final postUrl = post['url'];
          final postId = post.id;
          final postCard = PostCard(
            likes: likesCount,
            // liked: ,
            name: name,
            place: place,
            profilePic: profilePic,
            postUrl: postUrl,
            postID: postId,
          );
          postCards.add(postCard);
        }
        return ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: postCards.reversed.toList(),
        );
      },
    );
  }
}



class MyLayout extends StatefulWidget {
  @override
  State<MyLayout> createState() => _MyLayoutState();
}

class _MyLayoutState extends State<MyLayout> {
  @override
  // ignore: override_on_non_overriding_member

  // ignore: override_on_non_overriding_member
  File image;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      // ignore: missing_required_param
      child: ElevatedButton(
        //child: Text('add post'),
        onPressed: () {
          NewPostDialog(context);
        },
      ),
    );
  }
}

NewPostDialog(BuildContext context) {
  File image;
  // set up the buttons
  Widget textField = Container(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: newPostext,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green[200],
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
        ),
      ),
    ),
  );
  Widget imageUpload = Container(
    child: Row(
      children: [
        image != null
            ? Image.file(
                image,
                height: 100,
              )
            : Container(),
        IconButton(
          icon: Icon(
            Icons.add_a_photo_outlined,
            color: Colors.green,
            size: 25,
          ),
          onPressed: () async {
            if (await Permission.storage.request().isGranted) {
              final picker = ImagePicker();
              final pickedFile =
                  await picker.getImage(source: ImageSource.gallery);

              if (pickedFile != null) {
                image = File(pickedFile.path);
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString("img", image.path);
                print(image.path);
              } else {
                print('No image selected.');
              }
            }
          },
        ),
      ],
    ),
  );

  // ignore: deprecated_member_use
  Widget submitButton = TextButton(
    // hoverColor: Colors.green,
    child: Text(
      "Submit",
    ),
    onPressed: () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userId = prefs.getString(
        "userId",
      );
      var userType = prefs.getString(
        "UType",
      );
      var img = prefs.getString(
        "img",
      );
      // var wallType = prefs.getString(
      //   "wallType",
      // );

      print(img);
      String filename = await uploadFile(File(img));
      filename = filename.replaceAll('"', "");
      print(filename);
      int isSave = 1;
      print(Get.find<PostController1>().isSwitchedOn);
      if (Get.find<PostController1>().isSwitchedOn) {
        isSave = 0;
      }
      int isAnonymous = 0;
      print(Get.find<PostController2>().isAnonymousPost);
      if (Get.find<PostController2>().isAnonymousPost) {
        isAnonymous = 1;
      }
      var res = await http.get(
        Uri.parse(API +
            //how to make this dynamic????
            "/Post/AddPost?desc=${newPostext.text}&userID=$userId&wallType=BIIT&utype=$userType&filename=$filename&isSaveAble=$isSave&isAnonymousPost=$isAnonymous"),
      );

      print(res.body);
      Get.close(1);
    },
  );
  // ignore: deprecated_member_use
  Widget cancelButton = TextButton(
    // hoverColor: Colors.green,
    child: Text(
      "Cancel",
    ),
    onPressed: () {
      Get.close(1);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("New Post"),
    //content: Text(""),
    actions: [
      textField,
      imageUpload,
      Row(
        children: [
          Text("Private Post?"),
          GetBuilder<PostController1>(
            init: PostController1(),
            initState: (_) {},
            builder: (_) {
              return Switch(
                  value: _.isSwitchedOn,
                  onChanged: (f) {
                    _.updateIsSwitchedOn(f);
                  });
            },
          ),
        ],
      ),
      Row(
        children: [
          Text("Anonymous Post?"),
          GetBuilder<PostController2>(
            init: PostController2(),
            initState: (_) {},
            builder: (_) {
              return Switch(
                  value: _.isAnonymousPost,
                  onChanged: (f) {
                    _.anonymousIsSwitchedOn(f);
                  });
            },
          ),
        ],
      ),
      cancelButton,
      submitButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
