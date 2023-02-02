import 'package:get_it/get_it.dart';
import 'package:interview_task/core/local/database/database.dart';

final GetIt getIt = GetIt.I;

Future<void> setupInjection() async {
  getIt.registerSingleton<MyDatabase>(MyDatabase());
}
