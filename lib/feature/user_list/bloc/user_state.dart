import 'package:interview_task/core/network/model/random_user_response_model.dart';

class UserState {}

class LoadList extends UserState {
  final List<Result> items;

  LoadList(this.items);
}

class NoDataState extends UserState {}
