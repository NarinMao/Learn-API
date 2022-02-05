import 'package:api/models/post_model.dart';
import 'package:api/post_bloc/post_bloc.dart';
import 'package:api/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FectDataWithBlocl extends StatefulWidget {
  const FectDataWithBlocl({Key? key}) : super(key: key);

  @override
  _FectDataWithBloclState createState() => _FectDataWithBloclState();
}

class _FectDataWithBloclState extends State<FectDataWithBlocl>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fecth Data With Bloc',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return _buildLoading();
          } else {
            if (state is PostLoaded) {
              return _buildList(state.postList);
            } else {
              return _buildError(context, 'Something went wrong!');
            }
          }
        },
      ),
    );
  }

  Center _buildError(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              LoadingWidget.buildLoading(context, 'Loaddong...!');
              BlocProvider.of<PostBloc>(context).add(GetPostEvent());
              Navigator.pop(context);
            },
            icon: const Icon(Icons.refresh),
          ),
          Text(
            message,
            style: const TextStyle(fontSize: 18.0, color: Colors.redAccent),
          )
        ],
      ),
    );
  }

  ListView _buildList(List<PostModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        var data = list[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(
                data.userId.toString(),
              ),
            ),
            title: Text(
              data.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            subtitle: Text(
              data.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              data.id.toString(),
              style:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  Center _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
