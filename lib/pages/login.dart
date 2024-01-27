import 'dart:async';
import 'dart:developer';
import 'dart:html';

import 'package:captiveportal/components/constants.dart';
import 'package:captiveportal/components/cp_modal.dart';
import 'package:captiveportal/components/translations.dart';
import 'package:captiveportal/components/widgets/buttons.dart';
import 'package:captiveportal/components/widgets/form_fields.dart';
import 'package:captiveportal/cubits/login_cubit.dart';
import 'package:captiveportal/datasource/create-user.dart';
import 'package:captiveportal/utils/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    this.data});
  final dynamic data;

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var uds = UsersDataSource();
  late bool hasReferrer;
  late String currentReferrer;
  String currentFullName = "";
  String currentMobileNumber = "";

  void getReferrer() {
    log('This is the referrer ${document.referrer}');
  }

  void initTranslations() {
    final loginCubit = GetIt.instance<LoginCubit>();
    loginCubit.fetchTranslations();
  }

  bool isLoading = false;
  Timer tempTimer = Timer(const Duration(seconds: 2), () {});

  List<String> getFirstNameAndLastName(String fullName) {
    int idx = fullName.indexOf(" "); // Check first occurring space
    List<String> parts = [
      fullName.substring(0, idx).trim(),
      fullName.substring(idx + 1).trim()
    ];
    return parts;
  }

  void formSubmit() async {
    setState(() {
      isLoading = true;
    });
    try{
      final result = await uds.createUser(fullName: currentFullName, mobileNumber: currentMobileNumber, email: "", referrer: currentReferrer);
      log('This is the result ${result.toString()}');
      // ignore: use_build_context_synchronously
      MyModal.genericOnFuncModal(
        ctx: context,
        statusCode: "200",
        message: result['error'] != null
          ? 'ERR ${result['error']}'
          : "Form submitted."
      );
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
        // ignore: use_build_context_synchronously
        MyModal.genericOnFuncModal(
          ctx: context,
          statusCode: "400",
          message: 'ERR: ${e.response?.data['error']}'
        );
      } else {
        debugPrint('Error sending request!');
        debugPrint('ERR ${e.message}');
        // ignore: use_build_context_synchronously
        MyModal.genericOnFuncModal(
          ctx: context,
          statusCode: "400",
          message: 'ERR ${e.message}'
        );
      }
    } catch (e) {
      debugPrint('ERR ${e.toString()}');
      // ignore: use_build_context_synchronously
      MyModal.genericOnFuncModal(
        ctx: context,
        statusCode: "400",
        message: 'ERR ${e.toString()}'
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> createUser({
    required String fullName,
    required String mobileNumber,
    required String email,
  }) async {
    try{
      final result = await uds.createUser(fullName: fullName, mobileNumber: "", email: email, referrer: currentReferrer);
      log('This is the result ${result.toString()}');
      // ignore: use_build_context_synchronously
      MyModal.genericOnFuncModal(
        ctx: context,
        statusCode: "200",
        message: result['error'] != null
          ? 'ERR ${result['error']}'
          : "Form submitted."
      );
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
        // ignore: use_build_context_synchronously
        MyModal.genericOnFuncModal(
          ctx: context,
          statusCode: "400",
          message: 'ERR: ${e.response?.data['error']}'
        );
      } else {
        debugPrint('Error sending request!');
        debugPrint('ERR ${e.message}');
        // ignore: use_build_context_synchronously
        MyModal.genericOnFuncModal(
          ctx: context,
          statusCode: "400",
          message: 'ERR ${e.message}'
        );
      }
    } catch (e) {
      debugPrint('ERR ${e.toString()}');
      // ignore: use_build_context_synchronously
      MyModal.genericOnFuncModal(
        ctx: context,
        statusCode: "400",
        message: 'ERR ${e.toString()}'
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    tempTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    hasReferrer = document.referrer.trim() != "";
    currentReferrer = document.referrer.trim() != "" ? document.referrer.trim() : "null";
    getReferrer();
    initTranslations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    log(currentFullName);
    log(currentMobileNumber);
    final loginCubit = GetIt.instance<LoginCubit>();
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        bloc: loginCubit,
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://captive-portal-html-imtg.vercel.app/tekqore.jpg',
                    ),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white.withOpacity(0.75),
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 320),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.withOpacity(0.75)),
                          borderRadius: BorderRadius.circular(24)),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(
                              height: 24,
                            ),
                            MyFormField(
                                hintText: "Email or username",
                                onChanged: (value) {
                                  setState(() {
                                    currentFullName = value;
                                  });
                                },
                                onFieldSubmitted: (value) {
                                  setState(() {
                                    currentFullName = value;
                                  });
                                },
                                keyboardType: TextInputType.text,
                                /* inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'^[a-zA-Z ]+$'),
                                  ),
                                ], */
                            ).animate().fadeIn(delay: 250.ms).slideX(begin: .25),
                            const SizedBox(
                              height: 12,
                            ),
                            MyFormField(
                                hintText: "Password",
                                onChanged: (value) {
                                  setState(() {
                                    currentMobileNumber = value;
                                  });
                                },
                                onFieldSubmitted: (value) {
                                  setState(() {
                                    currentMobileNumber = value;
                                  });
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'^[0-9]+$'),
                                  ),
                                ],
                            ).animate().fadeIn(delay: 500.ms).slideX(begin: .25),
                            const SizedBox(
                              height: 24,
                            ),
                            MyFilledButton(
                              buttonText: "LOGIN",
                              onPressed: () {
                                GetIt.instance<GoRouter>().goNamed(RouteNames.dashboard.name);
                              },
                              buttonStyle: MyTheme.buttonStyleTypeA(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 24,
                                  horizontal: 12
                                ),
                                isRounded: true
                              ),
                            ).animate().fadeIn(delay: 1000.ms).slideX(begin: .25),
                            // GestureDetector(
                            //   onTap: () {
                            //     // formSubmit();
                            //     GetIt.instance<GoRouter>().goNamed(RouteNames.dashboard.name);
                            //   },
                            //   child: Container(
                            //     padding: const EdgeInsets.all(8),
                            //     decoration: BoxDecoration(
                            //         color: Colors.deepPurple,
                            //         border: Border.all(color: Colors.deepPurple),
                            //         borderRadius: BorderRadius.circular(24)),
                            //     child: Center(
                            //       child: Text(
                            //         "LOGIN",
                            //         style: TextStyle(
                            //           color: Colors.white,
                            //           fontFamily: GoogleFonts.montserrat().fontFamily,
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 14),
                            //       )
                            //     ),
                            //   ).animate().fadeIn(delay: 1000.ms).slideX(begin: .25),
                            // ),
                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if(isLoading)
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.50),
                  child: const Center(child: CircularProgressIndicator()),
                )
              ],
            ),
          );
        }
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
