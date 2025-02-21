import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/Labour_add/add_labour_controller.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/loader_screen.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

class MatchedUserpopup extends StatelessWidget {
  const MatchedUserpopup({super.key});

  @override
  Widget build(BuildContext context) {
    final addLabourController = Get.find<AddLabourController>();

    return AlertDialog(
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      content: Container(
        decoration: BoxDecoration(color: Colors.white),
        width: double.maxFinite,
        height: SizeConfig.heightMultiplier * 38,
        child: ListView.builder(
          itemCount: addLabourController.searchResults.length,
          itemBuilder: (context, index) {
            var labour = addLabourController.searchResults[index];
            return GestureDetector(
              onTap: () async {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => CustomLoadingPopup());
                await addLabourController
                    .getSafetyLabourDetails(labour['labour_name']);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                height: SizeConfig.heightMultiplier * 6,
                child: Column(
                  children: [
                    AppTextWidget(
                      text: labour['labour_name'] ?? "Unknown",
                      fontSize: AppTextSize.textSizeSmallm,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    Container(
                      height: 1,
                      color: AppColors.buttoncolor,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
