import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_medium_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/work_permit_all/work_permit_maker/new_work_permit/new_work_permit_controller.dart';
import 'package:flutter_app/features/work_permit_all/work_permit_maker/work_permit_precaution/work_permit_precaution_controller.dart';
import 'package:flutter_app/features/work_permit_all/work_permit_maker/work_permit_preview/work_permit_preview_controller.dart';
import 'package:flutter_app/features/work_permit_all/work_permit_maker/work_submit/work_submit_screen.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

class WorkPermitPreviewScreen extends StatelessWidget {
  WorkPermitPreviewScreen({super.key});

  final NewWorkPermitController newWorkPermitController =
      Get.put(NewWorkPermitController());

  final WorkPermitPreviewController workPermitPreviewController =
      Get.put(WorkPermitPreviewController());

  final WorkPermitPrecautionController workPermitPrecautionController =
      Get.put(WorkPermitPrecautionController());
  void showConfirmationDialogWorkPermit(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Colors.white,
          title: AppTextWidget(
            text: 'Are You Sure?',
            fontSize: AppTextSize.textSizeMediumm,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          content: AppTextWidget(
              text: 'Are you sure you want to submit labour\'s details?',
              fontSize: AppTextSize.textSizeSmall,
              fontWeight: FontWeight.w500,
              color: AppColors.searchfeild),
          actions: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: AppTextWidget(
                        text: 'No',
                        fontSize: AppTextSize.textSizeSmallm,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(WorkSubmitScreen());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.buttoncolor,
                        borderRadius: BorderRadius.circular(12)),
                    child: AppTextWidget(
                        text: 'Yes',
                        fontSize: AppTextSize.textSizeSmallm,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }

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
                text: AppTexts.preview,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4,
                vertical: SizeConfig.heightMultiplier * 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextWidget(
                    text: 'Verify & Submit',
                    fontSize: AppTextSize.textSizeMediumm,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 0.3,
                  ),
                  AppTextWidget(
                    text: 'Verify the details,',
                    fontSize: AppTextSize.textSizeSmall,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryText,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.5,
                  ),
                ],
              ),
            ),
            Obx(
              () => workPermitPreviewController.workpermitExpanded.value
                  ? Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 4,
                        vertical: SizeConfig.heightMultiplier * 2,
                      ),
                      width: SizeConfig.widthMultiplier * 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFFEFEFE),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 20,
                            spreadRadius: 0,
                            offset: Offset(0, -4),
                          ),
                        ],
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Image.asset(
                                        'assets/icons/User_orange.png')),
                                SizedBox(
                                  width: 5,
                                ),
                                AppTextWidget(
                                  text: 'Work Permit Details',
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttoncolor,
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      workPermitPreviewController
                                          .toggleExpansionWorkpermit();
                                    },
                                    child: Icon(Icons.keyboard_arrow_up)),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 2,
                            ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: SizeConfig.widthMultiplier * 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        AppTextWidget(
                                            text: 'Name of Work Permit',
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        AppTextWidget(
                                            text: newWorkPermitController
                                                    .nameworkpermitController
                                                    .text
                                                    .isNotEmpty
                                                ? newWorkPermitController
                                                    .nameworkpermitController
                                                    .text
                                                : 'Date Not Available',
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primaryText),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 2.5,
                                        ),
                                        AppTextWidget(
                                            text: 'Category of Work Permit',
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        Obx(() => AppTextWidget(
                                              text: newWorkPermitController
                                                      .selectedcategory
                                                      .isNotEmpty
                                                  ? newWorkPermitController
                                                      .selectedcategory.value
                                                  : "Not available",
                                              fontSize:
                                                  AppTextSize.textSizeSmall,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primaryText,
                                            )),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 2.5,
                                        ),
                                        AppTextWidget(
                                            text: 'Toolbox Training Number',
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        Obx(() => AppTextWidget(
                                              text: newWorkPermitController
                                                      .selectedtoolboxtrainig
                                                      .isNotEmpty
                                                  ? newWorkPermitController
                                                      .selectedtoolboxtrainig
                                                      .value
                                                  : "Not available",
                                              fontSize:
                                                  AppTextSize.textSizeSmall,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primaryText,
                                            )),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 2.5,
                                        ),
                                        AppTextWidget(
                                            text: 'Start Date & Time',
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        AppTextWidget(
                                            text: '26-Dec-2023 09:00 AM',
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primaryText),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 2.5,
                                        ),
                                        AppTextWidget(
                                            text: 'End Date & Time',
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        AppTextWidget(
                                            text: '26-Dec-2023 09:00 AM',
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primaryText),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 2.5,
                                        ),
                                        AppTextWidget(
                                            text: 'Building',
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        Obx(() {
                                          var selectedBuilding =
                                              newWorkPermitController
                                                  .getSelectedBuilding();
                                          return selectedBuilding.isNotEmpty
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                      selectedBuilding.length,
                                                      (index) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: SizeConfig
                                                                  .heightMultiplier *
                                                              1.5),
                                                      child: AppTextWidget(
                                                          text:
                                                              "${selectedBuilding[index]['title']}",
                                                          fontSize: AppTextSize
                                                              .textSizeSmall,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .primaryText),
                                                    );
                                                  }),
                                                )
                                              : AppTextWidget(
                                                  text:
                                                      "No safety equipment selected",
                                                  fontSize:
                                                      AppTextSize.textSizeSmall,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.red,
                                                );
                                        }),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1.5,
                                        ),
                                        AppTextWidget(
                                            text: 'Floor',
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        Obx(() {
                                          var selectedFloor =
                                              newWorkPermitController
                                                  .getSelectedFloor();
                                          return selectedFloor.isNotEmpty
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                      selectedFloor.length,
                                                      (index) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: SizeConfig
                                                                  .heightMultiplier *
                                                              1.5),
                                                      child: AppTextWidget(
                                                          text:
                                                              "${selectedFloor[index]['title']}",
                                                          fontSize: AppTextSize
                                                              .textSizeSmall,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .primaryText),
                                                    );
                                                  }),
                                                )
                                              : AppTextWidget(
                                                  text:
                                                      "No safety equipment selected",
                                                  fontSize:
                                                      AppTextSize.textSizeSmall,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.red,
                                                );
                                        }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 4,
                        vertical: SizeConfig.heightMultiplier * 2,
                      ),
                      width: SizeConfig.widthMultiplier * 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFFEFEFE),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 20,
                            spreadRadius: 0,
                            offset: Offset(0, -4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset(
                                      'assets/icons/User_orange.png')),
                              SizedBox(
                                width: 5,
                              ),
                              AppTextWidget(
                                text: 'Work Permit Details',
                                fontSize: AppTextSize.textSizeSmall,
                                fontWeight: FontWeight.w500,
                                color: AppColors.buttoncolor,
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    workPermitPreviewController
                                        .toggleExpansionWorkpermit();
                                  },
                                  child: Icon(Icons.keyboard_arrow_up)),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 2,
                          ),
                        ],
                      ),
                    ),
            ),

            Obx(
              () => workPermitPreviewController
                      .isprecautionworkpermitExpanded.value
                  ? Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 4,
                        vertical: SizeConfig.heightMultiplier * 2,
                      ),
                      width: SizeConfig.widthMultiplier * 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFFEFEFE),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 20,
                            spreadRadius: 0,
                            offset: Offset(0, -4),
                          ),
                        ],
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Image.asset(
                                        'assets/icons/precaution.png')),
                                SizedBox(
                                  width: 5,
                                ),
                                AppTextWidget(
                                  text: AppTexts.precautiondet,
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttoncolor,
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      workPermitPreviewController
                                          .toggleExpansionPrecaution();
                                    },
                                    child: Icon(Icons.keyboard_arrow_up)),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 3,
                            ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppTextWidget(
                                          text: 'Hazards Identified',
                                          fontSize: AppTextSize.textSizeSmall,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primaryText),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2,
                                  ),
                                  Container(
                                    width: SizeConfig.widthMultiplier * 100,
                                    height: 1.5,
                                    color: AppColors.searchfeildcolor,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 3,
                                  ),
                                  Obx(() {
                                    var selectedHazards =
                                        workPermitPrecautionController
                                            .getSelectedHazards();
                                    return selectedHazards.isNotEmpty
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                selectedHazards.length,
                                                (index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: SizeConfig
                                                            .heightMultiplier *
                                                        1.5),
                                                child: AppTextWidget(
                                                  text:
                                                      "${index + 1}. ${selectedHazards[index]['title']}",
                                                  fontSize:
                                                      AppTextSize.textSizeSmall,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.searchfeild,
                                                ),
                                              );
                                            }),
                                          )
                                        : AppTextWidget(
                                            text:
                                                "No safety equipment selected",
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.red,
                                          );
                                  }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 3,
                            ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppTextWidget(
                                          text: 'Precaution In Place',
                                          fontSize: AppTextSize.textSizeSmall,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primaryText),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2,
                                  ),
                                  Container(
                                    width: SizeConfig.widthMultiplier * 100,
                                    height: 1.5,
                                    color: AppColors.searchfeildcolor,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 3,
                                  ),
                                  Obx(() {
                                    var selectedPrecaution =
                                        workPermitPrecautionController
                                            .getSelectedPrecaution();
                                    return selectedPrecaution.isNotEmpty
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                selectedPrecaution.length,
                                                (index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: SizeConfig
                                                            .heightMultiplier *
                                                        1.5),
                                                child: AppTextWidget(
                                                  text:
                                                      "${index + 1}. ${selectedPrecaution[index]['title']}",
                                                  fontSize:
                                                      AppTextSize.textSizeSmall,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.searchfeild,
                                                ),
                                              );
                                            }),
                                          )
                                        : AppTextWidget(
                                            text:
                                                "No safety equipment selected",
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.red,
                                          );
                                  }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 3,
                            ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: AppTextWidget(
                                          text:
                                              'PPE Issued And To Be Used By The Workforce',
                                          fontSize: AppTextSize.textSizeSmall,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primaryText,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2,
                                  ),
                                  Container(
                                    width: SizeConfig.widthMultiplier * 100,
                                    height: 1.5,
                                    color: AppColors.searchfeildcolor,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 3,
                                  ),
                                  Obx(() {
                                    var selectedPPE =
                                        workPermitPrecautionController
                                            .getSelectedPPE();
                                    return selectedPPE.isNotEmpty
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                selectedPPE.length, (index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: SizeConfig
                                                            .heightMultiplier *
                                                        1.5),
                                                child: AppTextWidget(
                                                  text:
                                                      "${index + 1}. ${selectedPPE[index]['title']}",
                                                  fontSize:
                                                      AppTextSize.textSizeSmall,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.searchfeild,
                                                ),
                                              );
                                            }),
                                          )
                                        : AppTextWidget(
                                            text:
                                                "No safety equipment selected",
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.red,
                                          );
                                  }),
                                ],
                              ),
                            ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: AppTextWidget(
                                          text: 'Tools & Equipment Provided',
                                          fontSize: AppTextSize.textSizeSmall,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primaryText,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2,
                                  ),
                                  Container(
                                    width: SizeConfig.widthMultiplier * 100,
                                    height: 1.5,
                                    color: AppColors.searchfeildcolor,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 3,
                                  ),
                                  Obx(() {
                                    var selectedTE =
                                        workPermitPrecautionController
                                            .getSelectedTE();
                                    return selectedTE.isNotEmpty
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                selectedTE.length, (index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: SizeConfig
                                                            .heightMultiplier *
                                                        1.5),
                                                child: AppTextWidget(
                                                  text:
                                                      "${index + 1}. ${selectedTE[index]['title']}",
                                                  fontSize:
                                                      AppTextSize.textSizeSmall,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.searchfeild,
                                                ),
                                              );
                                            }),
                                          )
                                        : AppTextWidget(
                                            text:
                                                "No safety equipment selected",
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.red,
                                          );
                                  }),
                                ],
                              ),
                            ),
                          ]),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 4,
                        vertical: SizeConfig.heightMultiplier * 2,
                      ),
                      width: SizeConfig.widthMultiplier * 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFFEFEFE),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 20,
                            spreadRadius: 0,
                            offset: Offset(0, -4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset(
                                      'assets/icons/precaution.png')),
                              SizedBox(
                                width: 5,
                              ),
                              AppTextWidget(
                                text: AppTexts.precautiondet,
                                fontSize: AppTextSize.textSizeSmall,
                                fontWeight: FontWeight.w500,
                                color: AppColors.buttoncolor,
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    workPermitPreviewController
                                        .toggleExpansionPrecaution();
                                  },
                                  child: Icon(Icons.keyboard_arrow_up)),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 3,
                          ),
                        ],
                      ),
                    ),
            ),

            //---------------------------------------------------------------------

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextWidget(
                      text: 'Checker',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryText),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Row(
                    children: [
                      Container(
                        width: SizeConfig.imageSizeMultiplier * 15,
                        height: SizeConfig.imageSizeMultiplier * 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/icons/person_labour.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextWidget(
                              text: 'Ravi Kumar',
                              fontSize: AppTextSize.textSizeSmallm,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryText),
                          AppTextWidget(
                              text: 'SAFETY OFFICER',
                              fontSize: AppTextSize.textSizeSmall,
                              fontWeight: FontWeight.w400,
                              color: AppColors.searchfeild),
                          SizedBox(
                            width: SizeConfig.widthMultiplier * 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  AppTextWidget(
                      text: 'Maker',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryText),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Row(
                    children: [
                      Container(
                        width: SizeConfig.imageSizeMultiplier * 15,
                        height: SizeConfig.imageSizeMultiplier * 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/icons/person_labour.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextWidget(
                              text: 'Ravi Kumar',
                              fontSize: AppTextSize.textSizeSmallm,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryText),
                          AppTextWidget(
                              text: 'SAFETY OFFICER',
                              fontSize: AppTextSize.textSizeSmall,
                              fontWeight: FontWeight.w400,
                              color: AppColors.searchfeild),
                          SizedBox(
                            width: SizeConfig.widthMultiplier * 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  AppTextWidget(
                      text: 'Created On',
                      fontSize: AppTextSize.textSizeSmalle,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryText),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  AppTextWidget(
                      text: '06 Oct 2024 11:14 AM',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  AppTextWidget(
                      text: 'Geolocation',
                      fontSize: AppTextSize.textSizeSmalle,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryText),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  AppTextWidget(
                      text:
                          'Sade Satra Nali, Pune, Hadapsar, 411028, Maharashtra, Pune',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: AppMediumButton(
                        label: "Edit",
                        borderColor: AppColors.buttoncolor,
                        iconColor: AppColors.buttoncolor,
                        backgroundColor: Colors.white,
                        textColor: AppColors.buttoncolor,
                        imagePath: 'assets/icons/edit.png',
                      ),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 5),
                    GestureDetector(
                      onTap: () {
                        showConfirmationDialogWorkPermit(
                            context); // Call the function
                      },
                      child: AppMediumButton(
                        label: "Submit",
                        borderColor: AppColors.backbuttoncolor,
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        backgroundColor: AppColors.buttoncolor,
                        imagePath2: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 6,
            ),
          ],
        ),
      ),
    );
  }
}
