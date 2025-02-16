import 'package:flutter/material.dart';
import 'package:flutter_app/features/incident_report_all/incident_report/incident_report_screen.dart';
import 'package:flutter_app/features/induction_training/induction_training_screen.dart';
import 'package:flutter_app/features/project_labour/project_labour_screen.dart';
import 'package:flutter_app/features/safety_violation_all/safety_violation/sefety_violation_screen.dart';
import 'package:flutter_app/features/toolbox_training_all/toolbox_training/toolbox_training_screen.dart';
import 'package:flutter_app/features/work_permit_all/work_permit/work_permit_screen.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      {'img': "assets/icons/bag.png", 'label': 'Work Permit (WP)'},
      {'img': "assets/icons/TBT.png", 'label': 'Toolbox Training (TBT)'},
      {'img': "assets/icons/User.png", 'label': 'Induction Training'},
      {'img': "assets/icons/SA.png", 'label': 'Safety Violation'},
      {'img': "assets/icons/IR.png", 'label': 'Incident Report'},
      {'img': "assets/icons/Labours.png", 'label': 'Project Labour'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
        childAspectRatio: 2.7,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            switch (index) {
              case 0:
                Get.to(WorkPermitScreen());
                break;
              case 1:
                Get.to(ToolboxTrainingScreen());
                break;
              case 2:
                Get.to(InductionTrainingScreen());
                break;
              case 3:
                Get.to(SefetyViolationScreen());
                break;
              case 4:
                Get.to(IncidentReportScreen());
                break;
              case 5:
                Get.to(ProjectLabourScreen());
                break;

              default:
                break;
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 227, 226, 226)),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: SizeConfig.widthMultiplier * 3.5,
                  child: Image.asset(
                    actions[index]['img']!,
                    color: AppColors.buttoncolor,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Flexible(
                  child: Text(
                    actions[index]['label'].toString(),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: AppTextSize.textSizeSmalle,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
