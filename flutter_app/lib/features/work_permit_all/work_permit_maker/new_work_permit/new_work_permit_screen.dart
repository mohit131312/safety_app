import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_elevated_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/work_permit_all/work_permit/work_permit_controller.dart';
import 'package:flutter_app/features/work_permit_all/work_permit_maker/new_work_permit/new_work_permit_controller.dart';
import 'package:flutter_app/features/work_permit_all/work_permit_maker/work_permit_date/work_Permit_date_controller.dart';
import 'package:flutter_app/features/work_permit_all/work_permit_maker/work_permit_precaution/work_permit_precaution_screen.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NewWorkPermitScreen extends StatelessWidget {
  NewWorkPermitScreen({super.key});
  final WorkPermitDateController dateController =
      Get.put(WorkPermitDateController());

  final NewWorkPermitController newWorkPermitController =
      Get.put(NewWorkPermitController());

  void showCustomBottomSheetDate(BuildContext context) {
    final WorkPermitDateController dateController =
        Get.put(WorkPermitDateController());

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow bottom sheet to resize based on content
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Avoid infinite height
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Start Date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Start Date',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              dateController.pickStartDate(context);
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Obx(() => Text(
                                    // ignore: unnecessary_null_comparison
                                    dateController.selectedStartDate.value !=
                                            null
                                        ? "${dateController.selectedStartDate.value.toLocal()}"
                                            .split(' ')[0]
                                        : 'Select Start Date',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      // End Date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('End Date',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              dateController.pickEndDate(context);
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Obx(() => Text(
                                    // ignore: unnecessary_null_comparison
                                    dateController.selectedEndDate.value != null
                                        ? "${dateController.selectedEndDate.value.toLocal()}"
                                            .split(' ')[0]
                                        : 'Select End Date',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Start Time Section with AM/PM toggle
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Start Time
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Start Time',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () async {
                              TimeOfDay? selectedTime = await showTimePicker(
                                context: context,
                                initialTime:
                                    dateController.selectedStartTime.value,

                                initialEntryMode: TimePickerEntryMode
                                    .dial, // Set to dial mode
                              ).then((TimeOfDay? time) {
                                if (time != null) {
                                  print(
                                      "Selected time: ${time.format(context)}"); // This will display time in 12-hour format
                                }
                                return null;
                              });
                              if (selectedTime != null) {
                                dateController.updateStartTime(selectedTime);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Obx(() => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        dateController
                                                    // ignore: unnecessary_null_comparison
                                                    .selectedStartTime
                                                    // ignore: unnecessary_null_comparison
                                                    .value !=
                                                null
                                            ? dateController
                                                .selectedStartTime.value
                                                .format(context)
                                            : 'Select Start Time',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      Text(
                                        dateController.selectedStartTime.value
                                                    .period ==
                                                DayPeriod.am
                                            ? 'AM'
                                            : 'PM',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      SizedBox(width: 20)
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                      // End Time with AM/PM toggle
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('End Time',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () async {
                              TimeOfDay? selectedTime = await showTimePicker(
                                context: context,
                                initialTime:
                                    dateController.selectedEndTime.value
                                // ??
                                //  TimeOfDay.now()
                                ,
                                initialEntryMode: TimePickerEntryMode
                                    .dial, // Set to dial mode
                              );
                              if (selectedTime != null) {
                                dateController.updateEndTime(selectedTime);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Obx(() => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        // ignore: unnecessary_null_comparison
                                        dateController.selectedEndTime.value !=
                                                null
                                            ? dateController
                                                .selectedEndTime.value
                                                .format(context)
                                            : 'Select End Time',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      Text(
                                        dateController.selectedEndTime.value
                                                    .period ==
                                                DayPeriod.am
                                            ? 'AM'
                                            : 'PM',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 100,
                          // decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     border: Border.all(width: 1, color: Colors.white),
                          //     borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          String startDate = dateController
                              .selectedStartDate.value
                              .toLocal()
                              .toString()
                              .split(' ')[0];
                          String endDate = dateController.selectedEndDate.value
                              .toLocal()
                              .toString()
                              .split(' ')[0];

                          String startTime = dateController
                              .selectedStartTime.value
                              .format(context);
                          String endTime = dateController.selectedEndTime.value
                              .format(context);

                          String workDuration =
                              '$startDate $startTime - $endDate $endTime';

                          newWorkPermitController.dateController.text =
                              workDuration; // Set the TextFormField value
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: AppColors.buttoncolor,
                              border: Border.all(
                                width: 1,
                                color: AppColors.buttoncolor,
                              ),
                              borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            'Set',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 6,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

//-----------------------------------------
  void showBuildingSelectionSheetBulding(
      BuildContext context, WorkPermitController controller) {
    final NewWorkPermitController newWorkPermitController =
        Get.find<NewWorkPermitController>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppTextWidget(
                    text: 'Select Building',
                    fontSize: AppTextSize.textSizeMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText,
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 20,
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Container(
                height: 1.2,
                width: SizeConfig.widthMultiplier * 100,
                decoration: BoxDecoration(color: Colors.grey),
              ),

              SizedBox(height: SizeConfig.heightMultiplier * 2.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5.5,
                    width: SizeConfig.widthMultiplier * 82,
                    child: TextField(
                      controller:
                          newWorkPermitController.searchControllerBuilding,
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
                        newWorkPermitController.searchDataBuilding(value);
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
                          itemCount: newWorkPermitController
                              .filteredDetailsBuilding.length,
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
                                      value: newWorkPermitController
                                              .filteredDetailsBuilding[index]
                                          ['isChecked'] as bool,
                                      activeColor: AppColors.buttoncolor,
                                      side: BorderSide(
                                        color: AppColors.secondaryText,
                                        width: 1.2,
                                      ),
                                      onChanged: (bool? value) {
                                        newWorkPermitController
                                            .toggleCheckboxBuilding(index);
                                      },
                                    ),
                                  ),
                                  title: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //${index + 1}.

                                      AppTextWidget(
                                        text: newWorkPermitController
                                            .filteredDetailsBuilding[index]
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

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttoncolor, // Button color
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // ✅ Rounded Corners
                    ),
                  ),
                  child: Text(
                    "Add To List",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
              ),
            ],
          ),
        );
      },
    );
  }
  //--------------------------------------------------------------------------

  void showBuildingSelectionSheetFloor(
      BuildContext context, WorkPermitController controller) {
    final NewWorkPermitController newWorkPermitController =
        Get.find<NewWorkPermitController>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppTextWidget(
                    text: 'Select Floor',
                    fontSize: AppTextSize.textSizeMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText,
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 20,
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Container(
                height: 1.2,
                width: SizeConfig.widthMultiplier * 100,
                decoration: BoxDecoration(color: Colors.grey),
              ),

              SizedBox(height: SizeConfig.heightMultiplier * 2.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5.5,
                    width: SizeConfig.widthMultiplier * 82,
                    child: TextField(
                      controller: newWorkPermitController.searchControllerFloor,
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
                        newWorkPermitController.searchDataFloor(value);
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
                          itemCount: newWorkPermitController
                              .filteredDetailsFloor.length,
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
                                      value: newWorkPermitController
                                              .filteredDetailsFloor[index]
                                          ['isChecked'] as bool,
                                      activeColor: AppColors.buttoncolor,
                                      side: BorderSide(
                                        color: AppColors.secondaryText,
                                        width: 1.2,
                                      ),
                                      onChanged: (bool? value) {
                                        newWorkPermitController
                                            .toggleCheckboxFloor(index);
                                      },
                                    ),
                                  ),
                                  title: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //${index + 1}.

                                      AppTextWidget(
                                        text: newWorkPermitController
                                            .filteredDetailsFloor[index]
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

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttoncolor, // Button color
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // ✅ Rounded Corners
                    ),
                  ),
                  child: Text(
                    "Add To List",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0.33,
                          backgroundColor: AppColors.searchfeildcolor,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.defaultPrimary),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '01/03',
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
                    text: 'Work Permit Details',
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
                    color: AppColors.secondaryText,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Row(
                    children: [
                      AppTextWidget(
                        text: 'Select Category',
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(
                      () => DropdownButtonFormField<String>(
                        // isDense: false,

                        value: newWorkPermitController
                                .selectedcategory.value.isNotEmpty
                            ? newWorkPermitController.selectedcategory.value
                            : null,
                        items: newWorkPermitController.category
                            .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: AppTextWidget(
                                      text: category,
                                      fontSize: AppTextSize.textSizeMedium,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryText),
                                ))
                            .toList(),
                        onChanged: (value) {
                          newWorkPermitController.selectedcategory.value =
                              value ?? '';
                        },
                        hint: AppTextWidget(
                          text: 'Select Category',
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
                        text: 'Description of Work ',
                        fontSize: AppTextSize.textSizeSmall,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryText,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: TextFormField(
                      controller: newWorkPermitController.descWorkrController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Description of Work here...',
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
                  Row(
                    children: [
                      AppTextWidget(
                        text: 'Attach Toolbox Training',
                        fontSize: AppTextSize.textSizeSmall,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryText,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(
                      () => DropdownButtonFormField<String>(
                        // isDense: false,

                        value: newWorkPermitController
                                .selectedtoolboxtrainig.value.isNotEmpty
                            ? newWorkPermitController
                                .selectedtoolboxtrainig.value
                            : null,
                        items: newWorkPermitController.toolboxtrainig
                            .map((toolboxtrainig) => DropdownMenuItem(
                                  value: toolboxtrainig,
                                  child: AppTextWidget(
                                      text: toolboxtrainig,
                                      fontSize: AppTextSize.textSizeMedium,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryText),
                                ))
                            .toList(),
                        onChanged: (value) {
                          newWorkPermitController.selectedtoolboxtrainig.value =
                              value ?? '';
                        },
                        hint: AppTextWidget(
                          text: 'Select toolbox training',
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
                        text: 'Name of Work Permit',
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
                      controller:
                          newWorkPermitController.nameworkpermitController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Work permit name',
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

                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: AppTextWidget(
                          text: 'Select Building',
                          fontSize: AppTextSize.textSizeSmall,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryText,
                        ),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(
                      () => GestureDetector(
                        onTap: () {
                          showBuildingSelectionSheetBulding(
                              context, Get.find<WorkPermitController>());
                        },
                        child: AbsorbPointer(
                          // Prevents default dropdown behavior
                          child: DropdownButtonFormField<String>(
                            value: newWorkPermitController
                                    .selectedBuilding.value.isNotEmpty
                                ? newWorkPermitController.selectedBuilding.value
                                : null,
                            items: newWorkPermitController.buildings
                                .map((building) => DropdownMenuItem(
                                      value: building,
                                      child: AppTextWidget(
                                        text: building,
                                        fontSize: AppTextSize.textSizeMedium,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primaryText,
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              // No need to set it here, since selection happens in modal sheet
                            },
                            hint: AppTextWidget(
                              text: 'Select Building',
                              fontSize: AppTextSize.textSizeSmall,
                              fontWeight: FontWeight.w400,
                              color: AppColors.searchfeild,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down, // Custom dropdown icon
                              color: AppColors.searchfeild,
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
                                    color: AppColors.searchfeildcolor,
                                    width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColors.searchfeildcolor,
                                    width: 1),
                              ),
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
                        text: 'Select Floor',
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(
                      () => GestureDetector(
                        onTap: () {
                          showBuildingSelectionSheetFloor(
                              context, Get.find<WorkPermitController>());
                        },
                        child: AbsorbPointer(
                          // Prevents default dropdown behavior
                          child: DropdownButtonFormField<String>(
                            // isDense: false,

                            value: newWorkPermitController
                                    .selectedFloor.value.isNotEmpty
                                ? newWorkPermitController.selectedFloor.value
                                : null,
                            items: newWorkPermitController.floors
                                .map((floors) => DropdownMenuItem(
                                      value: floors,
                                      child: AppTextWidget(
                                          text: floors,
                                          fontSize: AppTextSize.textSizeMedium,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primaryText),
                                    ))
                                .toList(),
                            onChanged: (value) {},
                            hint: AppTextWidget(
                              text: 'Select floor',
                              fontSize: AppTextSize.textSizeSmall,
                              fontWeight: FontWeight.w400,
                              color: AppColors.searchfeild,
                            ),
                            icon: Icon(
                              Icons
                                  .keyboard_arrow_down, // Your custom dropdown icon
                              color: AppColors
                                  .searchfeild, // Adjust color as needed
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
                                    color: AppColors.searchfeildcolor,
                                    width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColors.searchfeildcolor,
                                    width: 1),
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
                    ),
                  ),

                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      // final WorkPermitDateController dateController =
                      //     Get.put(WorkPermitDateController());
                      // dateController.pickDate(context);
                      showCustomBottomSheetDate(context);
                    },
                    child: Row(
                      children: [
                        AppTextWidget(
                          text: 'Duration of Work',
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
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      showCustomBottomSheetDate(context);
                    },
                    child: Container(
                      height: 50,
                      width: SizeConfig.widthMultiplier * 91,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColors.searchfeildcolor, width: 1),
                      ),
                      child: Obx(() {
                        String workDuration =
                            '${dateController.selectedStartDate.value.toLocal().toString().split(' ')[0]} '
                            '${dateController.selectedStartTime.value.format(context)} - '
                            '${dateController.selectedEndDate.value.toLocal().toString().split(' ')[0]} '
                            '${dateController.selectedEndTime.value.format(context)}';
                        return Text(
                          workDuration.isEmpty
                              ? 'Select Duration of Work'
                              : workDuration,
                          style: TextStyle(
                            fontSize: AppTextSize.textSizeSmall,
                            fontWeight: FontWeight.w400,
                            color: AppColors.searchfeild,
                          ),
                        );
                      }),
                    ),
                  ),

                  // GestureDetector(
                  //   onTap: () {
                  //     showCustomBottomSheetDate(context);
                  //   },
                  //   child: Container(
                  //     decoration: BoxDecoration(),
                  //     child: TextFormField(
                  //       controller:
                  //           newWorkPermitController.nameworkpermitController,
                  //       textInputAction: TextInputAction.next,
                  //       readOnly: true,
                  //       decoration: InputDecoration(
                  //         hintText: 'Select Duration of Work',
                  //         hintStyle: TextStyle(
                  //           fontSize: AppTextSize.textSizeSmall,
                  //           fontWeight: FontWeight.w400,
                  //           color: AppColors.searchfeild,
                  //         ),
                  //         contentPadding: EdgeInsets.symmetric(
                  //             vertical: 13, horizontal: 12),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //           borderSide: BorderSide(
                  //               color: AppColors.searchfeildcolor, width: 1),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //           borderSide: BorderSide(
                  //               color: AppColors.searchfeildcolor, width: 1),
                  //         ),
                  //         errorBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //           borderSide: BorderSide(
                  //             color: const Color.fromARGB(255, 126, 16, 9),
                  //             width: 1,
                  //           ),
                  //         ),
                  //         focusedErrorBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //           borderSide: BorderSide(
                  //             color: const Color.fromARGB(255, 126, 16, 9),
                  //             width: 1,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),

                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3,
                  ),
                  //--------------------------------------
                  AppTextWidget(
                    text: 'Documents Required ',
                    fontSize: AppTextSize.textSizeSmall,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText,
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
                                newWorkPermitController.isCheckedPermit.value,
                            activeColor: AppColors.buttoncolor,
                            side: BorderSide(
                              color: AppColors.secondaryText,
                              width: 1.2,
                            ),
                            onChanged: (bool? value) {
                              newWorkPermitController.toggleSelectAll();
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
                          controller: newWorkPermitController.searchController,
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
                            newWorkPermitController.searchData(value);
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
                              itemCount: newWorkPermitController
                                  .filteredDetailsPermit.length,
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
                                          value: newWorkPermitController
                                                  .filteredDetailsPermit[index]
                                              ['isChecked'] as bool,
                                          activeColor: AppColors.buttoncolor,
                                          side: BorderSide(
                                            color: AppColors.secondaryText,
                                            width: 1.2,
                                          ),
                                          onChanged: (bool? value) {
                                            newWorkPermitController
                                                .toggleCheckbox(index);
                                          },
                                        ),
                                      ),
                                      title: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //${index + 1}.

                                          AppTextWidget(
                                            text: newWorkPermitController
                                                .filteredDetailsPermit[index]
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

                  SizedBox(height: SizeConfig.heightMultiplier * 5),
                  AppElevatedButton(
                      text: 'Next',
                      onPressed: () {
                        Get.to(WorkPermitPrecautionScreen());
                      }),
                  SizedBox(height: SizeConfig.heightMultiplier * 5),
                ],
              )),
        ),
      ),
    );
  }
}
