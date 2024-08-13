import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/model/get_form_api.dart';
import 'package:flutter/material.dart';

String name = "jimmie_k";
String password = "klein*#%*";

class SignIn extends StatefulWidget {
  final Function(String)? onback;
  SignIn({super.key, required this.onback});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'C A R T  C R A Z E',
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'font3',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Login in',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'font1',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        MyCard(text: 'Enter your name'),
                        const SizedBox(height: 15),
                        MyCard(text: 'Password', isemail: false),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () async {
                            setprefs(
                              name,
                              password,
                            );

                            int statescode = await login(name, password);

                            if (statescode == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login Success')),
                              );
                              isLogin = true;
                              if (widget.onback != null) {
                                widget.onback!(selectedCategory);
                              }
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Failed to Login')),
                              );
                            }
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: blue,
                            ),
                            child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(color: white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Text('Made with ♥ by Axon'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MyCard extends StatelessWidget {
  MyCard({
    super.key,
    required this.text,
    this.isemail = true,
  });

  final TextEditingController _controlleemail =
      TextEditingController(text: 'jimmie_k');
  final TextEditingController _controllerpassword =
      TextEditingController(text: 'klein*#%*');

  String text = '';
  bool isemail;
  String x = '';
  // String text = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: 250,
      child: TextField(
        controller: isemail ? _controlleemail : _controllerpassword,
        decoration: InputDecoration(
          labelText: text,
          border: const OutlineInputBorder(),
        ),
        obscureText: isemail ? false : true,
        onChanged: (value) {
          if (isemail) {
            name = value;
          } else {
            password = value;
          }
        },
        onSubmitted: (value) {
          if (isemail) {
            name = value;
          } else {
            password = value;
          }
        },
      ),
    );
  }
}
