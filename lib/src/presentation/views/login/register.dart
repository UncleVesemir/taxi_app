import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:taxi_app/src/presentation/blocs/login/login_bloc.dart';
import 'package:taxi_app/src/presentation/utils/styles.dart';
import 'package:taxi_app/src/presentation/utils/utils_widget.dart';
import 'package:taxi_app/src/presentation/views/home/home.dart';
import 'package:taxi_app/src/presentation/views/login/sign_in.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isActive = false;

  void _checkFields() {
    setState(() {
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _nameController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty) {
        _isActive = true;
      } else {
        _isActive = false;
      }
    });
  }

  void _register() async {
    final LoginBloc userBloc = BlocProvider.of<LoginBloc>(context);
    var name = _nameController.text.trim().toLowerCase();
    var email = _emailController.text.trim().toLowerCase();
    var password = _passwordController.text.trim().toLowerCase();
    var phone = _phoneController.text.trim().toLowerCase();
    userBloc.add(RegisterEvent(
      email: email,
      password: password,
      name: name,
      phone: phone,
    ));
  }

  Widget _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Let\'s create your new account',
          style: AppTextStyles.signInBlack,
        ),
        SizedBox(height: 10),
        Text(
          'It does not take much time!',
          style: AppTextStyles.signInGrey,
        ),
      ],
    );
  }

  Widget _buildTextField(
      String hint, TextEditingController controller, bool hideText) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextFormField(
            onChanged: (value) => _checkFields(),
            obscureText: hideText,
            obscuringCharacter: '*',
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInButtons(LoginState state) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            text: 'Already have an account? ',
            style: AppTextStyles.hyperLinkInactive,
            children: <TextSpan>[
              TextSpan(
                text: 'Sign In',
                style: AppTextStyles.hyperLinkActive,
                recognizer: TapGestureRecognizer()
                  ..onTap = () =>
                      UtilsWidget.navigateToScreen(context, const SignInPage()),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          height: 70,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  _isActive ? Colors.deepOrange : Colors.deepOrange[200]),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            onPressed: _isActive ? () async => _register() : null,
            child:
                const Text('Register', style: AppTextStyles.boldLowValueWhite),
          ),
        ),
      ],
    );
  }

  Widget _buildTextInputs() {
    return Column(
      children: [
        _buildTextField('Your name', _nameController, false),
        const SizedBox(height: 15),
        _buildTextField('Your email', _emailController, false),
        const SizedBox(height: 15),
        _buildTextField('Phone', _phoneController, false),
        const SizedBox(height: 15),
        _buildTextField('Password', _passwordController, true),
      ],
    );
  }

  Widget _buildBody(LoginState state) {
    return Container(
      decoration: AppColors.appBackgroundGradientDecoration,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildText(),
                  const SizedBox(height: 65),
                  _buildTextInputs(),
                  const SizedBox(height: 100),
                  _signInButtons(state),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoadedState) {
              UtilsWidget.navigateToScreen(context, const Home());
            }
            if (state is LoginErrorState) {
              UtilsWidget.showInfoSnackBar(context, state.error);
            }
          },
          child: Scaffold(
            body: _buildBody(state),
          ),
        );
      },
    );
  }
}
