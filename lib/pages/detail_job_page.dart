import 'package:flutter/material.dart';
import 'package:future_job/models/jobs_model.dart';
import 'package:future_job/services/themes.dart';
import 'package:future_job/widgets/detail_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailJobPage extends StatefulWidget {
  final JobsModel? job;
  DetailJobPage({this.job});

  @override
  State<DetailJobPage> createState() => _DetailJobPageState();
}

class _DetailJobPageState extends State<DetailJobPage> {
  bool isApplied = false;

  void setAppliedJob() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isApplied', isApplied);
  }

  Future<bool> getAppliedJob() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool('isApplied') ?? false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAppliedJob().then((value) {
      setState(() {
        isApplied = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)?.settings.arguments as JobsModel;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        children: [
          Visibility(
              visible: isApplied ?  false :true,
              child: Container(
                margin: EdgeInsets.only(top: 50),
                width: 312,
                height: 60,
                decoration: BoxDecoration(
                  color: greyC.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    "You have applied this job and the\nrecuiter will contact you",
                    style: poppinsGrey400,
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          SizedBox(
            height: isApplied ? 80 : 30,
          ),
          Image.network(
            argument.companyLogo ?? '-',
            height: 60,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            argument.name ?? '-',
            style: poppinsBlack600.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "${argument.companyName} • ${argument.location}",
            style: poppinsGrey400,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "About the job",
            style: poppinsBlack500,
          ),
          SizedBox(
            height: 16,
          ),
          Column(
              children: argument.about!.map((e) {
            return DetailItem(
              description: e,
            );
          }).toList()),
          SizedBox(
            height: 30 - 16,
          ),
          Text(
            "Qualifications",
            style: poppinsBlack500,
          ),
          SizedBox(
            height: 16,
          ),
          Column(
              children: argument.qualifications!.map((e) {
            return DetailItem(
              description: e,
            );
          }).toList()),
          SizedBox(
            height: 30 - 16,
          ),
          Text(
            "Responsibilities",
            style: poppinsBlack500,
          ),
          SizedBox(
            height: 16,
          ),
          Column(
              children: argument.responsibilities!.map((e) {
            return DetailItem(
              description: e,
            );
          }).toList()),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              print("sebelum");
              isApplied = !isApplied;
              setAppliedJob();
              setState(() {
                print("setelah");
              });
            },
            child: Text(
              isApplied ? "Apply for Job" : "Cancel Apply",
              style: poppinsWhite500,
            ),
            style: ElevatedButton.styleFrom(
                primary: isApplied ? purpleC : redC,
                fixedSize: Size(200, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60))),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Message Recruiter",
            style: poppinsGrey300,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
