// ignore_for_file: unnecessary_statements, use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:result_templte/models/user.dart';
import 'package:result_templte/repositories/main_repository.dart';
import 'package:result_templte/services/hive_service.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.lang) : super(const AppLoading(null));

  final String lang;

  Future init() async {
    final _service = MainRepository();
    await _service.init(lang);

    await refresh();
  }

  Future refresh() async {
    emit(AppLoading(state.user));

    final user = GetIt.I<HiveService>().getUser();

    emit(AppInitial(user));
  }
}
