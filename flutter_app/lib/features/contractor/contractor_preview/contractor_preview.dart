import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_medium_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/Labour_add/add_labour_controller.dart';
import 'package:flutter_app/features/contractor/add_contractor/add_contractor_controller.dart';
import 'package:flutter_app/features/contractor/contractor_details/contractor_details_controller.dart';
import 'package:flutter_app/features/contractor/contractor_submit/contractor_submit.dart';
import 'package:flutter_app/features/contractor/service_details/service_details_controller.dart';
import 'package:flutter_app/features/labour_documentation/labour_documentation_controller.dart';
import 'package:flutter_app/features/labour_precaution/labour_precaution_controller.dart';
import 'package:flutter_app/features/labour_preview/labour_preview_controller.dart';
import 'package:flutter_app/features/labour_professional_details/labour_profess_details_controller.dart';
import 'package:flutter_app/features/labour_undertaking/labour_undertaking_controller.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

import 'contractor_preview_controller.dart';

class ContractorPreview extends StatelessWidget {
  ContractorPreview({super.key});
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
  final AddContractorController addContractorController =
      Get.put(AddContractorController());
  final ContractorDetailsController contractorDetailsController =
      Get.put(ContractorDetailsController());

  final ServiceDetailsController serviceDetailsController =
      Get.put(ServiceDetailsController());

  final ContractorPreviewController contractorPreview =
      Get.put(ContractorPreviewController());
  void showConfirmationDialogContactor(BuildContext context) {
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
                    Get.to(ContractorSubmit());
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
              () => contractorPreview.isPersonalDetailsExpanded.value
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
                                  text: AppTexts.contractordetails,
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttoncolor,
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      contractorPreview.toggleExpansion();
                                    },
                                    child: Icon(Icons.keyboard_arrow_up)),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 2,
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
                                            text: AppTexts.contractorfirm,
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        AppTextWidget(
                                            text: addContractorController
                                                    .contractorfirmnameController
                                                    .text
                                                    .isNotEmpty
                                                ? addContractorController
                                                    .contractorfirmnameController
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
                                            text: AppTexts.gstn,
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        AppTextWidget(
                                          text: addContractorController
                                                  .gstnController
                                                  .text
                                                  .isNotEmpty
                                              ? addContractorController
                                                  .gstnController.text
                                              : 'Date Not Available',
                                          fontSize: AppTextSize.textSizeSmall,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primaryText,
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 2.5,
                                        ),
                                      ]),
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
                                            text: AppTexts.contractorgrp,
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        AppTextWidget(
                                            text: addContractorController
                                                .selectedContractorgrp
                                                .value, // ✅ Dynamically updates
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primaryText),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 2.5,
                                        ),
                                        AppTextWidget(
                                            text: AppTexts.servicearea,
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        Obx(() => AppTextWidget(
                                              text: addContractorController
                                                  .selectedContractorgrp
                                                  .value, // ✅ Dynamically updates
                                              fontSize:
                                                  AppTextSize.textSizeSmall,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primaryText,
                                            )),
                                      ]),
                                ),
                              ],
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
                                    contractorPreview.toggleExpansion();
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

            //-----------------------------------------------------------------
            Obx(() => contractorPreview.isidproofDetailsExpanded.value
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
                                    contractorPreview.toggleExpansionidProof();
                                  },
                                  child: Icon(Icons.keyboard_arrow_up)),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 3,
                          ),
                          AppTextWidget(
                            text: 'Primary Contact Details',
                            fontSize: AppTextSize.textSizeSmall,
                            fontWeight: FontWeight.w500,
                            color: AppColors.searchfeild,
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
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
                            child: Row(
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
                                            text: AppTexts.name,
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        AppTextWidget(
                                            text: contractorDetailsController
                                                    .nameController
                                                    .text
                                                    .isNotEmpty
                                                ? contractorDetailsController
                                                    .nameController.text
                                                : 'Date Not Available',
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primaryText),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 2.5,
                                        ),
                                        AppTextWidget(
                                            text: AppTexts.emailid,
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        AppTextWidget(
                                          text: contractorDetailsController
                                                  .emailidController
                                                  .text
                                                  .isNotEmpty
                                              ? contractorDetailsController
                                                  .emailidController.text
                                              : 'Date Not Available',
                                          fontSize: AppTextSize.textSizeSmall,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primaryText,
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 2.5,
                                        ),
                                        AppTextWidget(
                                            text: AppTexts.idproofno,
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        AppTextWidget(
                                          text: contractorDetailsController
                                                  .idproofController
                                                  .text
                                                  .isNotEmpty
                                              ? contractorDetailsController
                                                  .idproofController.text
                                              : 'Date Not Available',
                                          fontSize: AppTextSize.textSizeSmall,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primaryText,
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 2.5,
                                        ),
                                      ]),
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
                                            text: AppTexts.contactno,
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        AppTextWidget(
                                            text: contractorDetailsController
                                                    .contactnoController
                                                    .text
                                                    .isNotEmpty
                                                ? contractorDetailsController
                                                    .contactnoController.text
                                                : 'Not Available',
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primaryText),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 2.5,
                                        ),
                                        AppTextWidget(
                                            text: AppTexts.idprooftype,
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        Obx(() => AppTextWidget(
                                              text: contractorDetailsController
                                                  .selectedidProoftype
                                                  .value, // ✅ Dynamically updates
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
                                            text: AppTexts.photos,
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        Obx(
                                          () =>
                                              contractorDetailsController
                                                          .adharImageCount <
                                                      1
                                                  ? SizedBox()
                                                  : Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start, // Ensure items align properly

                                                          children: [
                                                            Expanded(
                                                              child: SizedBox(
                                                                child: GridView
                                                                    .builder(
                                                                        physics:
                                                                            NeverScrollableScrollPhysics(),
                                                                        itemCount: contractorDetailsController
                                                                            .labourAdharcard
                                                                            .length,
                                                                        gridDelegate:
                                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                                          crossAxisCount:
                                                                              3, // Ensures one row (horizontal scroll)

                                                                          childAspectRatio:
                                                                              1, // Keeps items square
                                                                          mainAxisSpacing:
                                                                              10,
                                                                          crossAxisSpacing:
                                                                              10, // Spacing between images
                                                                        ),
                                                                        shrinkWrap:
                                                                            true,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return Stack(
                                                                            children: [
                                                                              SizedBox(
                                                                                height: SizeConfig.imageSizeMultiplier * 22,
                                                                                width: SizeConfig.imageSizeMultiplier * 22,
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(12), // Clip image to match container

                                                                                  child: Image.file(
                                                                                    File(contractorDetailsController.labourAdharcard[index].path),
                                                                                    fit: BoxFit.cover,
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
                                      ]),
                                ),
                              ],
                            ),
                          ),

                          //----------------------------

                          SizedBox(
                            height: SizeConfig.heightMultiplier * 3,
                          ),
                          AppTextWidget(
                            text: 'Secondary Contact Details',
                            fontSize: AppTextSize.textSizeSmall,
                            fontWeight: FontWeight.w500,
                            color: AppColors.searchfeild,
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
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
                            child: Row(
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
                                            text: AppTexts.name,
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        AppTextWidget(
                                            text: contractorDetailsController
                                                    .secondarynameController
                                                    .text
                                                    .isNotEmpty
                                                ? contractorDetailsController
                                                    .secondarynameController
                                                    .text
                                                : 'Date Not Available',
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primaryText),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 2.5,
                                        ),
                                      ]),
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
                                            text: AppTexts.contactno,
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.searchfeild),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1,
                                        ),
                                        AppTextWidget(
                                            text: contractorDetailsController
                                                    .secondarycontactController
                                                    .text
                                                    .isNotEmpty
                                                ? contractorDetailsController
                                                    .secondarycontactController
                                                    .text
                                                : 'Not Available',
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primaryText),
                                        SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 2.5,
                                        ),
                                      ]),
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
                                  contractorPreview.toggleExpansionidProof();
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
              () => contractorPreview.isprecautionDetailsExpanded.value
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
                                  text: 'Service Details',
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttoncolor,
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      contractorPreview
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
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width:
                                                SizeConfig.widthMultiplier * 40,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  AppTextWidget(
                                                      text: AppTexts.activity,
                                                      fontSize: AppTextSize
                                                          .textSizeSmall,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors
                                                          .searchfeild),
                                                  SizedBox(
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        1,
                                                  ),
                                                  AppTextWidget(
                                                      text: serviceDetailsController
                                                              .selectedactivity
                                                              .isNotEmpty
                                                          ? serviceDetailsController
                                                              .selectedactivity
                                                              .value
                                                          : 'Date Not Available',
                                                      fontSize: AppTextSize
                                                          .textSizeSmall,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors
                                                          .primaryText),
                                                  SizedBox(
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        2.5,
                                                  ),
                                                ]),
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.widthMultiplier * 40,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  AppTextWidget(
                                                      text: 'Sub-activity',
                                                      fontSize: AppTextSize
                                                          .textSizeSmall,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors
                                                          .searchfeild),
                                                  SizedBox(
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        1,
                                                  ),
                                                  AppTextWidget(
                                                      text: serviceDetailsController
                                                              .selectedactivity
                                                              .isNotEmpty
                                                          ? serviceDetailsController
                                                              .selectedactivity
                                                              .value
                                                          : 'Date Not Available',
                                                      fontSize: AppTextSize
                                                          .textSizeSmall,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors
                                                          .primaryText),
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
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
                                text: 'Service Details',
                                fontSize: AppTextSize.textSizeSmall,
                                fontWeight: FontWeight.w500,
                                color: AppColors.buttoncolor,
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    contractorPreview
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
                        showConfirmationDialogContactor(
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
