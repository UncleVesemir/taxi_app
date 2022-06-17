import 'package:flutter/material.dart';
import 'package:taxi_app/src/presentation/utils/styles.dart';

import 'register.dart';
import 'sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _buildBody() {
    return Container(
      decoration: AppColors.appBackgroundGradientDecoration,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),
              // Image.asset('assets/images/login.png'),
              Column(
                children: const [
                  Text(
                    'Daily operations on the go.',
                    style: AppTextStyles.loginBlack,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Enjoy simpler banking on the go with the Banking App. Available for our customers.',
                    style: AppTextStyles.loginGrey,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext ctx) =>
                                  const RegisterPage(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Register',
                            style: AppTextStyles.boldLowValueBlack,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext ctx) => const SignInPage(),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: AppTextStyles.boldLowValueWhiteMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
}
