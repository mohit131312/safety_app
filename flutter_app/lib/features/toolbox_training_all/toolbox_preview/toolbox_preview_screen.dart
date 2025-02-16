import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_medium_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/safety_violation_all/safety_violation_details/safety_violation_details_controller.dart';
import 'package:flutter_app/features/toolbox_training_all/seletc_trainee/select_trainee_controller.dart';
import 'package:flutter_app/features/toolbox_training_all/toolbox_add_trainee/toolbox_add_trainee_controller.dart';
import 'package:flutter_app/features/toolbox_training_all/toolbox_preview/toolbox_preview_controller.dart';
import 'package:flutter_app/features/toolbox_training_all/toolbox_t_details/toolbox_t_details_controller.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

import '../toolbox_submit/toolbox_submit_screen.dart';

class ToolboxPreviewScreen extends StatelessWidget {
  ToolboxPreviewScreen({super.key});

  final ToolboxTDetailsController toolboxTDetailsController =
      Get.put(ToolboxTDetailsController());

  final ToolboxAddTraineeController toolboxAddTraineeController =
      Get.put(ToolboxAddTraineeController());
  final SafetyViolationDetailsController safetyViolationDetailsController =
      Get.put(SafetyViolationDetailsController());
  final ToolboxPreviewController toolboxPreviewCotroller =
      Get.put(ToolboxPreviewController());
  final SelectTraineeController selectTraineeController =
      Get.put(SelectTraineeController());
  //-----------------------------------------------------------------------

  void showConfirmationDialogToolbox(BuildContext context) {
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
              text: 'Are you sure you want to create toolbox training?',
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
                    Get.to(ToolboxSubmitScreen());
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
                text: 'Toolbox Training',
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
                    text: 'Verify the details, ',
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

            //---------------------------------------------------------------------

            //-----------------------------------------------------------------
            Obx(() => toolboxPreviewCotroller.istoolboxExpanded.value
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
                                  child: Image.asset('assets/icons/TBT.png')),
                              SizedBox(
                                width: 5,
                              ),
                              AppTextWidget(
                                text: 'Toolbox Training Details',
                                fontSize: AppTextSize.textSizeSmall,
                                fontWeight: FontWeight.w500,
                                color: AppColors.buttoncolor,
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    toolboxPreviewCotroller
                                        .toolboxtoggleExpansion();
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AppTextWidget(
                                        text: 'Name of Work Permit',
                                        fontSize: AppTextSize.textSizeSmall,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.searchfeild),
                                    SizedBox(
                                      height: SizeConfig.heightMultiplier * 1,
                                    ),
                                    Obx(() {
                                      return toolboxTDetailsController
                                              .selectedWorkPermit.isNotEmpty
                                          ? AppTextWidget(
                                              text: toolboxTDetailsController
                                                  .selectedWorkPermit.value,
                                              fontSize:
                                                  AppTextSize.textSizeSmall,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primaryText)
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
                                      height: SizeConfig.heightMultiplier * 1.5,
                                    ),
                                    AppTextWidget(
                                        text: 'Activity',
                                        fontSize: AppTextSize.textSizeSmall,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.searchfeild),
                                    SizedBox(
                                      height: SizeConfig.heightMultiplier * 1,
                                    ),
                                    Obx(() {
                                      return toolboxTDetailsController
                                              .selectedActivity.isNotEmpty
                                          ? AppTextWidget(
                                              text: toolboxTDetailsController
                                                  .selectedActivity.value,
                                              fontSize:
                                                  AppTextSize.textSizeSmall,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primaryText)
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
                                      height: SizeConfig.heightMultiplier * 1.5,
                                    ),
                                    AppTextWidget(
                                        text: 'Details of Training.',
                                        fontSize: AppTextSize.textSizeSmall,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.searchfeild),
                                    SizedBox(
                                      height: SizeConfig.heightMultiplier * 1,
                                    ),
                                    toolboxTDetailsController
                                            .detailsController.text.isNotEmpty
                                        ? AppTextWidget(
                                            text: toolboxTDetailsController
                                                .detailsController.text,
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primaryText)
                                        : AppTextWidget(
                                            text:
                                                "No safety equipment selected",
                                            fontSize: AppTextSize.textSizeSmall,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.red,
                                          ),
                                    SizedBox(
                                      height: SizeConfig.heightMultiplier * 1.5,
                                    ),

                                    //
                                    AppTextWidget(
                                        text: 'Photos',
                                        fontSize: AppTextSize.textSizeSmall,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.searchfeild),
                                    SizedBox(
                                      height: SizeConfig.heightMultiplier * 1.5,
                                    ),
                                    Obx(
                                      () =>
                                          toolboxAddTraineeController
                                                      .traineeImageCount <
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
                                                            child: GridView
                                                                .builder(
                                                                    physics:
                                                                        NeverScrollableScrollPhysics(),
                                                                    itemCount: toolboxAddTraineeController
                                                                        .traineeimg
                                                                        .length,
                                                                    gridDelegate:
                                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                                      crossAxisCount:
                                                                          4, // Ensures one row (horizontal scroll)

                                                                      childAspectRatio:
                                                                          1, // Keeps items square
                                                                      mainAxisSpacing:
                                                                          12,
                                                                      crossAxisSpacing:
                                                                          12, // Spacing between images
                                                                    ),
                                                                    shrinkWrap:
                                                                        true,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return Stack(
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                SizeConfig.imageSizeMultiplier * 20,
                                                                            width:
                                                                                SizeConfig.imageSizeMultiplier * 20,
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(12), // Clip image to match container

                                                                              child: Image.file(
                                                                                File(toolboxAddTraineeController.traineeimg[index].path),
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
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //--------------------------
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
                                child: Image.asset('assets/icons/TBT.png')),
                            SizedBox(
                              width: 5,
                            ),
                            AppTextWidget(
                              text: 'Toolbox Training Details',
                              fontSize: AppTextSize.textSizeSmall,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttoncolor,
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: () {
                                  toolboxPreviewCotroller
                                      .toolboxtoggleExpansion();
                                  ();
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
              () => toolboxPreviewCotroller.istraineedetails.value
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
                                        'assets/icons/twouser.png')),
                                SizedBox(
                                  width: 5,
                                ),
                                AppTextWidget(
                                  text: 'Trainees Details',
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttoncolor,
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      toolboxPreviewCotroller
                                          .toggletraineedetailsExpansion();
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
                                  toolboxAddTraineeController
                                              .traineeImageCount <
                                          1
                                      ? SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 2.5,
                                        )
                                      : SizedBox(),
                                  toolboxAddTraineeController
                                          .isTraineeExpanded.value
                                      ? Obx(() {
                                          final added = selectTraineeController
                                              .addedContacts.keys
                                              .where(
                                                (key) =>
                                                    selectTraineeController
                                                        .addedContacts[key] ==
                                                    true,
                                              )
                                              .toList();

                                          if (added.isEmpty) {
                                            return SizedBox
                                                .shrink(); // Hide when no contacts are added
                                          }

                                          return SizedBox(
                                            child: Column(
                                              children: added.map((name) {
                                                final contact =
                                                    selectTraineeController
                                                        .contacts.values
                                                        .expand((list) => list)
                                                        .firstWhere(
                                                            (c) =>
                                                                c['name'] ==
                                                                name,
                                                            orElse: () => {});

                                                return Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: SizeConfig
                                                            .heightMultiplier *
                                                        1,
                                                    horizontal: SizeConfig
                                                            .widthMultiplier *
                                                        4,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      /// **Profile Image**
                                                      Container(
                                                        width: SizeConfig
                                                                .imageSizeMultiplier *
                                                            15,
                                                        height: SizeConfig
                                                                .imageSizeMultiplier *
                                                            15,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                'assets/icons/person_labour.png'),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: SizeConfig
                                                                  .widthMultiplier *
                                                              4),

                                                      /// **Name & Designation**
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          AppTextWidget(
                                                            text: name,
                                                            fontSize: AppTextSize
                                                                .textSizeSmall,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .primaryText,
                                                          ),
                                                          SizedBox(
                                                              height: SizeConfig
                                                                      .heightMultiplier *
                                                                  0.5),
                                                          AppTextWidget(
                                                            text: contact[
                                                                    'designation'] ??
                                                                'Unknown',
                                                            fontSize: AppTextSize
                                                                .textSizeSmall,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .secondaryText,
                                                          ),
                                                        ],
                                                      ),

                                                      Spacer(),

                                                      /// **Remove Button**
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.orange
                                                                .withOpacity(
                                                                    0.2),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.asset(
                                                              height: SizeConfig
                                                                      .imageSizeMultiplier *
                                                                  10,
                                                              width: SizeConfig
                                                                      .imageSizeMultiplier *
                                                                  10,
                                                              'assets/icons/phone_orange.png'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          );
                                        })
                                      : Obx(() {
                                          final added = selectTraineeController
                                              .addedContacts.keys
                                              .where(
                                                (key) =>
                                                    selectTraineeController
                                                        .addedContacts[key] ==
                                                    true,
                                              )
                                              .toList();

                                          if (added.isEmpty) {
                                            return SizedBox
                                                .shrink(); // Hide when no contacts are added
                                          }

                                          return Column(
                                            children: added.map((name) {
                                              final contact =
                                                  selectTraineeController
                                                      .contacts.values
                                                      .expand((list) => list)
                                                      .firstWhere(
                                                          (c) =>
                                                              c['name'] == name,
                                                          orElse: () => {});

                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: SizeConfig
                                                          .heightMultiplier *
                                                      1,
                                                  horizontal: SizeConfig
                                                          .widthMultiplier *
                                                      4,
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    /// **Profile Image**
                                                    Container(
                                                      width: SizeConfig
                                                              .imageSizeMultiplier *
                                                          15,
                                                      height: SizeConfig
                                                              .imageSizeMultiplier *
                                                          15,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/icons/person_labour.png'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: SizeConfig
                                                                .widthMultiplier *
                                                            4),

                                                    /// **Name & Designation**
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        AppTextWidget(
                                                          text: name,
                                                          fontSize: AppTextSize
                                                              .textSizeSmall,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .primaryText,
                                                        ),
                                                        SizedBox(
                                                            height: SizeConfig
                                                                    .heightMultiplier *
                                                                0.5),
                                                        AppTextWidget(
                                                          text: contact[
                                                                  'designation'] ??
                                                              'Unknown',
                                                          fontSize: AppTextSize
                                                              .textSizeSmall,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .secondaryText,
                                                        ),
                                                      ],
                                                    ),

                                                    Spacer(),

                                                    /// **Remove Button**
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.orange
                                                              .withOpacity(0.2),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.asset(
                                                            height: SizeConfig
                                                                    .imageSizeMultiplier *
                                                                10,
                                                            width: SizeConfig
                                                                    .imageSizeMultiplier *
                                                                10,
                                                            'assets/icons/phone_orange.png'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          );
                                        }),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 1,
                                  ),
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
                                  child:
                                      Image.asset('assets/icons/twouser.png')),
                              SizedBox(
                                width: 5,
                              ),
                              AppTextWidget(
                                text: 'Trainees Details',
                                fontSize: AppTextSize.textSizeSmall,
                                fontWeight: FontWeight.w500,
                                color: AppColors.buttoncolor,
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    toolboxPreviewCotroller
                                        .toggletraineedetailsExpansion();
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
//--------------------------------------------select informed people

            Obx(
              () => toolboxPreviewCotroller.isprecaution.value
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
                                  text: 'Informed People',
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttoncolor,
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      toolboxPreviewCotroller
                                          .toggleExpansionisprecaution();
                                    },
                                    child: Icon(Icons.keyboard_arrow_up)),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 3,
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
                                          text: 'Instructions Given',
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
                                    var selectedtoolbox =
                                        toolboxTDetailsController
                                            .getSelectedtoolbox();
                                    return selectedtoolbox.isNotEmpty
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                selectedtoolbox.length,
                                                (index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: SizeConfig
                                                            .heightMultiplier *
                                                        1.5),
                                                child: AppTextWidget(
                                                  text:
                                                      "${index + 1}. ${selectedtoolbox[index]['title']}",
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
                                text: 'Informed People',
                                fontSize: AppTextSize.textSizeSmall,
                                fontWeight: FontWeight.w500,
                                color: AppColors.buttoncolor,
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    toolboxPreviewCotroller
                                        .toggleExpansionisprecaution();
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

//---------------------------------
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4,
                vertical: SizeConfig.heightMultiplier * 3,
              ),
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextWidget(
                      text: 'Reviewer',
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
                    height: SizeConfig.heightMultiplier * 3,
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
                        showConfirmationDialogToolbox(
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
