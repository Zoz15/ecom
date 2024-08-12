import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/model/get_form_api.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _longController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(_emailController, 'Email'),
                  _buildTextField(_usernameController, 'Username'),
                  _buildTextField(_passwordController, 'Password',
                      obscureText: true),
                  _buildTextField(_firstnameController, 'First Name'),
                  _buildTextField(_lastnameController, 'Last Name'),
                  // _buildTextField(_cityController, 'City'),
                  // _buildTextField(_streetController, 'Street'),
                  // _buildTextField(_numberController, 'Number'),
                  // _buildTextField(_zipcodeController, 'Zipcode'),
                  // _buildTextField(_latController, 'Latitude'),
                  // _buildTextField(_longController, 'Longitude'),
                  _buildTextField(_phoneController, 'Phone'),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      final email = _emailController.text.trim();
                      final username = _usernameController.text.trim();
                      final password = _passwordController.text.trim();
                      final firstname = _firstnameController.text.trim();
                      final lastname = _lastnameController.text.trim();
                      final city = _cityController.text.trim();
                      final street = _streetController.text.trim();
                      final number = _numberController.text.trim();
                      final zipcode = _zipcodeController.text.trim();
                      final lat = _latController.text.trim();
                      final long = _longController.text.trim();
                      final phone = _phoneController.text.trim();

                      if (email.isEmpty ||
                          username.isEmpty ||
                          password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Email, Username, and Password are required')),
                        );
                        return;
                      }

                      // print('Email: $email');
                      // print('Username: $username');
                      // print('Password: $password');
                      // print('First Name: $firstname');
                      // print('Last Name: $lastname');
                      // print('City: $city');
                      // print('Street: $street');
                      // print('Number: $number');
                      // print('Zipcode: $zipcode');
                      // print('Latitude: $lat');
                      // print('Longitude: $long');
                      // print('Phone: $phone');

                      // getedName = username;
                      // getedPassword = password;
                      createUser(
                          email.isNotEmpty ? email : 'no email',
                          username.isNotEmpty ? username : 'no username',
                          password.isNotEmpty ? password : 'no password',
                          firstname.isNotEmpty ? firstname : 'no firstname',
                          lastname.isNotEmpty ? lastname : 'no lastname',
                          city.isNotEmpty ? city : 'no city',
                          street.isNotEmpty ? street : 'no street',
                          number.isNotEmpty ? number : 'no number',
                          zipcode.isNotEmpty ? zipcode : 'no zipcode',
                          lat.isNotEmpty ? lat : 'no lat',
                          long.isNotEmpty ? long : 'no long',
                          phone.isNotEmpty ? phone : 'no phone');

                      setprefs(username, password);

                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text('Made with ♥ by Axon'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        obscureText: obscureText,
      ),
    );
  }
}
