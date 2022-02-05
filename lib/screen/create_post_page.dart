// ignore_for_file: unnecessary_const

import 'package:api/controller/post_controller.dart';
import 'package:api/models/post_model.dart';
import 'package:api/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _userIdController = TextEditingController();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  PostModel _afterPost = PostModel(userId: 0, id: 0, title: '', body: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter User Id',
                  border: OutlineInputBorder(),
                ),
                controller: _userIdController,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter Title',
                  border: OutlineInputBorder(),
                ),
                controller: _titleController,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter Body',
                  border: OutlineInputBorder(),
                ),
                controller: _bodyController,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 60.0,
                width: double.infinity,
                child: CupertinoButton(
                  color: Colors.cyanAccent,
                  onPressed: () async {
                    var postModel = PostModel(
                        userId: int.parse(_userIdController.text),
                        id: 0,
                        title: _titleController.text,
                        body: _bodyController.text);
                    LoadingWidget.buildLoading(context, 'Loading');
                    await Future.delayed(Duration(seconds: 2));
                    _afterPost = await PostController().createPost(postModel);
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('SAVE'),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Card(
                color: Colors.white54,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      _afterPost.userId.toString(),
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  title: Text(
                    _afterPost.title,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  subtitle: Text(
                    _afterPost.body,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  trailing: Text(
                    _afterPost.id.toString(),
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
