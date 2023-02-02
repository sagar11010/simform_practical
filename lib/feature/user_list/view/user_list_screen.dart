import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/feature/user_list/bloc/user_cubit.dart';
import 'package:interview_task/feature/user_list/bloc/user_state.dart';
import 'package:interview_task/shared/contstants/strings.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(Strings.randomUser)),
        body: BlocBuilder<UserCubit, UserState>(
            bloc: UserCubit()..setLocalData(),
            builder: (BuildContext context, UserState state) {
              return state is LoadList && state.items.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        var user = state.items[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(user.picture!.thumbnail!),
                          ),
                          title: Text(user.name!.first!),
                          subtitle:  Text(user.email!),
                          onTap: () {},
                        );
                      },
                    )
                  : Center(child: const CircularProgressIndicator());
            }));
  }
}
