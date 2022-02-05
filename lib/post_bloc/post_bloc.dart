import 'dart:math';

import 'package:api/controller/post_controller.dart';
import 'package:api/models/post_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<GetPostEvent>((event, emit) async {
      emit(PostLoading());
      try {
        List<PostModel> list = await PostController().fetchData();
        emit(PostLoaded(postList: list));
      } catch (e) {
        emit(PostError(error: e.toString()));
      }
    });
  }
}
