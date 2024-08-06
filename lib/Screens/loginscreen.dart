import 'dart:math';

import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/main.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  int getRandomInt() {
    return Random().nextInt(11) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/image/${getRandomInt()}.jpeg',
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
              'Get your dream item easily with Karna\mand get other interesting offers',
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
                    child: const Center(
                      child: Text('Sign up'),
                    ),
                  ),
                ),
                const Size(
                  w: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 45,
                    width: (width / 2) - 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: blue,
                      // border: Border.all(),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: white),
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
            ContinueWith(
              name: 'Google',
              url:
                  'https://imgs.search.brave.com/0dfkmCFWC2zrjWCenB_rDnfa_wKBmKDmxG4qSB78iQs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMtMDAuaWNvbmR1/Y2suY29tL2Fzc2V0/cy4wMC9nb29nbGUt/aWNvbi01MTJ4NTEy/LXRxYzllbDNyLnBu/Zw',
            ),
            const Size(h: 15),
            ContinueWith(
              name: 'Apple',
              url:
                  'https://imgs.search.brave.com/kz5eNXl8QIviZLx3NEyVSeHltYiq4OLIiOZFXsC6QzE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy90/aHVtYi9mL2ZhL0Fw/cGxlX2xvZ29fYmxh/Y2suc3ZnLzIyMHB4/LUFwcGxlX2xvZ29f/YmxhY2suc3ZnLnBu/Zw',
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ContinueWith extends StatelessWidget {
  String url;
  String name;
  ContinueWith({
    super.key,
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width - 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black26),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              url,
              height: 25,
              width: 25,
            ),
            const Size(w: 10),
            Text('Continue with $name')
          ],
        ),
      ),
    );
  }
}
