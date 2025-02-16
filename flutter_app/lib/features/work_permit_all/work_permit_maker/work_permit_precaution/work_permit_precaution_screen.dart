import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_medium_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/work_permit_all/work_permit_maker/assign_checker/assign_checker_screen.dart';
import 'package:flutter_app/features/work_permit_all/work_permit_maker/work_permit_precaution/work_permit_precaution_controller.dart';
import 'package:flutter_app/features/work_permit_all/work_permit_maker/work_permit_undertaking/work_permit_under_screen.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class WorkPermitPrecautionScreen extends StatelessWidget {
  WorkPermitPrecautionScreen({super.key});

  final WorkPermitPrecautionController workPermitPrecautionController =
      Get.put(WorkPermitPrecautionController());
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
                text: 'New Work Permit',
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
              text: AppTexts.precaution,
              fontSize: AppTextSize.textSizeMediumm,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 0.3,
            ),
            AppTextWidget(
              text: 'Enter work permit details.',
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
                  text: 'Hazards Identified',
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
                      value:
                          workPermitPrecautionController.isCheckedHazards.value,
                      activeColor: AppColors.buttoncolor,
                      side: BorderSide(
                        color: AppColors.secondaryText,
                        width: 1.2,
                      ),
                      onChanged: (bool? value) {
                        workPermitPrecautionController.toggleSelectAllHazards();
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
                          controller: workPermitPrecautionController
                              .searchHazardsController,
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
                            workPermitPrecautionController
                                .searchDataHazards(value);
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
                              itemCount: workPermitPrecautionController
                                  .filteredDetailsHazards.length,
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
                                          value: workPermitPrecautionController
                                                  .filteredDetailsHazards[index]
                                              ['isChecked'] as bool,
                                          activeColor: AppColors.buttoncolor,
                                          side: BorderSide(
                                            color: AppColors.secondaryText,
                                            width: 1.2,
                                          ),
                                          onChanged: (bool? value) {
                                            workPermitPrecautionController
                                                .toggleCheckboxHazards(index);
                                          },
                                        ),
                                      ),
                                      title: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //${index + 1}.

                                          AppTextWidget(
                                            text: workPermitPrecautionController
                                                .filteredDetailsHazards[index]
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
            //----------------------------------------------------------------
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.5,
            ),
            Row(
              children: [
                AppTextWidget(
                  text: 'Precautions in Place',
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
                      value: workPermitPrecautionController
                          .isCheckedPrecaution.value,
                      activeColor: AppColors.buttoncolor,
                      side: BorderSide(
                        color: AppColors.secondaryText,
                        width: 1.2,
                      ),
                      onChanged: (bool? value) {
                        workPermitPrecautionController
                            .toggleSelectAllPrecaution();
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
                          controller: workPermitPrecautionController
                              .searchPrecautionController,
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
                            workPermitPrecautionController
                                .searchDataPrecaution(value);
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
                              itemCount: workPermitPrecautionController
                                  .filteredDetailsPrecaution.length,
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
                                          value: workPermitPrecautionController
                                                  .filteredDetailsPrecaution[
                                              index]['isChecked'] as bool,
                                          activeColor: AppColors.buttoncolor,
                                          side: BorderSide(
                                            color: AppColors.secondaryText,
                                            width: 1.2,
                                          ),
                                          onChanged: (bool? value) {
                                            workPermitPrecautionController
                                                .toggleCheckboxPrecaution(
                                                    index);
                                          },
                                        ),
                                      ),
                                      title: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //${index + 1}.

                                          AppTextWidget(
                                            text: workPermitPrecautionController
                                                .filteredDetailsPrecaution[
                                                    index]['title']
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
            //----------------------------------------------------------------
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.5,
            ),
            Row(
              children: [
                AppTextWidget(
                  text: 'PPEs issued and to be used by the Workforce',
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
                      value: workPermitPrecautionController.isCheckedPPE.value,
                      activeColor: AppColors.buttoncolor,
                      side: BorderSide(
                        color: AppColors.secondaryText,
                        width: 1.2,
                      ),
                      onChanged: (bool? value) {
                        workPermitPrecautionController.toggleSelectAllPPE();
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
                          controller: workPermitPrecautionController
                              .searchPPEController,
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
                            workPermitPrecautionController.searchDataPPE(value);
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
                              itemCount: workPermitPrecautionController
                                  .filteredDetailsPPE.length,
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
                                          value: workPermitPrecautionController
                                                  .filteredDetailsPPE[index]
                                              ['isChecked'] as bool,
                                          activeColor: AppColors.buttoncolor,
                                          side: BorderSide(
                                            color: AppColors.secondaryText,
                                            width: 1.2,
                                          ),
                                          onChanged: (bool? value) {
                                            workPermitPrecautionController
                                                .toggleCheckboxPPE(index);
                                          },
                                        ),
                                      ),
                                      title: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //${index + 1}.

                                          AppTextWidget(
                                            text: workPermitPrecautionController
                                                .filteredDetailsPPE[index]
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
            //----------------------------------------------------------------
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.5,
            ),
            Row(
              children: [
                AppTextWidget(
                  text: 'Tools & Equipment Provided *',
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
                      value: workPermitPrecautionController.isCheckedTE.value,
                      activeColor: AppColors.buttoncolor,
                      side: BorderSide(
                        color: AppColors.secondaryText,
                        width: 1.2,
                      ),
                      onChanged: (bool? value) {
                        workPermitPrecautionController.toggleSelectAllTE();
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
                          controller:
                              workPermitPrecautionController.searchTEController,
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
                            workPermitPrecautionController.searchDataTE(value);
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
                              itemCount: workPermitPrecautionController
                                  .filteredDetailsTE.length,
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
                                          value: workPermitPrecautionController
                                                  .filteredDetailsTE[index]
                                              ['isChecked'] as bool,
                                          activeColor: AppColors.buttoncolor,
                                          side: BorderSide(
                                            color: AppColors.secondaryText,
                                            width: 1.2,
                                          ),
                                          onChanged: (bool? value) {
                                            workPermitPrecautionController
                                                .toggleCheckboxTE(index);
                                          },
                                        ),
                                      ),
                                      title: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //${index + 1}.

                                          AppTextWidget(
                                            text: workPermitPrecautionController
                                                .filteredDetailsTE[index]
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
              height: SizeConfig.heightMultiplier * 3,
            ),
            Row(
              children: [
                AppTextWidget(
                  text: 'Assign Checkers',
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
              height: SizeConfig.heightMultiplier * 2.5,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                  ],
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextWidget(
                        text: 'Name',
                        fontSize: AppTextSize.textSizeSmallm,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryText),
                    AppTextWidget(
                        text: 'Designation',
                        fontSize: AppTextSize.textSizeSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.searchfeild),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 60,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
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
              onPressed: () {},
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
                  GestureDetector(
                    onTap: () {
                      Get.to(AssignCheckerScreen());
                    },
                    child: AppTextWidget(
                      text: "Add Checker",
                      fontSize: AppTextSize.textSizeSmallm,
                      fontWeight: FontWeight.w400,
                      color: AppColors.thirdText,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1.5,
            ),
            AppTextWidget(
                text: 'Set the checkers in sequence?',
                fontSize: AppTextSize.textSizeSmall,
                fontWeight: FontWeight.w400,
                color: AppColors.searchfeild),
            SizedBox(
              height: SizeConfig.heightMultiplier * 6,
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
                      Get.to(WorkPermitUnderScreen());
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
