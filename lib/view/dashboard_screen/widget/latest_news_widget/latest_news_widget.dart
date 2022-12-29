import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/dashboard_screen/widget/latest_news_widget/widgets/widgets.dart';
import 'package:intl/intl.dart';

class LatestNewsWidget extends StatelessWidget {
  const LatestNewsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FutureBuilder(
          future: dashCtrl.dashBoardFetch(
              data: dashCtrl.switcherIndex4.value == 1
                  ? dashCtrl.academicData
                  : dashCtrl.generalData),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Error Occured");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CupertinoActivityIndicator(
                color: kBlack,
                radius: 20.sp,
              ));
            } else if (snapshot.data == null) {
              return const Text("No data found");
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount:
                    dashCtrl.dashboardData.value?.data.latestNews.length ?? 0,
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                itemBuilder: (context, index) {
                  var date = dashCtrl
                      .dashboardData.value?.data.latestNews[index].updatedAt;
                  String formattedDate =
                      DateFormat('MMM d,y').format(date ?? DateTime.parse(" "));
                  String formattedtime =
                      DateFormat('hh:mm a').format(date ?? DateTime.parse(" "));

                  return SlideInRight(
                    child: latestNewsColumnTile(
                        index, formattedDate, formattedtime),
                  );
                },
              );
            }
          }),
    );
  }
}
