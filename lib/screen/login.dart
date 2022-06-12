import 'package:batch28_api_starter/repository/user_respository.dart';
import 'package:batch28_api_starter/utils/display_message.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  _login(String username, String password) async {
    bool isLogin = await UserRepository().login(username, password);
    if (isLogin) {
      _displaymessage(true);
    } else {
      _displaymessage(false);
    }
  }

  _displaymessage(bool isLogin) {
    if (isLogin) {
      Navigator.pushNamed(context, '/dashboard');
    } else {
      displayErrorMessage(context, 'Login Failed');
    }
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(238, 30, 106, 248),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 0, top: 60, bottom: 15),
                      child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        radius: 50.0,
                        child: Icon(
                          Icons.energy_savings_leaf,
                          color: Color.fromARGB(255, 79, 216, 74),
                          size: 65.0,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 150,
                    //   child: SvgPicture.asset(
                    //     "assets/svg/student-hat-2.svg",
                    //     color: Colors.blue,
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                            _login(
                              _usernameController.text,
                              _passwordController.text,
                            );
                          }     
                          },
                          child: Container(
                            padding: const EdgeInsets.only(right: 20, top: 2),
                            height: 45.0,
                            width: 135.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(221, 79, 216, 74)
                                ),
                            child: Container(
                                padding: const EdgeInsets.only(left: 20, top: 0),
                                child: const Center(
                                    child: Text('LOGIN',
                                        style: TextStyle(
                                            fontFamily: 'nunito',
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)))),
                          ),
                        ),
                    // SizedBox(
                    //   height: 50,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       if (_formKey.currentState!.validate()) {
                    //         _login(
                    //           _usernameController.text,
                    //           _passwordController.text,
                    //         );
                    //       }
                    //     },
                    //     child: const Text(
                    //       'Login',
                    //       style: TextStyle(
                    //         fontSize: 18,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          'Register User',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
