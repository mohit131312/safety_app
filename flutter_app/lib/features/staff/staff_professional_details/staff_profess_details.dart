// import 'package:flutter/material.dart';
// import 'package:flutter_app/components/app_medium_button.dart';
// import 'package:flutter_app/components/app_text_widget.dart';
// import 'package:flutter_app/features/labour_documentation/labour_documentation.dart';
// import 'package:flutter_app/features/staff/staff_professional_details/staff_profess_details_controller.dart';
// import 'package:flutter_app/utils/app_color.dart';
// import 'package:flutter_app/utils/app_texts.dart';
// import 'package:flutter_app/utils/app_textsize.dart';
// import 'package:flutter_app/utils/size_config.dart';
// import 'package:get/get.dart';

// // ignore: must_be_immutable
// class StaffProfessDetails extends StatelessWidget {
//   StaffProfessDetails({super.key});

//   final StaffProfessDetailsController staffProfessDetailsController =
//       Get.put(StaffProfessDetailsController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: false,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(SizeConfig.heightMultiplier * 10),
//         child: ClipRRect(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(20),
//             bottomRight: Radius.circular(20),
//           ),
//           child: AppBar(
//             scrolledUnderElevation: 0.0,
//             elevation: 0,
//             backgroundColor: AppColors.buttoncolor,
//             foregroundColor: AppColors.buttoncolor,
//             centerTitle: true,
//             toolbarHeight: SizeConfig.heightMultiplier * 10,
//             title: Padding(
//               padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
//               child: AppTextWidget(
//                 text: AppTexts.addlabour,
//                 fontSize: AppTextSize.textSizeMedium,
//                 fontWeight: FontWeight.w400,
//                 color: AppColors.primary,
//               ),
//             ),
//             leading: Padding(
//               padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
//               child: IconButton(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 icon: Icon(
//                   Icons.arrow_back_ios,
//                   size: SizeConfig.heightMultiplier * 2.5,
//                   color: AppColors.primary,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: SizeConfig.widthMultiplier * 4,
//             vertical: SizeConfig.heightMultiplier * 2,
//           ),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: LinearProgressIndicator(
//                     value: 0.4,
//                     backgroundColor: AppColors.searchfeildcolor,
//                     valueColor:
//                         AlwaysStoppedAnimation<Color>(AppColors.defaultPrimary),
//                   ),
//                 ),
//                 SizedBox(width: 8.0),
//                 Text(
//                   '02/05',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: SizeConfig.heightMultiplier * 2.5,
//             ),
//             AppTextWidget(
//               text: AppTexts.labourprofessinaldetails,
//               fontSize: AppTextSize.textSizeMediumm,
//               fontWeight: FontWeight.w600,
//               color: AppColors.primaryText,
//             ),
//             SizedBox(
//               height: SizeConfig.heightMultiplier * 0.3,
//             ),
//             AppTextWidget(
//               text: AppTexts.enterlabourprofessionaldetails,
//               fontSize: AppTextSize.textSizeSmalle,
//               fontWeight: FontWeight.w400,
//               color: AppColors.secondaryText,
//             ),
//             SizedBox(
//               height: SizeConfig.heightMultiplier * 1.5,
//             ),
//             Row(
//               children: [
//                 AppTextWidget(
//                     text: AppTexts.trade,
//                     fontSize: AppTextSize.textSizeSmall,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.primaryText),
//                 AppTextWidget(
//                     text: AppTexts.star,
//                     fontSize: AppTextSize.textSizeExtraSmall,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.starcolor),
//               ],
//             ),
//             SizedBox(
//               height: SizeConfig.heightMultiplier * 1,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Obx(
//                 () => DropdownButtonFormField<String>(
//                   // isDense: false,

//                   value: staffProfessDetailsController
//                           .selectedtrade.value.isNotEmpty
//                       ? staffProfessDetailsController.selectedtrade.value
//                       : null,
//                   items: staffProfessDetailsController.trade
//                       .map((trade) => DropdownMenuItem(
//                             value: trade,
//                             child: Text(
//                               trade,
//                               style: TextStyle(
//                                   fontSize: AppTextSize.textSizeSmalle,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColors.secondaryText),
//                             ),
//                           ))
//                       .toList(),
//                   onChanged: (value) {
//                     staffProfessDetailsController.selectedtrade.value =
//                         value ?? '';
//                   },
//                   hint: AppTextWidget(
//                     text: 'Select Trade',
//                     fontSize: AppTextSize.textSizeSmall,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.searchfeild,
//                   ),
//                   icon: Icon(
//                     Icons.keyboard_arrow_down, // Your custom dropdown icon
//                     color: AppColors.searchfeild, // Adjust color as needed
//                     size: 27,
//                   ),
//                   decoration: InputDecoration(
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 13, horizontal: 12),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(
//                           color: AppColors.searchfeildcolor, width: 1),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(
//                           color: AppColors.searchfeildcolor, width: 1),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(
//                         color: const Color.fromARGB(255, 126, 16, 9),
//                         width: 1,
//                       ),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(
//                         color: const Color.fromARGB(255, 126, 16, 9),
//                         width: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: SizeConfig.heightMultiplier * 2,
//             ),
//             Row(
//               children: [
//                 AppTextWidget(
//                   text: AppTexts.yoexperience,
//                   fontSize: AppTextSize.textSizeSmall,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.primaryText,
//                 ),
//                 AppTextWidget(
//                     text: AppTexts.star,
//                     fontSize: AppTextSize.textSizeExtraSmall,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.starcolor),
//               ],
//             ),
//             SizedBox(
//               height: SizeConfig.heightMultiplier * 1,
//             ),
//             Container(
//               decoration: BoxDecoration(),
//               child: TextFormField(
//                 controller:
//                     staffProfessDetailsController.yoexperienceController,
//                 textInputAction: TextInputAction.next,
//                 decoration: InputDecoration(
//                   hintText: 'Enter year count',
//                   hintStyle: TextStyle(
//                     fontSize: AppTextSize.textSizeSmall,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.searchfeild,
//                   ),
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 13, horizontal: 12),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide:
//                         BorderSide(color: AppColors.searchfeildcolor, width: 1),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide:
//                         BorderSide(color: AppColors.searchfeildcolor, width: 1),
//                   ),
//                   errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(
//                       color: const Color.fromARGB(255, 126, 16, 9),
//                       width: 1,
//                     ),
//                   ),
//                   focusedErrorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(
//                       color: const Color.fromARGB(255, 126, 16, 9),
//                       width: 1,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: SizeConfig.heightMultiplier * 2,
//             ),
//             Row(
//               children: [
//                 AppTextWidget(
//                   text: AppTexts.skill,
//                   fontSize: AppTextSize.textSizeSmall,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.primaryText,
//                 ),
//                 AppTextWidget(
//                     text: AppTexts.star,
//                     fontSize: AppTextSize.textSizeExtraSmall,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.starcolor),
//               ],
//             ),
//             Obx(() => Row(
//                   children: [
//                     Radio(
//                       value: 'Skilled',
//                       groupValue: staffProfessDetailsController
//                           .selectedSkillLevel.value,
//                       activeColor:
//                           Colors.orange, // Matches the UI in your image
//                       onChanged: (value) {
//                         staffProfessDetailsController.updateSkillLevel(value!);
//                       },
//                     ),
//                     AppTextWidget(
//                       text: 'Skilled',
//                       fontSize: AppTextSize.textSizeSmallm,
//                       fontWeight: FontWeight.w500,
//                       color: AppColors.searchfeild,
//                     ),
//                     SizedBox(width: 16), // Space between options
//                     Radio(
//                       value: 'Unskilled',
//                       groupValue: staffProfessDetailsController
//                           .selectedSkillLevel.value,
//                       activeColor: Colors.orange,
//                       onChanged: (value) {
//                         staffProfessDetailsController.updateSkillLevel(value!);
//                       },
//                     ),
//                     AppTextWidget(
//                       text: 'Unskilled',
//                       fontSize: AppTextSize.textSizeSmallm,
//                       fontWeight: FontWeight.w500,
//                       color: AppColors.searchfeild,
//                     ),
//                   ],
//                 )),
//             SizedBox(
//               height: SizeConfig.heightMultiplier * 2,
//             ),
//             Row(
//               children: [
//                 AppTextWidget(
//                   text: AppTexts.firmname,
//                   fontSize: AppTextSize.textSizeSmall,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.primaryText,
//                 ),
//                 AppTextWidget(
//                     text: AppTexts.star,
//                     fontSize: AppTextSize.textSizeExtraSmall,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.starcolor),
//               ],
//             ),
//             SizedBox(
//               height: SizeConfig.heightMultiplier * 1,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Obx(
//                 () => DropdownButtonFormField<String>(
//                   // isDense: false,

//                   value: staffProfessDetailsController
//                           .selectedFirmname.value.isNotEmpty
//                       ? staffProfessDetailsController.selectedFirmname.value
//                       : null,
//                   items: staffProfessDetailsController.firmname
//                       .map((firmname) => DropdownMenuItem(
//                             value: firmname,
//                             child: Text(
//                               firmname,
//                               style: TextStyle(
//                                   fontSize: AppTextSize.textSizeSmalle,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColors.secondaryText),
//                             ),
//                           ))
//                       .toList(),
//                   onChanged: (value) {
//                     staffProfessDetailsController.selectedFirmname.value =
//                         value ?? '';
//                   },
//                   hint: AppTextWidget(
//                     text: 'Select Name',
//                     fontSize: AppTextSize.textSizeSmall,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.searchfeild,
//                   ),
//                   icon: Icon(
//                     Icons.keyboard_arrow_down, // Your custom dropdown icon
//                     color: AppColors.searchfeild, // Adjust color as needed
//                     size: 27,
//                   ),
//                   decoration: InputDecoration(
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 13, horizontal: 12),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(
//                           color: AppColors.searchfeildcolor, width: 1),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(
//                           color: AppColors.searchfeildcolor, width: 1),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(
//                         color: const Color.fromARGB(255, 126, 16, 9),
//                         width: 1,
//                       ),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(
//                         color: const Color.fromARGB(255, 126, 16, 9),
//                         width: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: SizeConfig.heightMultiplier * 12,
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: AppMediumButton(
//                       label: "Previous",
//                       borderColor: AppColors.buttoncolor,
//                       iconColor: AppColors.buttoncolor,
//                       backgroundColor: Colors.white,
//                       textColor: AppColors.buttoncolor,
//                       imagePath: 'assets/icons/arrow-narrow-left.png',
//                     ),
//                   ),
//                   SizedBox(width: SizeConfig.widthMultiplier * 5),
//                   GestureDetector(
//                     onTap: () {
//                       Get.to(LabourDocumentation());
//                     },
//                     child: AppMediumButton(
//                       label: "Next",
//                       borderColor: AppColors.backbuttoncolor,
//                       iconColor: Colors.white,
//                       textColor: Colors.white,
//                       backgroundColor: AppColors.buttoncolor,
//                       imagePath2: 'assets/icons/arrow-narrow-right.png',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: SizeConfig.heightMultiplier * 3,
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
