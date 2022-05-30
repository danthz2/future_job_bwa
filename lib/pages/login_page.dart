import 'package:flutter/material.dart';
import 'package:future_job/models/user_model.dart';
import 'package:future_job/providers/auth_provider.dart';
import 'package:future_job/providers/user_provider.dart';
import 'package:future_job/services/themes.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void showError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context);
    final userProv = Provider.of<UserProvider>(context);

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        children: [
          SizedBox(
            height: 56,
          ),
          Text(
            "Sign Up",
            style: poppinsGrey400.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "Build Your Career",
            style: poppinsBlack600.copyWith(fontSize: 24),
          ),
          SizedBox(
            height: 40,
          ),
          Image.asset(
            "assets/image_sign_in.png",
            height: 240,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Email Address",
            style: poppinsGrey300.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 45,
            child: TextFormField(
              controller: emailC,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: greyC.withOpacity(0.5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: purpleC),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Password",
            style: poppinsGrey300.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 45,
            child: TextFormField(
              obscureText: true,
              controller: passwordC,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: greyC.withOpacity(0.5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: purpleC),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  onPressed: () async {
                    if (emailC.text.isEmpty || passwordC.text.isEmpty) {
                      showError('Field harus diisi');
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                      UserModel? user = await authProv.login(
                        emailC.text.trim(),
                        passwordC.text.trim(),
                      );
                      setState(() {
                        isLoading = false;
                      });
                      if (user == null) {
                        showError('Email atau Password salah');
                      } else {
                        userProv.user = user;
                        Navigator.pushNamed(context, '/home');
                      }
                    }
                  },
                  child: Text("Sign In"),
                  style: ElevatedButton.styleFrom(
                    primary: purpleC,
                    fixedSize: Size(MediaQuery.of(context).size.width, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/register'),
            child: Text(
              "Create New Account",
              style: poppinsGrey300,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
