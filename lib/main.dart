import 'package:flutter/material.dart';
import 'package:future_job/models/jobs_model.dart';
import 'package:future_job/pages/category_page.dart';
import 'package:future_job/pages/detail_job_page.dart';
import 'package:future_job/pages/get_started.dart';
import 'package:future_job/pages/home_page.dart';
import 'package:future_job/pages/login_page.dart';
import 'package:future_job/pages/register_page.dart';
import 'package:future_job/pages/splash_screen.dart';
import 'package:future_job/providers/auth_provider.dart';
import 'package:future_job/providers/category_provider.dart';
import 'package:future_job/providers/jobs_provider.dart';
import 'package:future_job/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  JobsModel? category;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<JobProvider>(
          create: (context) => JobProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/register': (context) => RegisterPage(),
          '/login': (context) => LoginPage(),
          '/getstarted': (context) => GetStarted(),
          '/home': (context) => HomePage(),
          '/category': (context) => CategoryPage(category: category),
          '/detail_job': (context) => DetailJobPage(),
        },
      ),
    );
  }
}
