import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future_job/models/jobs_model.dart';
import 'package:http/http.dart' as http;

class JobProvider extends ChangeNotifier {
  Future<List<JobsModel>> getJob() async {
    var response =
        await http.get(Uri.parse("https://bwa-jobs.herokuapp.com/jobs"));
    if (response.statusCode == 200) {
      List<JobsModel> jobs = [];
      List data = jsonDecode(response.body);
      data.forEach((element) {
        jobs.add(JobsModel.fromJson(element));
      });
      return jobs;
    } else {
      return <JobsModel>[];
    }
  }

  Future<List<JobsModel>> getJobByCategory(String? name) async {
    var response = await http
        .get(Uri.parse("https://bwa-jobs.herokuapp.com/jobs?category=$name"));
    if (response.statusCode == 200) {
      List<JobsModel> jobs = [];
      List data = jsonDecode(response.body);
      data.forEach((element) {
        jobs.add(JobsModel.fromJson(element));
      });
      return jobs;
    } else {
      return <JobsModel>[];
    }
  }
}
