import 'package:flutter/material.dart';
import 'package:future_job/models/jobs_model.dart';
import 'package:future_job/services/themes.dart';

class JobCard extends StatelessWidget {
  final JobsModel? jobs;
  JobCard({this.jobs});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, 'detail_job', arguments: jobs),
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: horizontalPadding + 10,
            ),
            Image.network(
              jobs?.companyLogo ?? '-',
              width: 44,
            ),
            SizedBox(
              width: 27,
            ),
            Divider(),
            Container(
              width: MediaQuery.of(context).size.width * 2 / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jobs?.name ?? '-',
                    style: poppinsBlack400.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    jobs?.companyName ?? '-',
                    style: poppinsGrey400,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
