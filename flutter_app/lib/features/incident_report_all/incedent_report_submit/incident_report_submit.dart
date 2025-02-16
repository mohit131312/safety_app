import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_elevated_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/incident_report_all/Incident_report_details_again/incident_report_details_again.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

class IncidentReportSubmit extends StatelessWidget {
  const IncidentReportSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 4,
            vertical: SizeConfig.heightMultiplier * 2,
          ),
          child: SizedBox(
            height: SizeConfig.heightMultiplier * 100,
            width: SizeConfig.widthMultiplier * 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/Success.png',
                  height: 125,
                  width: 125,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 7,
                ),
                AppTextWidget(
                  text: 'Created Successfully!',
                  fontSize: AppTextSize.textSizeMediumm,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                AppTextWidget(
                  text: 'Incident report has been created successfully.',
                  fontSize: AppTextSize.textSizeSmalle,
                  fontWeight: FontWeight.w500,
                  color: AppColors.searchfeild,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 33,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: AppElevatedButton(
                        text: 'Done',
                        onPressed: () {
                          Get.off(IncidentReportDetailsAgain());
                        })),
                SizedBox(height: SizeConfig.heightMultiplier * 5),
              ],
            ),
          )),
    );
  }
}
