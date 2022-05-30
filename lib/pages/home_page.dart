import 'package:flutter/material.dart';
import 'package:future_job/models/category_model.dart';
import 'package:future_job/models/jobs_model.dart';
import 'package:future_job/providers/category_provider.dart';
import 'package:future_job/providers/jobs_provider.dart';
import 'package:future_job/providers/user_provider.dart';
import 'package:future_job/services/themes.dart';
import 'package:future_job/widgets/category_card.dart';
import 'package:future_job/widgets/job_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provCategory = Provider.of<CategoryProvider>(context);
    final provJob = Provider.of<JobProvider>(context);
    final userProv = Provider.of<UserProvider>(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Howdy",
                      style: poppinsGrey400.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      userProv.user?.name ?? '-',
                      style: poppinsBlack600.copyWith(fontSize: 24),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: purpleC),
                        color: whiteC,
                      ),
                    ),
                    Image.asset(
                      "assets/image_profile.png",
                      height: 48,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              "Hot Categories",
              style: poppinsBlack400.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 200,
            child: FutureBuilder<List<CategoryModel>>(
                future: provCategory.getCategory(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    int index = 0;
                    var data = snapshot.data ?? [];
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: data.map((e) {
                        index++;
                        return Container(
                          padding: EdgeInsets.only(
                              left: index == 1 ? horizontalPadding : 0),
                          child: CategoryCard(
                            category: e,
                          ),
                        );
                      }).toList(),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              "Just Posted",
              style: poppinsBlack400.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          FutureBuilder<List<JobsModel>>(
              future: provJob.getJob(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data ?? [];
                  return Column(
                    children: data.map((e) {
                      return JobCard(
                        jobs: e,
                      );
                    }).toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              "assets/icon_home.png",
              width: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              "assets/icon_notification.png",
              width: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              "assets/icon_love.png",
              width: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              "assets/icon_user.png",
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
