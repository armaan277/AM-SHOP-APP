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
          icon: const Icon(
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
                const SizedBox(height: 44),
                const Text(
                  'Register Account',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  textAlign: TextAlign.center,
                  'Complete your details or continue \n with social media',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),
                const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: isConfirmPasswordShow,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    suffixIcon: isConfirmPasswordShow == true
                        ? IconButton(
                            onPressed: () {
                              isConfirmPasswordShow = false;
                              setState(() {});
                            },
                            icon: const Icon(Icons.visibility),
                            color: Colors.grey,
                          )
                        : IconButton(
                            onPressed: () {
                              isConfirmPasswordShow = true;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.visibility_off,
                            ),
                          ),
                    border: const OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: isPasswordShow,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    suffixIcon: isPasswordShow == true
                        ? IconButton(
                            onPressed: () {
                              isPasswordShow = false;
                              setState(() {});
                            },
                            icon: const Icon(Icons.visibility),
                            color: Colors.grey,
                          )
                        : IconButton(
                            onPressed: () {
                              isPasswordShow = true;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.visibility_off,
                            ),
                          ),
                    border: const OutlineInputBorder(),
                    hintText: 'Confirm Password',
                  ),
                ),
                const SizedBox(height: 40),
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
                    child: const Center(
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
                const SizedBox(height: 25),
                const Text(
                  'Or sign up with',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Image.asset(
                        'images/google_icon.png',
                        height: 60,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Image.asset(
                        'images/facebook_icon.png',
                        height: 44,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Flexible(
                      child: Image.asset(
                        'images/twitter_icon.png',
                        height: 36,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
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
