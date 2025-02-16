import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_medium_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/Labour_add/add_labour_controller.dart';
import 'package:flutter_app/features/labour_documentation/labour_documentation_controller.dart';
import 'package:flutter_app/features/labour_precaution/labour_precaution_controller.dart';
import 'package:flutter_app/features/labour_preview/labour_preview_controller.dart';
import 'package:flutter_app/features/labour_professional_details/labour_profess_details_controller.dart';
import 'package:flutter_app/features/labour_submit/labour_submit.dart';
import 'package:flutter_app/features/labour_undertaking/labour_undertaking_controller.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

class LabourPreviewScreen extends StatelessWidget {
  LabourPreviewScreen({super.key});

  final LabourUndertakingController labourUndertakingController =
      Get.put(LabourUndertakingController());
  final LabourDocumentationController labourDocumentationController =
      Get.put(LabourDocumentationController());
  final LabourPreviewController labourPreviewController =
      Get.put(LabourPreviewController());
  final AddLabourController addLabourController =
      Get.put(AddLabourController());
  final LabourProfessDetailsController labourProfessDetailsController =
      Get.put(LabourProfessDetailsController());

  final LabourPrecautionController labourPrecautionController =
      Get.put(LabourPrecautionController());
  void showConfirmationDialog(BuildContext context) {
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
                        text: 'Cancel',
                        fontSize: AppTextSize.textSizeSmallm,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(LabourSubmit());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.buttoncolor,
                        borderRadius: BorderRadius.circular(12)),
                    child: AppTextWidget(
                        text: 'Submit',
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
                    text: AppTexts.previewsubmit,
                    fontSize: AppTextSize.textSizeMediumm,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 0.3,
                  ),
                  AppTextWidget(
                    text: AppTexts.checkdetailssubmit,
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
              () => labourPreviewController.isPersonalDetailsExpanded.value
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
                                  text: AppTexts.personaldetails,
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttoncolor,
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      labourPreviewController.toggleExpansion();
                                    },
                                    child: Icon(Icons.keyboard_arrow_up)),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 2,
                            ),
                            AppTextWidget(
                              text: AppTexts.personaldetails,
                              fontSize: AppTextSize.textSizeSmall,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondaryText,
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 1,
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
                                    children: [
                                      Container(
                                        width:
                                            SizeConfig.imageSizeMultiplier * 15,
                                        height:
                                            SizeConfig.imageSizeMultiplier * 15,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: addLabourController
                                                    .selectedImagePath
                                                    .isNotEmpty
                                                ? FileImage(File(
                                                    addLabourController
                                                        .selectedImagePath
                                                        .value))
                                                : AssetImage(
                                                        'assets/icons/person_labour.png')
                                                    as ImageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: SizeConfig.widthMultiplier * 3,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppTextWidget(
                                              text: AppTexts.fullname,
                                              fontSize:
                                                  AppTextSize.textSizeSmall,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.searchfeild),
                                          AppTextWidget(
                                              text: addLabourController
                                                  .fullnameController.text,
                                              fontSize:
                                                  AppTextSize.textSizeSmall,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primaryText),
                                        ],
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: SizeConfig.widthMultiplier * 40,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            AppTextWidget(
                                                text: AppTexts.dob,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            AppTextWidget(
                                                text: addLabourController
                                                        .dateController
                                                        .text
                                                        .isNotEmpty
                                                    ? addLabourController
                                                        .dateController.text
                                                    : 'Date Not Available',
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryText),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      2.5,
                                            ),
                                            AppTextWidget(
                                                text: AppTexts.gender,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            Obx(() => AppTextWidget(
                                                  text: addLabourController
                                                      .selectedGenderLabel, // ✅ Dynamically updates
                                                  fontSize:
                                                      AppTextSize.textSizeSmall,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.primaryText,
                                                )),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      2.5,
                                            ),
                                            AppTextWidget(
                                                text: AppTexts.contactno,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            AppTextWidget(
                                                text: addLabourController
                                                    .contactnumberController
                                                    .text,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryText),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      2.5,
                                            ),
                                            AppTextWidget(
                                                text: AppTexts.adharnum,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            AppTextWidget(
                                                text: '784598547845',
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryText),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      2.5,
                                            ),
                                            AppTextWidget(
                                                text: AppTexts.address,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            Obx(
                                              () =>

                                                  // Show Entered Address Dynamically
                                                  AppTextWidget(
                                                text: addLabourController
                                                    .formattedAddress.value,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: SizeConfig.widthMultiplier * 2,
                                      ),
                                      SizedBox(
                                        width: SizeConfig.widthMultiplier * 40,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            AppTextWidget(
                                                text: AppTexts.bloodgrp,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            AppTextWidget(
                                                text: addLabourController
                                                    .selectedBloodGroup.value,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryText),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      2.5,
                                            ),
                                            AppTextWidget(
                                                text: 'Literacy',
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            AppTextWidget(
                                                text: 'Literate',
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryText),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      2.5,
                                            ),
                                            AppTextWidget(
                                                text: 'Marital Status',
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            AppTextWidget(
                                                text: 'Married',
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryText),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      2.5,
                                            ),
                                            AppTextWidget(
                                                text: AppTexts.reasonforvisit,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            AppTextWidget(
                                                text: addLabourController
                                                    .selectedreasons.value,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryText),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 4,
                            ),
                            AppTextWidget(
                              text: AppTexts.emergencydetails,
                              fontSize: AppTextSize.textSizeSmall,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondaryText,
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 1,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: SizeConfig.widthMultiplier * 40,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            AppTextWidget(
                                                text: AppTexts.emergencyname,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            AppTextWidget(
                                                text: addLabourController
                                                    .econtactnameController
                                                    .text,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryText),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      2.5,
                                            ),
                                            AppTextWidget(
                                                text:
                                                    AppTexts.emergencyrelation,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            Obx(
                                              () => AppTextWidget(
                                                  text: addLabourController
                                                      .selectedrelation.value,
                                                  fontSize:
                                                      AppTextSize.textSizeSmall,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.primaryText),
                                            ),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      2.5,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: SizeConfig.widthMultiplier * 2,
                                      ),
                                      SizedBox(
                                        width: SizeConfig.widthMultiplier * 40,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            AppTextWidget(
                                                text: AppTexts.emergencynumber,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            AppTextWidget(
                                                text: addLabourController
                                                    .econtactnumberController
                                                    .text,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryText),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      2.5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
                                text: AppTexts.personaldetails,
                                fontSize: AppTextSize.textSizeSmall,
                                fontWeight: FontWeight.w500,
                                color: AppColors.buttoncolor,
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    labourPreviewController.toggleExpansion();
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

            //---------------------------------------------------------------------

            Obx(
              () => labourPreviewController.isProfessionalDetailsExpanded.value
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
                                        'assets/icons/briefcase.png')),
                                SizedBox(
                                  width: 5,
                                ),
                                AppTextWidget(
                                  text: AppTexts.professionaldetails,
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttoncolor,
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    labourPreviewController
                                        .toggleExpansionProfessional();
                                  },
                                  child: Icon(Icons.keyboard_arrow_up),
                                ),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: SizeConfig.widthMultiplier * 40,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            AppTextWidget(
                                                text: AppTexts.trade,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            AppTextWidget(
                                                text:
                                                    labourProfessDetailsController
                                                        .selectedtrade.value,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryText),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      2.5,
                                            ),
                                            AppTextWidget(
                                                text: AppTexts.skill,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            Obx(() => AppTextWidget(
                                                  text:
                                                      labourProfessDetailsController
                                                          .selectedSkillLevel
                                                          .value,
                                                  fontSize:
                                                      AppTextSize.textSizeSmall,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.primaryText,
                                                )),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      2.5,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: SizeConfig.widthMultiplier * 2,
                                      ),
                                      SizedBox(
                                        width: SizeConfig.widthMultiplier * 40,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            AppTextWidget(
                                                text: AppTexts.yoexperience,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            AppTextWidget(
                                                text:
                                                    labourProfessDetailsController
                                                        .yoexperienceController
                                                        .text,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryText),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      2.5,
                                            ),
                                            AppTextWidget(
                                                text: 'Contractor Firm Name',
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.searchfeild),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      1,
                                            ),
                                            AppTextWidget(
                                                text:
                                                    labourProfessDetailsController
                                                        .selectedFirmname.value,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryText),
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      2.5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
                                      'assets/icons/briefcase.png')),
                              SizedBox(
                                width: 5,
                              ),
                              AppTextWidget(
                                text: AppTexts.professionaldetails,
                                fontSize: AppTextSize.textSizeSmall,
                                fontWeight: FontWeight.w500,
                                color: AppColors.buttoncolor,
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    labourPreviewController
                                        .toggleExpansionProfessional();
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

            //-----------------------------------------------------------------
            Obx(() => labourPreviewController.isidproofDetailsExpanded.value
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
                                  child: Image.asset('assets/icons/proof.png')),
                              SizedBox(
                                width: 5,
                              ),
                              AppTextWidget(
                                text: AppTexts.idproof,
                                fontSize: AppTextSize.textSizeSmall,
                                fontWeight: FontWeight.w500,
                                color: AppColors.buttoncolor,
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    labourPreviewController
                                        .toggleExpansionidProof();
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
                                AppTextWidget(
                                    text: AppTexts.docphoto,
                                    fontSize: AppTextSize.textSizeSmall,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.searchfeild),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier * 1.5,
                                ),
                                Obx(
                                  () =>
                                      labourDocumentationController
                                                  .alllabourImgDataCount <
                                              1
                                          ? SizedBox()
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start, // Ensure items align properly

                                                  children: [
                                                    Expanded(
                                                      child: SizedBox(
                                                        child: GridView.builder(
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                labourDocumentationController
                                                                    .alllabourImgData
                                                                    .length,
                                                            gridDelegate:
                                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount:
                                                                  4, // Ensures one row (horizontal scroll)

                                                              childAspectRatio:
                                                                  1, // Keeps items square
                                                              mainAxisSpacing:
                                                                  5,
                                                              crossAxisSpacing:
                                                                  5, // Spacing between images
                                                            ),
                                                            shrinkWrap: true,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Stack(
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                        SizeConfig.imageSizeMultiplier *
                                                                            20,
                                                                    width: SizeConfig
                                                                            .imageSizeMultiplier *
                                                                        20,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12), // Clip image to match container

                                                                      child: Image
                                                                          .file(
                                                                        File(labourDocumentationController
                                                                            .alllabourImgData[index]
                                                                            .path),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            }),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: SizeConfig.widthMultiplier * 40,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          AppTextWidget(
                                              text: AppTexts.doctype,
                                              fontSize:
                                                  AppTextSize.textSizeSmall,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.searchfeild),
                                          SizedBox(
                                            height:
                                                SizeConfig.heightMultiplier * 1,
                                          ),
                                          AppTextWidget(
                                              text: '132445',
                                              fontSize:
                                                  AppTextSize.textSizeSmall,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primaryText),
                                          SizedBox(
                                            height:
                                                SizeConfig.heightMultiplier *
                                                    2.5,
                                          ),
                                          AppTextWidget(
                                              text: AppTexts.validity,
                                              fontSize:
                                                  AppTextSize.textSizeSmall,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.searchfeild),
                                          SizedBox(
                                            height:
                                                SizeConfig.heightMultiplier * 1,
                                          ),
                                          Obx(
                                            () => AppTextWidget(
                                                text:
                                                    labourDocumentationController
                                                        .validityText.value,
                                                fontSize:
                                                    AppTextSize.textSizeSmall,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryText),
                                          ),
                                          SizedBox(
                                            height:
                                                SizeConfig.heightMultiplier *
                                                    2.5,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.widthMultiplier * 2,
                                    ),
                                    SizedBox(
                                      width: SizeConfig.widthMultiplier * 40,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          AppTextWidget(
                                              text: AppTexts.idno,
                                              fontSize:
                                                  AppTextSize.textSizeSmall,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.searchfeild),
                                          SizedBox(
                                            height:
                                                SizeConfig.heightMultiplier * 1,
                                          ),
                                          Obx(() => AppTextWidget(
                                              text:
                                                  labourDocumentationController
                                                      .idnoText.value,
                                              fontSize:
                                                  AppTextSize.textSizeSmall,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primaryText)),
                                          SizedBox(
                                            height:
                                                SizeConfig.heightMultiplier *
                                                    2.5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                                child: Image.asset('assets/icons/proof.png')),
                            SizedBox(
                              width: 5,
                            ),
                            AppTextWidget(
                              text: AppTexts.idproof,
                              fontSize: AppTextSize.textSizeSmall,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttoncolor,
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: () {
                                  labourPreviewController
                                      .toggleExpansionidProof();
                                },
                                child: Icon(Icons.keyboard_arrow_up)),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 3,
                        ),
                      ],
                    ),
                  )),
            //------------------------------------------------------------------
            Obx(
              () => labourPreviewController.isprecautionDetailsExpanded.value
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
                                      labourPreviewController
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
                                          text: AppTexts.safetyequipprovided,
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
                                    var selectedEquipment =
                                        labourPrecautionController
                                            .getSelectedEquipment();
                                    return selectedEquipment.isNotEmpty
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                selectedEquipment.length,
                                                (index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: SizeConfig
                                                            .heightMultiplier *
                                                        1.5),
                                                child: AppTextWidget(
                                                  text:
                                                      "${index + 1}. ${selectedEquipment[index]['title']}",
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
                                          text: AppTexts.instructiongivenn,
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
                                    var selectedEquipment =
                                        labourPrecautionController
                                            .getSelectedInstruction();
                                    return selectedEquipment.isNotEmpty
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                selectedEquipment.length,
                                                (index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: SizeConfig
                                                            .heightMultiplier *
                                                        1.5),
                                                child: AppTextWidget(
                                                  text:
                                                      "${index + 1}. ${selectedEquipment[index]['title']}",
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
                                    labourPreviewController
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
                      text: 'Inducted By',
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
                        showConfirmationDialog(context); // Call the function
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
