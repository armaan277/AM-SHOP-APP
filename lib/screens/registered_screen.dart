import 'package:flutter/material.dart';

class RegisteredScreen extends StatefulWidget {
  const RegisteredScreen({super.key});

  @override
  State<RegisteredScreen> createState() => _RegisteredScreenState();
}

class _RegisteredScreenState extends State<RegisteredScreen> {
  bool isPasswordShow = true;
  bool isConfirmPasswordShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('profile_screen');
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 44),
                const Text(
                  'Register Account',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  'Complete your details or continue \n with social media',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: isConfirmPasswordShow,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    suffixIcon: isConfirmPasswordShow == true
                        ? IconButton(
                            onPressed: () {
                              isConfirmPasswordShow = false;
                              setState(() {});
                            },
                            icon: Icon(Icons.visibility),
                            color: Colors.grey,
                          )
                        : IconButton(
                            onPressed: () {
                              isConfirmPasswordShow = true;
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.visibility_off,
                            ),
                          ),
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: isPasswordShow,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    suffixIcon: isPasswordShow == true
                        ? IconButton(
                            onPressed: () {
                              isPasswordShow = false;
                              setState(() {});
                            },
                            icon: Icon(Icons.visibility),
                            color: Colors.grey,
                          )
                        : IconButton(
                            onPressed: () {
                              isPasswordShow = true;
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.visibility_off,
                            ),
                          ),
                    border: OutlineInputBorder(),
                    hintText: 'Confirm Password',
                  ),
                ),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Or sign up with',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Image.asset(
                        'images/google_icon.png',
                        height: 60,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Image.asset(
                        'images/facebook_icon.png',
                        height: 44,
                      ),
                    ),
                    SizedBox(width: 15),
                    Flexible(
                      child: Image.asset(
                        'images/twitter_icon.png',
                        height: 36,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    'By continuing, you confirm that you agree \n with our Terms and Conditions'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
