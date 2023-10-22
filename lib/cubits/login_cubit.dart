import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:captiveportal/components/translations.dart';
import 'package:captiveportal/cubits/enums.dart';
import 'package:captiveportal/datasource/create-user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  late final UsersDataSource datasource;
  LoginCubit() : super(const LoginState()) {
    datasource = UsersDataSource();
  }

  void fetchTranslations() async {
    // Update State: status with new value
    //emit(state.copyWith(status: StateStatus.loading));
    final serviceLocator = GetIt.instance;
    final FlutterSecureStorage storage = serviceLocator<FlutterSecureStorage>();
    final language = await storage.read(key: 'languageCode');
    log('This is the language $language');
    emit(
      state.copyWith(
        status: StateStatus.loaded,
        language: language != "en"
          ? Languages.japanese
          : Languages.english
      ),
    );
  }

  void updateTranslations({
    required String currentCode
  }) async {
    // Update State: status with new value
    //emit(state.copyWith(status: StateStatus.loading));
    final serviceLocator = GetIt.instance;
    final FlutterSecureStorage storage = serviceLocator<FlutterSecureStorage>();
    await storage.write(key: 'languageCode', value: currentCode);
    emit(
      state.copyWith(
        status: StateStatus.loaded,
        language: currentCode == "en"
          ? Languages.english
          : Languages.japanese
      ),
    );

    final language = await storage.read(key: 'languageCode');
    log('This is the language $language');
  }
}
