import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_medium_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/labour_documentation/labour_documentation_controller.dart';
import 'package:flutter_app/features/labour_precaution/labour_precaustion_screen.dart';
import 'package:flutter_app/features/toolbox_training_all/toolbox_t_details/toolbox_t_details_controller.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LabourDocumentation extends StatelessWidget {
  LabourDocumentation({super.key});
  final ToolboxTDetailsController controller =
      Get.put(ToolboxTDetailsController());

  final LabourDocumentationController labourDocumentationController =
      Get.put(LabourDocumentationController());
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
                text: AppTexts.addlabour,
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
                    value: 0.6,
                    backgroundColor: AppColors.searchfeildcolor,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.defaultPrimary),
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '03/05',
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
              text: AppTexts.documentation,
              fontSize: AppTextSize.textSizeMediumm,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 0.3,
            ),
            AppTextWidget(
              text: AppTexts.uploadreqdoc,
              fontSize: AppTextSize.textSizeSmalle,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryText,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1.5,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.textfeildcolor,
              ),
              padding: EdgeInsets.only(left: 16, right: 16, top: 20),
              width: SizeConfig.widthMultiplier * 92,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextWidget(
                    text: AppTexts.adharCard,
                    fontSize: AppTextSize.textSizeMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.5,
                  ),
                  Row(
                    children: [
                      AppTextWidget(
                          text: AppTexts.photo,
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
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Obx(
                    () => labourDocumentationController.adharImageCount < 1
                        ? GestureDetector(
                            onTap: () {
                              labourDocumentationController.pickadharImages();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: SizeConfig.widthMultiplier * 82,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.orange, width: 2),
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
                                      text: AppTexts.uploadphoto,
                                      fontSize: AppTextSize.textSizeExtraSmall,
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
                                      height: SizeConfig.imageSizeMultiplier *
                                          20, // Adjust based on UI needs

                                      child: GridView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              labourDocumentationController
                                                  .labourAdharcard.length,
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
                                                          labourDocumentationController
                                                              .labourAdharcard[
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
                                                      labourDocumentationController
                                                          .removeAdharImage(
                                                              index);
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
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
                                      labourDocumentationController
                                          .pickadharImages();
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
                                        borderRadius: BorderRadius.circular(8),
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
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.5,
                  ),
                  Row(
                    children: [
                      AppTextWidget(
                          text: AppTexts.adharnum,
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
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller:
                          labourDocumentationController.adharnoController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Enter ID number',
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
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 1),
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
                ],
              ),
            ),
            //-------------------------------------------------------------------------
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.textfeildcolor,
              ),
              padding: EdgeInsets.only(left: 16, right: 16, top: 20),
              // height: SizeConfig.heightMultiplier * 69,
              width: SizeConfig.widthMultiplier * 92,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextWidget(
                    text: AppTexts.otherIdproof,
                    fontSize: AppTextSize.textSizeMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.5,
                  ),
                  Row(
                    children: [
                      AppTextWidget(
                          text: AppTexts.doctype,
                          fontSize: AppTextSize.textSizeSmall,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryText),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Obx(
                      () => DropdownButtonFormField<String>(
                        // isDense: false,

                        value: controller.selectedActivity.value.isNotEmpty
                            ? controller.selectedActivity.value
                            : null,
                        items: controller.activities
                            .map((activity) => DropdownMenuItem(
                                  value: activity,
                                  child: Text(
                                    activity,
                                    style: TextStyle(
                                        fontSize: AppTextSize.textSizeSmalle,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.secondaryText),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          //  controller.selectedActivity.value = value ?? '';
                        },
                        hint: AppTextWidget(
                          text: 'Select document type',
                          fontSize: AppTextSize.textSizeSmall,
                          fontWeight: FontWeight.w400,
                          color: AppColors.searchfeild,
                        ),
                        icon: Icon(
                          Icons
                              .keyboard_arrow_down, // Your custom dropdown icon
                          color:
                              AppColors.searchfeild, // Adjust color as needed
                          size: 27,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: AppColors.searchfeildcolor, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: AppColors.searchfeildcolor, width: 1),
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
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Row(
                    children: [
                      AppTextWidget(
                          text: AppTexts.docphoto,
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
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1.5,
                  ),
                  Obx(
                    () => labourDocumentationController.otherImageCount < 1
                        ? GestureDetector(
                            onTap: () {
                              labourDocumentationController.pickotherImages();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: SizeConfig.widthMultiplier * 82,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.orange, width: 2),
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
                                      text: AppTexts.uploadphoto,
                                      fontSize: AppTextSize.textSizeExtraSmall,
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
                                      height: SizeConfig.imageSizeMultiplier *
                                          20, // Adjust based on UI needs

                                      child: GridView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              labourDocumentationController
                                                  .labourotherimg.length,
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
                                                          labourDocumentationController
                                                              .labourotherimg[
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
                                                      labourDocumentationController
                                                          .removeOtherImage(
                                                              index);
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
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
                                      labourDocumentationController
                                          .pickotherImages();
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
                                        borderRadius: BorderRadius.circular(8),
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
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.5,
                  ),
                  AppTextWidget(
                      text: AppTexts.idno,
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryText),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: labourDocumentationController.idnoController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Enter ID number',
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
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 1),
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
                  AppTextWidget(
                      text: AppTexts.validity,
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryText),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller:
                          labourDocumentationController.validityController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Enter validity',
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
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 1),
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.thirdText,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: AppColors.thirdText,
                          width: 0.8,
                        ),
                      ),
                      minimumSize: Size(double.infinity, 42),
                    ),
                    onPressed: () {
                      // Get.toNamed("/selectreviewer");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 28,
                          color: AppColors.primary,
                          weight: 0.2,
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 1,
                        ),
                        AppTextWidget(
                          text: "Add Document",
                          fontSize: AppTextSize.textSizeSmallm,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1.5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary,
                  border:
                      Border.all(width: 0.7, color: AppColors.backbuttoncolor)),
              width: SizeConfig.widthMultiplier * 92,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            topRight: Radius.circular(8),
                          ),
                          color: Colors.red,
                        ),
                        height: SizeConfig.imageSizeMultiplier * 10,
                        width: SizeConfig.widthMultiplier * 10,
                        child: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            labourDocumentationController.alllabourImgData
                                .clear();
                            labourDocumentationController
                                .alllabourImgDataCount.value = 0;
                            labourDocumentationController
                                .adharImageCount.value = 0;
                            labourDocumentationController
                                .otherImageCount.value = 0;

                            labourDocumentationController.labourAdharcard
                                .clear();
                            labourDocumentationController.labourotherimg
                                .clear();
                            labourDocumentationController.validityText.value =
                                '';
                            labourDocumentationController.idnoText.value = '';
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
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
                          () => labourDocumentationController
                                      .alllabourImgDataCount <
                                  1
                              ? SizedBox()
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
                                                            File(labourDocumentationController
                                                                .alllabourImgData[
                                                                    index]
                                                                .path),
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
                        //--------------------------------------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 40,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2.5,
                                  ),
                                  AppTextWidget(
                                      text: AppTexts.doctype,
                                      fontSize: AppTextSize.textSizeSmall,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.searchfeild),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 1,
                                  ),
                                  AppTextWidget(
                                      text: AppTexts.adharCard,
                                      fontSize: AppTextSize.textSizeSmall,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryText),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2.5,
                                  ),
                                  AppTextWidget(
                                      text: AppTexts.validity,
                                      fontSize: AppTextSize.textSizeSmall,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.searchfeild),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 1,
                                  ),
                                  Obx(
                                    () => AppTextWidget(
                                        text: labourDocumentationController
                                            .validityText.value,
                                        fontSize: AppTextSize.textSizeSmall,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primaryText),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2.5,
                                  ),
                                  AppTextWidget(
                                      text: AppTexts.idno,
                                      fontSize: AppTextSize.textSizeSmall,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.searchfeild),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 1,
                                  ),
                                  Obx(
                                    () => AppTextWidget(
                                        text: labourDocumentationController
                                            .idnoText.value,
                                        fontSize: AppTextSize.textSizeSmall,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primaryText),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2.5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        //---------------------------------------------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [],
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [],
                        ),

                        SizedBox(
                          height: SizeConfig.heightMultiplier * 3,
                        ),
                      ],
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
                      Get.to(LabourPrecaustionScreen());
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
              height: SizeConfig.heightMultiplier * 6,
            ),
          ]),
        ),
      ),
    );
  }
}
