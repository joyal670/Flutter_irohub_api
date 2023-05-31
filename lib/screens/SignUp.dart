import 'package:api_example/data/api/api.dart';
import 'package:api_example/model/gender.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import 'home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GenderType? _genderType;

  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _genderType = GenderType.male;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/Union3.png'), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
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
                      'Create Account :)',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _fnameController,
                        decoration: const InputDecoration(
                            hintText: 'Enter firstname',
                            hintStyle: TextStyle()),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        controller: _lnameController,
                        decoration: const InputDecoration(
                            hintText: 'Enter lastname', hintStyle: TextStyle()),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            hintText: 'Enter email Id', hintStyle: TextStyle()),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        controller: _mobileController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: 'Enter mobile number',
                            hintStyle: TextStyle()),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                              value: GenderType.male,
                              groupValue: _genderType,
                              onChanged: (newValue) {
                                setState(() {
                                  _genderType = GenderType.male;
                                });
                              }),
                          const Text('Male'),
                          Radio(
                              value: GenderType.female,
                              groupValue: _genderType,
                              onChanged: (newValue) {
                                setState(() {
                                  _genderType = GenderType.female;
                                });
                              }),
                          const Text('Female')
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'Create Password',
                            hintStyle: TextStyle()),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            signUpUser();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.black),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  void signUpUser() async {
    final _fname = _fnameController.text;
    final _lname = _lnameController.text;
    final _email = _emailController.text;
    final _mobile = _mobileController.text;
    final _gender = _genderType;
    final _password = _passwordController.text;

    if (_fname.isEmpty) {
      showErrorMessage('Please enter first name');
    } else if (_lname.isEmpty) {
      showErrorMessage('Please enter last name');
    } else if (_email.isEmpty) {
      showErrorMessage('Please enter email id');
    } else if (_mobile.isEmpty) {
      showErrorMessage('Please enter mobile number');
    } else if (_password.isEmpty) {
      showErrorMessage('Please enter your password');
    } else {
      final _formData = FormData.fromMap({
        'firstname': _fname,
        'lastname': _lname,
        'email': _email,
        'mobile': _mobile,
        'gender': "male",
        'password': _password
      });

      final _result = await ApiClass().registerUserApi(_formData);

      if (_result != null) {
        if (_result.status == true) {
          showSuccessMessage(_result.message!);
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
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
    ).show(context);
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
    ).show(context);
  }
}
