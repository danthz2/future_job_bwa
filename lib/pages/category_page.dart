import 'package:flutter/material.dart';
import 'package:future_job/models/category_model.dart';
import 'package:future_job/models/jobs_model.dart';
import 'package:future_job/providers/jobs_provider.dart';
import 'package:future_job/services/themes.dart';
import 'package:future_job/widgets/job_card.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final JobsModel? category;
  CategoryPage({this.category});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;
    final provJob = Provider.of<JobProvider>(context);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 24, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              image: DecorationImage(
                  image: NetworkImage(arguments.imageUrl ?? '-'),
                  fit: BoxFit.cover),
            ),
            width: 360,
            height: 270,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  arguments.name ?? '-',
                  style: poppinsWhite600.copyWith(fontSize: 24),
                ),
                Text(
                  "12,309 available",
                  style: poppinsWhite400.copyWith(fontSize: 16),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  "Big Companies",
                  style: poppinsBlack400.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              FutureBuilder<List<JobsModel>>(
                future: provJob.getJobByCategory(arguments.name ?? '-'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data ?? [];
                    return Column(
                        children: data.map((e) {
                      return JobCard(
                        jobs: e,
                      );
                    }).toList());
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  "New Startups",
                  style: poppinsBlack400.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              FutureBuilder<List<JobsModel>>(
                future: provJob.getJob(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var data = snapshot.data ?? [];
                    return Column(
                        children: data.map((e) {
                      return JobCard(
                        jobs: e,
                      );
                    }).toList());
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
