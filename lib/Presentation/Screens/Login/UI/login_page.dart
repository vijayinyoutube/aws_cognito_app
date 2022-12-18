import 'package:flutter/material.dart';

import '../../../Components/app_bar.dart';
import '../../../Components/primary_btn.dart';
import '../../../Components/spacer.dart';
import '../../../Declarations/Constants/Images/image_files.dart';
import '../../../Declarations/Constants/constants.dart';
import '../Widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(appBarTitle: widget.title),
      body: Padding(
        padding: kHPadding,
        child: Column(children: [
          Image.asset(
            loginImages[0],
            width: 350,
            height: 350,
            fit: BoxFit.cover,
          ),
          InputField(
              controller: userNameController,
              isPassword: false,
              labelTxt: 'Email',
              icon: Icons.person),
          HeightSpacer(myHeight: kSpacing),
          InputField(
              controller: passwordController,
              isPassword: true,
              labelTxt: 'Password',
              icon: Icons.lock),
          HeightSpacer(myHeight: kSpacing),
          PrimaryBtn(
              btnText: 'Login',
              btnFun: () =>
                  login(userNameController.text, passwordController.text))
        ]),
      ),
    );
  }

  login(String userName, String password) {
    print('Hai');
  }
}
