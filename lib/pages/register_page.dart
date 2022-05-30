import 'package:flutter/material.dart';
import 'package:future_job/models/user_model.dart';
import 'package:future_job/providers/auth_provider.dart';
import 'package:future_job/providers/user_provider.dart';
import 'package:future_job/services/themes.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController goalC = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context);
    final userProv = Provider.of<UserProvider>(context);

    void showError(String message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

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
            "Begin New Journey",
            style: poppinsBlack600.copyWith(fontSize: 24),
          ),
          SizedBox(
            height: 50,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: purpleC),
                  color: whiteC,
                ),
              ),
              Image.asset(
                "assets/image_profile.png",
                height: 120,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Full Name",
            style: poppinsGrey300.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 45,
            child: TextFormField(
              controller: nameC,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: purpleC),
                ),
                filled: true,
                fillColor: greyC.withOpacity(0.5),
              ),
            ),
          ),
          SizedBox(
            height: 20,
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
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: purpleC),
                ),
                filled: true,
                fillColor: greyC.withOpacity(0.5),
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
              controller: passwordC,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: purpleC),
                ),
                filled: true,
                fillColor: greyC.withOpacity(0.5),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Your Goal",
            style: poppinsGrey300.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 45,
            child: TextFormField(
              controller: goalC,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: purpleC),
                ),
                filled: true,
                fillColor: greyC.withOpacity(0.5),
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
                    if (nameC.text.isEmpty ||
                        emailC.text.isEmpty ||
                        passwordC.text.isEmpty ||
                        goalC.text.isEmpty) {
                      showError('Field harus diisi');
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                      UserModel? user = await authProv.register(
                        emailC.text.trim(),
                        passwordC.text.trim(),
                        nameC.text.trim(),
                        goalC.text.trim(),
                      );

                      setState(() {
                        isLoading = false;
                      });
                      if (user == null) {
                        showError('email sudah terdaftar');
                      } else {
                        userProv.user = user;
                        Navigator.pushNamed(context, '/login');
                      }
                    }
                  },
                  child: Text("Sign Up"),
                  style: ElevatedButton.styleFrom(
                    primary: purpleC,
                    fixedSize: Size(MediaQuery.of(context).size.width, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Text(
              "Back to Sign In",
              style: poppinsGrey300,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
