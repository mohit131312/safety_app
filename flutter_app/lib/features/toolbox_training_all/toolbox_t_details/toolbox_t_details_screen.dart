import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_elevated_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/components/cutom_textformfeild.dart';
import 'package:flutter_app/features/toolbox_training_all/select_reviewer/select_reviewer.dart';
import 'package:flutter_app/features/toolbox_training_all/toolbox_add_trainee/toolbox_add_trainee_screen.dart';
import 'package:flutter_app/features/toolbox_training_all/toolbox_t_details/toolbox_t_details_controller.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

class ToolboxTDetailsScreen extends StatelessWidget {
  ToolboxTDetailsScreen({super.key});

  final ToolboxTDetailsController controller =
      Get.put(ToolboxTDetailsController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
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
                  text: AppTexts.toolboxtraining,
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
                    size: SizeConfig.heightMultiplier * 2.0,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.5,
                        backgroundColor: AppColors.searchfeildcolor,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.defaultPrimary),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '01/02',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                AppTextWidget(
                  text: AppTexts.tbtdetails,
                  fontSize: AppTextSize.textSizeMedium,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),

                //enterdetails
                AppTextWidget(
                  text: AppTexts.enterdetails,
                  fontSize: AppTextSize.textSizeExtraSmall,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                Row(
                  children: [
                    AppTextWidget(
                      text: AppTexts.activity,
                      fontSize: AppTextSize.textSizeExtraSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                      text: AppTexts.star,
                      fontSize: AppTextSize.textSizeExtraSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.starcolor,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                        controller.selectedActivity.value = value ?? '';
                      },
                      hint: AppTextWidget(
                        text: "Search Activity",
                        fontSize: AppTextSize.textSizeSmalle,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryText,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
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
                SizedBox(height: SizeConfig.heightMultiplier * 2.0),
                AppTextWidget(
                  text: AppTexts.attachworkpermit,
                  fontSize: AppTextSize.textSizeExtraSmall,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText,
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => DropdownButtonFormField<String>(
                      value: controller.selectedWorkPermit.value.isNotEmpty
                          ? controller.selectedWorkPermit.value
                          : null,
                      items: controller.workPermits
                          .map((workPermits) => DropdownMenuItem(
                                value: workPermits,
                                child: Text(
                                  workPermits,
                                  style: TextStyle(
                                      fontSize: AppTextSize.textSizeSmalle,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.secondaryText),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        controller.selectedWorkPermit.value = value ?? '';
                      },
                      hint: AppTextWidget(
                        text: "Select Work Permit ",
                        fontSize: AppTextSize.textSizeSmalle,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryText,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
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
                SizedBox(height: SizeConfig.heightMultiplier * 2.0),
                Row(
                  children: [
                    AppTextWidget(
                      text: AppTexts.nameoftoolboxtraining,
                      fontSize: AppTextSize.textSizeExtraSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                      text: AppTexts.star,
                      fontSize: AppTextSize.textSizeExtraSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.starcolor,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1),

                CustomTextFormField(
                  controller: controller.tbtController,
                  hintText: 'Enter Name of TBT',
                  fontSize: AppTextSize.textSizeSmalle,
                  fontWeight: FontWeight.w400,
                  hintTextColor: AppColors.secondaryText,
                  borderColor: AppColors.searchfeildcolor,
                  errorBorderColor: const Color.fromARGB(255, 126, 16, 9),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2.0),
                AppTextWidget(
                  text: AppTexts.detailsoftraining,
                  fontSize: AppTextSize.textSizeExtraSmall,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText,
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1),
                CustomTextFormField(
                  controller: controller.detailsController,
                  hintText: 'Enter Details',
                  fontSize: AppTextSize.textSizeSmalle,
                  fontWeight: FontWeight.w400,
                  hintTextColor: AppColors.secondaryText,
                  borderColor: AppColors.searchfeildcolor,
                  errorBorderColor: const Color.fromARGB(255, 126, 16, 9),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Row(
                  children: [
                    AppTextWidget(
                      text: AppTexts.reviewers,
                      fontSize: AppTextSize.textSizeSmallm,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                      text: AppTexts.star,
                      fontSize: AppTextSize.textSizeExtraSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.starcolor,
                    ),
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
                    Get.to(SelectReviewer());
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
                        text: "Add Reviewer",
                        fontSize: AppTextSize.textSizeSmallm,
                        fontWeight: FontWeight.w400,
                        color: AppColors.thirdText,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),

                Row(
                  children: [
                    AppTextWidget(
                      text: AppTexts.instructiongiven,
                      fontSize: AppTextSize.textSizeSmallm,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                      text: AppTexts.star,
                      fontSize: AppTextSize.textSizeExtraSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.starcolor,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1.8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: Checkbox(
                          value: controller.isChecked.value,
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
                      width: SizeConfig.widthMultiplier * 80,
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
                  height: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Obx(() {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.filteredDetails.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    leading: SizedBox(
                                      width: 24.0,
                                      height: 24.0,
                                      child: Checkbox(
                                        value: controller.filteredDetails[index]
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //${index + 1}.
                                        AppTextWidget(
                                          text: "${index + 1}.  ",
                                          fontSize:
                                              AppTextSize.textSizeExtraSmall,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primaryText,
                                        ),
                                        Expanded(
                                          child: AppTextWidget(
                                            text: controller
                                                .filteredDetails[index]['title']
                                                .toString(),
                                            fontSize:
                                                AppTextSize.textSizeExtraSmall,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primaryText,
                                          ),
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

                AppElevatedButton(
                  text: "Next",
                  onPressed: () {
                    Get.to(ToolboxAddTraineeScreen());
                  },
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
