import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/core/local/database/database.dart';
import 'package:interview_task/core/network/model/random_user_response_model.dart';
import 'package:interview_task/core/network/service/random_user_service.dart';
import 'package:interview_task/di/injector_provider.dart';
import 'package:interview_task/feature/user_list/bloc/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(NoDataState());
  final MyDatabase myDatabase = getIt<MyDatabase>();
  List<Result> userList = [];
  final RandomUserService randomUserService = RandomUserServiceImpl();

  void setLocalData() async {
    userList = await myDatabase.getUsers();
    emit(LoadList(userList));
  }

  void getUserData() async {
    var v = await randomUserService.getRandomUserList();
    v.fold((error) => print(error), (r) {
      userList = r.results!;
      emit(LoadList(userList));
    });
  }
}
