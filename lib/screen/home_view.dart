import 'package:api/controller/post_controller.dart';
import 'package:api/models/post_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: FutureBuilder<List<PostModel>>(
          future: PostController().fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return _buildError(snapshot);
            } else {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _loadingError(snapshot);
              } else {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    var data = snapshot.data![index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(data.userId.toString()),
                      ),
                      title: Text(
                        data.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        data.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        data.id.toString(),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: snapshot.data!.length,
                );
              }
            }
          }),
    );
  }
}

Center _buildError(AsyncSnapshot<Object?> snapshot) {
  return Center(
    child: Text('${snapshot.error}'),
  );
}

Center _loadingError(AsyncSnapshot<Object?> snapshot) {
  return Center(
    child: Text('${snapshot.error}'),
  );
}
