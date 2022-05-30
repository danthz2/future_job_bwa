import 'package:flutter/material.dart';
import 'package:future_job/services/themes.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding + 6),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/onboarding.png"), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              "Build Your Next\nFuture Career Like\na Master",
              style: poppinsWhite400.copyWith(
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "18,000 jobs available",
              style: poppinsWhite400,
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    "Get Started",
                    style: poppinsPurple600,
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 45),
                    primary: whiteC,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text("Sign in"),
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(200, 45),
                  primary: whiteC,
                  side: BorderSide(color: whiteC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
