import 'package:batch28_api_starter/model/user_model.dart';
import 'package:batch28_api_starter/repository/user_respository.dart';
import 'package:batch28_api_starter/utils/display_message.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _countryController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  _registerUser(User user) async {
    bool isLogin = await UserRepository().registerUser(user);
    if (isLogin) {
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }

  _displayMessage(bool isLogin) {
    if (isLogin) {
      displaySuccessMessage(context, 'User registered successfully');
    } else {
      displayErrorMessage(context, 'User registration failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(238, 30, 106, 248),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('RECAN REGISTRATION'),
        backgroundColor: const Color.fromARGB(238, 30, 106, 248),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right:10, top: 25, bottom: 15),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    fillColor: Color.fromARGB(218, 248, 236, 236),
                    filled: true,
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    fillColor: Color.fromARGB(218, 248, 236, 236),
                    filled: true,
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter adress';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _countryController,
                  decoration: const InputDecoration(
                    fillColor: Color.fromARGB(218, 248, 236, 236),
                    filled: true,
                    labelText: 'Country',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter country';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    fillColor: Color.fromARGB(218, 248, 236, 236),
                    filled: true,
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter phone';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    fillColor: Color.fromARGB(218, 248, 236, 236),
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
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    fillColor: Color.fromARGB(218, 248, 236, 236),
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
                const SizedBox(height: 10),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    fillColor: Color.fromARGB(218, 248, 236, 236),
                    filled: true,
                    labelText: 'Confirm password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter confirm password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25.0),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      User user = User(
                        email: _emailController.text,
                        address: _addressController.text,
                        country: _countryController.text,
                        phone: _phoneController.text,
                        username: _usernameController.text,
                        password: _passwordController.text,
                      );
                      _registerUser(user);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 20, top: 2),
                    height: 50.0,
                    width: 135.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(248, 235, 161, 25)),
                    child: Container(
                        padding: const EdgeInsets.only(left: 20, top: 0),
                        child: const Center(
                            child: Text('SUBMIT',
                                style: TextStyle(
                                    fontFamily: 'nunito',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)))),
                  ),
                ),
                const SizedBox(height: 18),
                    SizedBox(
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                // const SizedBox(height: 8),
                // ElevatedButton(
                //   onPressed: () {
                //     if (_formKey.currentState!.validate()) {
                //       User user = User(
                //         email: _emailController.text,
                //         address: _addressController.text,
                //         country: _countryController.text,
                //         phone: _phoneController.text,
                //         username: _usernameController.text,
                //         password: _passwordController.text,
                //       );
                //       _registerUser(user);
                //     }
                //   },

                //   child: const Text(
                //     'Register',
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
