import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isRemember = false;
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 120),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                textAlign: TextAlign.center,
                'Sign in with your email and password or \n continue with social media',
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
                obscureText: isPasswordShow == true ? isPasswordShow : false,
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
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.amber,
                        value: isRemember,
                        onChanged: (value) {
                          isRemember = value!;
                          setState(() {});
                        },
                      ),
                      const Text('Remember me'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('forget_password_screen');
                    },
                    child: const Text(
                      'Forget Password',
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('home_screen');
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account"),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('profile_screen');
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
