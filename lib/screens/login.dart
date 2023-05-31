import 'package:api_example/data/api/api.dart';
import 'package:api_example/screens/SignUp.dart';
import 'package:api_example/screens/home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/Union2.png'), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Enter Your Username & Password',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                          hintText: 'Username', hintStyle: TextStyle()),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: 'Password', hintStyle: TextStyle()),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          loginUser();
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.black),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return RegisterScreen();
                            },
                          ));
                        },
                        child: const Text('Create a New Account'))
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void loginUser() async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;

    if (_username.isEmpty) {
      showErrorMessage('User name is required');
    } else if (_password.isEmpty) {
      showErrorMessage('Password is required');
    } else {
      final _formData =
          FormData.fromMap({'username': _username, 'password': _password});
      final _result = await ApiClass().loginUserApi(_formData);
      if (_result != null) {
        if (_result.status == true) {
          showSuccessMessage(_result.message!);
          Navigator.of(_scaffoldkey.currentContext!)
              .push(MaterialPageRoute(builder: (ctx) {
            return HomeScreen();
          }));
        } else {
          showErrorMessage(_result.message!);
        }
      }
    }
  }

  void showErrorMessage(String message) {
    MotionToast.error(
      title: const Text(
        'Error',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(message),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: false,
    ).show(_scaffoldkey.currentContext!);
  }

  void showSuccessMessage(String message) {
    MotionToast.success(
      title: const Text(
        'Success',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(message),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: false,
    ).show(_scaffoldkey.currentContext!);
  }
}
