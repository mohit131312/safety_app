import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_medium_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/incident_report_all/incident_attestation/incident_attestation.dart';
import 'package:flutter_app/features/incident_report_all/incident_more_details/incident_more_details_controller.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class IncidentMoreDetailsScreen extends StatelessWidget {
  IncidentMoreDetailsScreen({super.key});

  final IncidentMoreDetailsController incidentDetailsController =
      Get.put(IncidentMoreDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //  resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.heightMultiplier * 10),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: AppBar(
            scrolledUnderElevation: 0.0,
            elevation: 0,
            backgroundColor: AppColors.buttoncolor,
            foregroundColor: AppColors.buttoncolor,
            centerTitle: true,
            toolbarHeight: SizeConfig.heightMultiplier * 10,
            title: Padding(
              padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
              child: AppTextWidget(
                text: 'Incident Report',
                fontSize: AppTextSize.textSizeMedium,
                fontWeight: FontWeight.w400,
                color: AppColors.primary,
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: SizeConfig.heightMultiplier * 2.5,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 4,
            vertical: SizeConfig.heightMultiplier * 2,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: 0.66,
                    backgroundColor: AppColors.searchfeildcolor,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.defaultPrimary),
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '02/03',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.5,
            ),
            AppTextWidget(
              text: 'More Details',
              fontSize: AppTextSize.textSizeMediumm,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 0.3,
            ),
            AppTextWidget(
              text: 'Enter cause & preventive measures details.',
              fontSize: AppTextSize.textSizeSmalle,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryText,
            ),

            //------------------------------
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            Row(
              children: [
                AppTextWidget(
                  text: 'Root Cause',
                  fontSize: AppTextSize.textSizeSmall,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText,
                ),
                AppTextWidget(
                    text: AppTexts.star,
                    fontSize: AppTextSize.textSizeExtraSmall,
                    fontWeight: FontWeight.w400,
                    color: AppColors.starcolor),
              ],
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            Container(
              decoration: BoxDecoration(),
              child: TextFormField(
                controller: incidentDetailsController.rootcauseController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Location of Incident',
                  hintStyle: TextStyle(
                    fontSize: AppTextSize.textSizeSmall,
                    fontWeight: FontWeight.w400,
                    color: AppColors.searchfeild,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.searchfeildcolor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.searchfeildcolor, width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 126, 16, 9),
                      width: 1,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 126, 16, 9),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            Row(
              children: [
                AppTextWidget(
                  text: 'Preventive Measures',
                  fontSize: AppTextSize.textSizeMedium,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText,
                ),
                AppTextWidget(
                    text: AppTexts.star,
                    fontSize: AppTextSize.textSizeExtraSmall,
                    fontWeight: FontWeight.w400,
                    color: AppColors.starcolor),
              ],
            ),

            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: Checkbox(
                      value: incidentDetailsController.isCheckedMeasures.value,
                      activeColor: AppColors.buttoncolor,
                      side: BorderSide(
                        color: AppColors.secondaryText,
                        width: 1.2,
                      ),
                      onChanged: (bool? value) {
                        incidentDetailsController.toggleSelectAllMeasures();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 2,
                ),
                AppTextWidget(
                  text: AppTexts.selectall,
                  fontSize: AppTextSize.textSizeSmallm,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryText,
                ),
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2.5),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4,
                vertical: SizeConfig.heightMultiplier * 3,
              ),
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.appgreycolor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 5.5,
                        width: SizeConfig.widthMultiplier * 82,
                        child: TextField(
                          controller: incidentDetailsController
                              .searchMeasuresController,
                          // readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'Search here..',
                            hintStyle: TextStyle(
                              fontSize: AppTextSize.textSizeSmall,
                              fontWeight: FontWeight.w400,
                              color: AppColors.searchfeild,
                            ),
                            prefixIcon: Container(
                              padding: EdgeInsets.all(
                                  10.0), // Adjust padding as needed

                              child: Image.asset(
                                'assets/icons/Search.png',
                                fit: BoxFit
                                    .contain, // Ensures it stays within the box
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: AppColors.searchfeildcolor,
                                  width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: AppColors.searchfeildcolor,
                                  width: 0.5),
                            ),
                          ),
                          onChanged: (value) {
                            incidentDetailsController.searchDataMeasures(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 2),
                  SizedBox(
                    height: 200,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Obx(() {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: incidentDetailsController
                                  .filteredDetailsMeasures.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      visualDensity: VisualDensity.compact,
                                      contentPadding: EdgeInsets.only(
                                          top: 0,
                                          bottom: 0,
                                          left: 16,
                                          right: 16),
                                      leading: SizedBox(
                                        width: 24.0,
                                        height: 24.0,
                                        child: Checkbox(
                                          value: incidentDetailsController
                                                  .filteredDetailsMeasures[
                                              index]['isChecked'] as bool,
                                          activeColor: AppColors.buttoncolor,
                                          side: BorderSide(
                                            color: AppColors.secondaryText,
                                            width: 1.2,
                                          ),
                                          onChanged: (bool? value) {
                                            incidentDetailsController
                                                .toggleCheckboxMeasures(index);
                                          },
                                        ),
                                      ),
                                      title: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //${index + 1}.

                                          AppTextWidget(
                                            text: incidentDetailsController
                                                .filteredDetailsMeasures[index]
                                                    ['title']
                                                .toString(),
                                            fontSize:
                                                AppTextSize.textSizeExtraSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.secondaryText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 5,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: AppMediumButton(
                      label: "Previous",
                      borderColor: AppColors.buttoncolor,
                      iconColor: AppColors.buttoncolor,
                      backgroundColor: Colors.white,
                      textColor: AppColors.buttoncolor,
                      imagePath: 'assets/icons/arrow-narrow-left.png',
                    ),
                  ),
                  SizedBox(width: SizeConfig.widthMultiplier * 5),
                  GestureDetector(
                    onTap: () {
                      Get.to(IncidentAttestation());
                    },
                    child: AppMediumButton(
                      label: "Next",
                      borderColor: AppColors.backbuttoncolor,
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      backgroundColor: AppColors.buttoncolor,
                      imagePath2: 'assets/icons/arrow-narrow-right.png',
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: SizeConfig.heightMultiplier * 5),
          ]),
        ),
      ),
    );
  }
}
