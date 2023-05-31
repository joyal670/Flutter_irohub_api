import 'package:api_example/model/gender.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GenderType? _genderType;

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
                        decoration: const InputDecoration(
                            hintText: 'Enter firstname',
                            hintStyle: TextStyle()),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Enter lastname', hintStyle: TextStyle()),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Enter email Id', hintStyle: TextStyle()),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: 'Enter mobile number',
                            hintStyle: TextStyle()),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Enter lastname', hintStyle: TextStyle()),
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
                          onPressed: () {},
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
}
