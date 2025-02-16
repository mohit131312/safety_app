import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_medium_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/toolbox_training_all/seletc_trainee/select_trainee_controller.dart';
import 'package:flutter_app/features/toolbox_training_all/seletc_trainee/select_trainee_screen.dart';
import 'package:flutter_app/features/toolbox_training_all/toolbox_add_trainee/toolbox_add_trainee_controller.dart';
import 'package:flutter_app/features/toolbox_training_all/toolbox_attestation/toolbox_attestation_screen.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

class ToolboxAddTraineeScreen extends StatelessWidget {
  ToolboxAddTraineeScreen({super.key});

  final ToolboxAddTraineeController toolboxAddTraineeController =
      Get.put(ToolboxAddTraineeController());
  final SelectTraineeController selectTraineeController =
      Get.put(SelectTraineeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
                text: AppTexts.toolboxtrainingadd,
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
            vertical: SizeConfig.heightMultiplier * 1.3,
          ),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.66,
                        backgroundColor: AppColors.searchfeildcolor,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.thirdText),
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
                SizedBox(height: SizeConfig.heightMultiplier * 4),
                AppTextWidget(
                    text: AppTexts.traineesdetails,
                    fontSize: AppTextSize.textSizeMedium,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText),
                SizedBox(height: SizeConfig.heightMultiplier * 0.7),
                AppTextWidget(
                    text: AppTexts.entertraineesdetails,
                    fontSize: AppTextSize.textSizeExtraSmall,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryText),
                SizedBox(height: SizeConfig.heightMultiplier * 2.5),
                Row(
                  children: [
                    AppTextWidget(
                        text: AppTexts.photos,
                        fontSize: AppTextSize.textSizeSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryText),
                    AppTextWidget(
                        text: AppTexts.star,
                        fontSize: AppTextSize.textSizeExtraSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.starcolor),
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    Obx(
                      () => toolboxAddTraineeController.traineeImageCount < 1
                          ? GestureDetector(
                              onTap: () {
                                toolboxAddTraineeController.picktraineeImages();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: SizeConfig.widthMultiplier * 92,
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 24, bottom: 24),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.orange, width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.orange.shade50,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.orange,
                                      size: 30,
                                    ),
                                    SizedBox(height: 8),
                                    AppTextWidget(
                                        text: 'Maximum 10 photos',
                                        fontSize:
                                            AppTextSize.textSizeExtraSmall,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.secondaryText),
                                  ],
                                ),
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Ensure items align properly

                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        // height: SizeConfig.imageSizeMultiplier *
                                        //     90, // Adjust based on UI needs

                                        child: GridView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount:
                                                toolboxAddTraineeController
                                                    .traineeimg.length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  3, // Ensures one row (horizontal scroll)

                                              childAspectRatio:
                                                  1, // Keeps items square
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing:
                                                  10, // Spacing between images
                                            ),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Stack(
                                                children: [
                                                  SizedBox(
                                                    height: SizeConfig
                                                            .imageSizeMultiplier *
                                                        18,
                                                    width: SizeConfig
                                                            .imageSizeMultiplier *
                                                        18,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12), // Clip image to match container

                                                      child: Image.file(
                                                        File(
                                                            toolboxAddTraineeController
                                                                .traineeimg[
                                                                    index]
                                                                .path),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 1,
                                                    right: 1,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        toolboxAddTraineeController
                                                            .removetraineeImage(
                                                                index);
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.black
                                                              .withOpacity(0.8),
                                                        ),
                                                        child: Icon(Icons.close,
                                                            color: Colors.white,
                                                            size: 15),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              );
                                            }),
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.imageSizeMultiplier * 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        toolboxAddTraineeController
                                            .picktraineeImages();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height:
                                            SizeConfig.imageSizeMultiplier * 18,
                                        width:
                                            SizeConfig.imageSizeMultiplier * 18,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.orange, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.orange,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
                toolboxAddTraineeController.traineeImageCount < 1
                    ? SizedBox(
                        height: SizeConfig.heightMultiplier * 2.5,
                      )
                    : SizedBox(),
                toolboxAddTraineeController.isTraineeExpanded.value
                    ? Obx(() {
                        final added = selectTraineeController.addedContacts.keys
                            .where(
                              (key) =>
                                  selectTraineeController.addedContacts[key] ==
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
                              final contact = selectTraineeController
                                  .contacts.values
                                  .expand((list) => list)
                                  .firstWhere((c) => c['name'] == name,
                                      orElse: () => {});

                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.heightMultiplier * 1,
                                  horizontal: SizeConfig.widthMultiplier * 4,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    /// **Profile Image**
                                    Container(
                                      width:
                                          SizeConfig.imageSizeMultiplier * 15,
                                      height:
                                          SizeConfig.imageSizeMultiplier * 15,
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
                                        width: SizeConfig.widthMultiplier * 4),

                                    /// **Name & Designation**
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppTextWidget(
                                          text: name,
                                          fontSize: AppTextSize.textSizeSmall,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primaryText,
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.heightMultiplier *
                                                    0.5),
                                        AppTextWidget(
                                          text: contact['designation'] ??
                                              'Unknown',
                                          fontSize: AppTextSize.textSizeSmall,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.secondaryText,
                                        ),
                                      ],
                                    ),

                                    Spacer(),

                                    /// **Remove Button**
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.orange.withOpacity(0.2),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                            height:
                                                SizeConfig.imageSizeMultiplier *
                                                    10,
                                            width:
                                                SizeConfig.imageSizeMultiplier *
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
                        final added = selectTraineeController.addedContacts.keys
                            .where(
                              (key) =>
                                  selectTraineeController.addedContacts[key] ==
                                  true,
                            )
                            .toList();

                        if (added.isEmpty) {
                          return SizedBox
                              .shrink(); // Hide when no contacts are added
                        }

                        return Column(
                          children: added.map((name) {
                            final contact = selectTraineeController
                                .contacts.values
                                .expand((list) => list)
                                .firstWhere((c) => c['name'] == name,
                                    orElse: () => {});

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.heightMultiplier * 1,
                                horizontal: SizeConfig.widthMultiplier * 4,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  /// **Profile Image**
                                  Container(
                                    width: SizeConfig.imageSizeMultiplier * 15,
                                    height: SizeConfig.imageSizeMultiplier * 15,
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
                                      width: SizeConfig.widthMultiplier * 4),

                                  /// **Name & Designation**
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppTextWidget(
                                        text: name,
                                        fontSize: AppTextSize.textSizeSmall,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryText,
                                      ),
                                      SizedBox(
                                          height: SizeConfig.heightMultiplier *
                                              0.5),
                                      AppTextWidget(
                                        text:
                                            contact['designation'] ?? 'Unknown',
                                        fontSize: AppTextSize.textSizeSmall,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.secondaryText,
                                      ),
                                    ],
                                  ),

                                  Spacer(),

                                  /// **Remove Button**
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.orange.withOpacity(0.2),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                          height:
                                              SizeConfig.imageSizeMultiplier *
                                                  10,
                                          width:
                                              SizeConfig.imageSizeMultiplier *
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
                Row(
                  children: [
                    AppTextWidget(
                        text: AppTexts.selectretrainees,
                        fontSize: AppTextSize.textSizeSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryText),
                    AppTextWidget(
                        text: AppTexts.star,
                        fontSize: AppTextSize.textSizeExtraSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.starcolor),
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: AppColors.thirdText,
                        width: 0.8,
                      ),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Get.to(SelectTraineeScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 28,
                        color: AppColors.thirdText,
                        weight: 0.2,
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 1,
                      ),
                      AppTextWidget(
                        text: "Add Trainees",
                        fontSize: AppTextSize.textSizeSmallm,
                        fontWeight: FontWeight.w400,
                        color: AppColors.thirdText,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 25,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      GestureDetector(
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
                          Get.to(ToolboxAttestationScreen());
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
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
