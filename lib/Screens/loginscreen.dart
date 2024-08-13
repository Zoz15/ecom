import 'package:ecomorse/Screens/login/sign_in.dart';
import 'package:ecomorse/Screens/login/sign_up.dart';
import 'package:ecomorse/Widget/widget_i_need_it.dart';
import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/main.dart';
import 'package:ecomorse/model/get_form_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    initializePrefs();
    super.initState();
  }

  void nullvar() {
    getedName = null;
    getedPassword = null;
  }

  

  void updateState(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? login()
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/image/${getRandomInt(12)}.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Find The\nBest Collections',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Get your dream item easily with Karna\nand get other interesting offers',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 45,
                          //width: (width / 2) - 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xfff3f2f2),
                            border: Border.all(color: Colors.black26),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: const Center(
                              child: Text('Sign up'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () async {
                            final category = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignIn(
                                  onback: (String newCategory) {
                                    updateState(newCategory);
                                  },
                                ),
                              ),
                            );
                            if (category != null) {
                              updateState(category);
                            }
                          },
                          child: Container(
                            height: 45,
                            width: (widthOfScreen / 2) - 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: blue,
                            ),
                            child: const Center(
                              child: Text(
                                'Sign in',
                                style: TextStyle(color: white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      '-------------------------------------- or Login With -----------------------------------',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const LoginWith(
                    name: 'Google',
                    url:
                        'https://imgs.search.brave.com/0dfkmCFWC2zrjWCenB_rDnfa_wKBmKDmxG4qSB78iQs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMtMDAuaWNvbmR1/Y2suY29tL2Fzc2V0/cy4wMC9nb29nbGUt/aWNvbi01MTJ4NTEy/LXRxYzllbDNyLnBu/Zw',
                  ),
                  const SizedBox(height: 15),
                  const LoginWith(
                    name: 'Apple',
                    url:
                        'https://imgs.search.brave.com/kz5eNXl8QIviZLx3NEyVSeHltYiq4OLIiOZFXsC6QzE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy90/aHVtYi9mL2ZhL0Fw/cGxlX2xvZ29fYmxh/Y2suc3ZnLzIyMHB4/LUFwcGxlX2xvZ29f/YmxhY2suc3ZnLnBu/Zw',
                  ),
                ],
              ),
            ),
          );
  }

  Widget login() {
    return Column(
      children: [
        Container(
          color: blue,
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '   Your Profile',
                  style: TextStyle(fontSize: 20, color: white),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 40,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xfffef7ff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: FutureBuilder(
              future: fetchUserDetils(10),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Center(child: Text("Error loading data"));
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 130,
                            width: 120,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/image/x${getRandomInt(17)}.jpeg',
                              ),
                            ),
                          ),
                          const Text(
                            'Axon plus',
                            style: TextStyle(fontSize: 30, color: blue),
                          ),
                          const Text(
                            'Mobile dev',
                            style: TextStyle(
                                fontSize: 20,
                                color: black,
                                fontWeight: FontWeight.w200),
                          ),
                          const SizedBox(height: 20),
                          MyCard(
                            icon: Icons.email,
                            text: userDetail[0].email ?? '',
                            isPassword: false,
                          ),
                          MyCard(
                            icon: Icons.lock,
                            text: userDetail[0].password ?? '',
                            isPassword: true,
                          ),
                          MyCard(
                            icon: Icons.call,
                            text: userDetail[0].phone ?? '',
                            isPassword: false,
                          ),
                          MyCard(
                            icon: Icons.location_city,
                            text: userDetail[0].address?.city ?? '',
                            isPassword: false,
                          ),
                          MyCard(
                            icon: Icons.directions_walk,
                            text: userDetail[0].address?.street ?? '',
                            isPassword: false,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red[400]),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isLogin = false;
                                  nullvar();
                                });
                                // Handle logout logic here
                              },
                              child: const Center(
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  return const Center(child: Text("Error"));
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MyCard extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isPassword;

  const MyCard({
    super.key,
    required this.icon,
    required this.text,
    this.isPassword = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool _isObscured = true;

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.grey[300],
          child: ListTile(
            title: widget.isPassword
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          _isObscured ? '*' * widget.text.length : widget.text,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: _toggleVisibility,
                        icon: Icon(_isObscured
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off),
                      ),
                    ],
                  )
                : Text(widget.text),
            leading: Icon(widget.icon),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class LoginWith extends StatelessWidget {
  final String name;
  final String url;

  const LoginWith({super.key, required this.name, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            url,
            height: 30,
            width: 30,
          ),
          const SizedBox(width: 15),
          Text(name),
        ],
      ),
    );
  }
}
