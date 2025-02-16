import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_medium_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/labour_precaution/labour_precaution_controller.dart';
import 'package:flutter_app/features/labour_undertaking/labour_undertaking_screen.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LabourPrecaustionScreen extends StatelessWidget {
  LabourPrecaustionScreen({super.key});

  final LabourPrecautionController controller =
      Get.put(LabourPrecautionController());

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
                    value: 0.77,
                    backgroundColor: AppColors.searchfeildcolor,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.defaultPrimary),
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '04/05',
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
              text: AppTexts.precaution,
              fontSize: AppTextSize.textSizeMediumm,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 0.3,
            ),
            AppTextWidget(
              text: AppTexts.selectprecaustion,
              fontSize: AppTextSize.textSizeSmalle,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryText,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.5,
            ),
            Row(
              children: [
                AppTextWidget(
                  text: AppTexts.safetyequipprovided,
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
              height: SizeConfig.heightMultiplier * 0.3,
            ),
            AppTextWidget(
              text: AppTexts.selectsafetyequip,
              fontSize: AppTextSize.textSizeSmall,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryText,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: Checkbox(
                      value: controller.isCheckedEquipment.value,
                      activeColor: AppColors.buttoncolor,
                      side: BorderSide(
                        color: AppColors.secondaryText,
                        width: 1.2,
                      ),
                      onChanged: (bool? value) {
                        controller.toggleSelectAll();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5.5,
                  width: SizeConfig.widthMultiplier * 82,
                  child: TextField(
                    controller: controller.searchController,
                    // readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Search here..',
                      hintStyle: TextStyle(
                        fontSize: AppTextSize.textSizeSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.searchfeild,
                      ),
                      prefixIcon: Container(
                        padding:
                            EdgeInsets.all(10.0), // Adjust padding as needed

                        child: Image.asset(
                          'assets/icons/Search.png',
                          fit:
                              BoxFit.contain, // Ensures it stays within the box
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.searchfeildcolor, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.searchfeildcolor, width: 0.5),
                      ),
                    ),
                    onChanged: (value) {
                      controller.searchData(value);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            SizedBox(
              height: 270,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(() {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.filteredDetailsEquipment.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                visualDensity: VisualDensity.compact,
                                contentPadding: EdgeInsets.only(
                                    top: 0, bottom: 0, left: 16, right: 16),
                                leading: SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: Checkbox(
                                    value: controller
                                            .filteredDetailsEquipment[index]
                                        ['isChecked'] as bool,
                                    activeColor: AppColors.buttoncolor,
                                    side: BorderSide(
                                      color: AppColors.secondaryText,
                                      width: 1.2,
                                    ),
                                    onChanged: (bool? value) {
                                      controller.toggleCheckbox(index);
                                    },
                                  ),
                                ),
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //${index + 1}.

                                    AppTextWidget(
                                      text: controller
                                          .filteredDetailsEquipment[index]
                                              ['title']
                                          .toString(),
                                      fontSize: AppTextSize.textSizeExtraSmall,
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

            //----------------------------------------------------------------
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            Row(
              children: [
                AppTextWidget(
                  text: AppTexts.instructiongivenn,
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
              height: SizeConfig.heightMultiplier * 2.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: Checkbox(
                      value: controller.isCheckedInstruction.value,
                      activeColor: AppColors.buttoncolor,
                      side: BorderSide(
                        color: AppColors.secondaryText,
                        width: 1.2,
                      ),
                      onChanged: (bool? value) {
                        controller.toggleSelectInstructionAll();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5.5,
                  width: SizeConfig.widthMultiplier * 82,
                  child: TextField(
                    controller: controller.searchControllerInstruction,
                    // readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Search here..',
                      hintStyle: TextStyle(
                        fontSize: AppTextSize.textSizeSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.searchfeild,
                      ),
                      prefixIcon: Container(
                        padding:
                            EdgeInsets.all(10.0), // Adjust padding as needed

                        child: Image.asset(
                          'assets/icons/Search.png',
                          fit:
                              BoxFit.contain, // Ensures it stays within the box
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.searchfeildcolor, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.searchfeildcolor, width: 0.5),
                      ),
                    ),
                    onChanged: (value) {
                      controller.searchDataInstruction(value);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            SizedBox(
              height: 270,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(() {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.filteredDetailsInstruction.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                visualDensity: VisualDensity.compact,
                                contentPadding: EdgeInsets.only(
                                    top: 0, bottom: 0, left: 16, right: 16),
                                leading: SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: Checkbox(
                                    value: controller
                                            .filteredDetailsInstruction[index]
                                        ['isChecked'] as bool,
                                    activeColor: AppColors.buttoncolor,
                                    side: BorderSide(
                                      color: AppColors.secondaryText,
                                      width: 1.2,
                                    ),
                                    onChanged: (bool? value) {
                                      controller
                                          .toggleCheckboxInstruction(index);
                                    },
                                  ),
                                ),
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //${index + 1}.

                                    AppTextWidget(
                                      text: controller
                                          .filteredDetailsInstruction[index]
                                              ['title']
                                          .toString(),
                                      fontSize: AppTextSize.textSizeExtraSmall,
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
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
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
                      Get.to(LabourUndertakingScreen());
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
