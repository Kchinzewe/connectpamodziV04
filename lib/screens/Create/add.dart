import 'package:connectpamodziv04/screens/Create/create_page.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  static const String id = 'add';
  const Add({Key key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  
  // final PostService _postService = PostService();
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Post'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.teal, primary: Colors.purple),
            onPressed: () async {
              savePost(text);
              Navigator.pop(context);
            },
            child: Text('Post'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Form(
          child: TextFormField(
            onChanged: (val) {
              setState(
                () {
                  text = val;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
