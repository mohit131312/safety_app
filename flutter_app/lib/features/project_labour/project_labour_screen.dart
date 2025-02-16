import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/labour_details/labour_details_screen.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

class ProjectLabourScreen extends StatelessWidget {
  ProjectLabourScreen({super.key});

  final List dataList = [
    {
      "Image": "assets/icons/profile_icon.png",
      "Title": "Sai Ram",
      "Subtitle": "Parc Residencies",
      "ContactNumber": "+91 84857 86598",
      "Icon": "assets/icons/Labours.png",
      "Gender": "Male",
      "Blood Group": "A+",
      "DOB": "12 Jan 1988",
      "Age": 36,
      "Address": "22, Hind Rajasthan Bldg, Dadasaheb Phalke Road, Dadar(e)",
    },
    {
      "Image": "assets/icons/profile_icon.png",
      "Title": "Sai Ram",
      "Subtitle": "Parc Residencies",
      "ContactNumber": "+91 84857 86598",
      "Icon": "assets/icons/Labours.png",
      "Gender": "Male",
      "Blood Group": "A+",
      "DOB": "12 Jan 1988",
      "Age": 36,
      "Address": "22, Hind Rajasthan Bldg, Dadasaheb Phalke Road, Dadar(e)",
    },
    {
      "Image": "assets/icons/profile_icon.png",
      "Title": "Sai Ram",
      "Subtitle": "Parc Residencies",
      "ContactNumber": "+91 84857 86598",
      "Icon": "assets/icons/Labours.png",
      "Gender": "Male",
      "Blood Group": "A+",
      "DOB": "12 Jan 1988",
      "Age": 36,
      "Address": "22, Hind Rajasthan Bldg, Dadasaheb Phalke Road, Dadar(e)",
    },
    {
      "Image": "assets/icons/profile_icon.png",
      "Title": "Sai Ram",
      "Subtitle": "Parc Residencies",
      "ContactNumber": "+91 84857 86598",
      "Icon": "assets/icons/Labours.png",
      "Gender": "Male",
      "Blood Group": "A+",
      "DOB": "12 Jan 1988",
      "Age": 36,
      "Address": "22, Hind Rajasthan Bldg, Dadasaheb Phalke Road, Dadar(e)",
    },
    {
      "Image": "assets/icons/profile_icon.png",
      "Title": "Sai Ram",
      "Subtitle": "Parc Residencies",
      "ContactNumber": "+91 84857 86598",
      "Icon": "assets/icons/Labours.png",
      "Gender": "Male",
      "Blood Group": "A+",
      "DOB": "12 Jan 1988",
      "Age": 36,
      "Address": "22, Hind Rajasthan Bldg, Dadasaheb Phalke Road, Dadar(e)",
    },
    {
      "Image": "assets/icons/profile_icon.png",
      "Title": "Sai Ram",
      "Subtitle": "Parc Residencies",
      "ContactNumber": "+91 84857 86598",
      "Icon": "assets/icons/Labours.png",
      "Gender": "Male",
      "Blood Group": "A+",
      "DOB": "12 Jan 1988",
      "Age": 36,
      "Address": "22, Hind Rajasthan Bldg, Dadasaheb Phalke Road, Dadar(e)",
    },
    {
      "Image": "assets/icons/profile_icon.png",
      "Title": "Sai Ram",
      "Subtitle": "Parc Residencies",
      "ContactNumber": "+91 84857 86598",
      "Icon": "assets/icons/Labours.png",
      "Gender": "Male",
      "Blood Group": "A+",
      "DOB": "12 Jan 1988",
      "Age": 36,
      "Address": "22, Hind Rajasthan Bldg, Dadasaheb Phalke Road, Dadar(e)",
    },
    {
      "Image": "assets/icons/profile_icon.png",
      "Title": "Sai Ram",
      "Subtitle": "Parc Residencies",
      "ContactNumber": "+91 84857 86598",
      "Icon": "assets/icons/Labours.png",
      "Gender": "Male",
      "Blood Group": "A+",
      "DOB": "12 Jan 1988",
      "Age": 36,
      "Address": "22, Hind Rajasthan Bldg, Dadasaheb Phalke Road, Dadar(e)",
    },
    {
      "Image": "assets/icons/profile_icon.png",
      "Title": "Sai Ram",
      "Subtitle": "Parc Residencies",
      "ContactNumber": "+91 84857 86598",
      "Icon": "assets/icons/Labours.png",
      "Gender": "Male",
      "Blood Group": "A+",
      "DOB": "12 Jan 1988",
      "Age": 36,
      "Address": "22, Hind Rajasthan Bldg, Dadasaheb Phalke Road, Dadar(e)",
    },
  ];

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
            scrolledUnderElevation: 0.0, // This will fix the problem

            elevation: 0,
            backgroundColor: AppColors.buttoncolor,
            centerTitle: true,
            toolbarHeight: SizeConfig.heightMultiplier * 10,
            title: Padding(
              padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
              child: AppTextWidget(
                text: AppTexts.projectlabour,
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
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.heightMultiplier * 2,
                  right: SizeConfig.widthMultiplier * 5,
                ),
                child: Image.asset(
                  "assets/icons/frame_icon.png",
                  height: SizeConfig.imageSizeMultiplier * 6,
                  width: SizeConfig.imageSizeMultiplier * 6,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4,
                vertical: SizeConfig.heightMultiplier * 2,
              ),
              child: SizedBox(
                height: SizeConfig.heightMultiplier * 6.5,
                child: TextField(
                  //controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search labour name',
                    hintStyle: TextStyle(
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryText,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.secondary,
                      size: 30,
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
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                var item = dataList[index];

                return GestureDetector(
                  onTap: () {
                    Get.to(LabourDetailsScreen());
                  },
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                          width: SizeConfig.imageSizeMultiplier * 11.11,
                          height: SizeConfig.imageSizeMultiplier * 11.11,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(item['Image'].toString()),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: AppTextWidget(
                          text: item['Title'],
                          fontSize: AppTextSize.textSizeSmall,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryText,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextWidget(
                              text: item['Subtitle'],
                              fontSize: AppTextSize.textSizeExtraSmall,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondaryText,
                            ),
                            AppTextWidget(
                              text: item['ContactNumber'].toString(),
                              fontSize: AppTextSize.textSizeExtraSmall,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondaryText,
                            ),
                          ],
                        ),
                        trailing: SizedBox(
                          width: SizeConfig.imageSizeMultiplier * 6.67,
                          height: SizeConfig.imageSizeMultiplier * 6.67,
                          child:
                              Image.asset("assets/icons/forwardarrowblack.png"),
                        ),
                      ),
                      Divider(
                        color: AppColors.textfeildcolor,
                        thickness: 1.5,
                        height: 2,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: SizeConfig.widthMultiplier * 50,
        height: SizeConfig.heightMultiplier * 6.5,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.buttoncolor,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 26,
                color: AppColors.primary,
              ),
              SizedBox(
                width: SizeConfig.widthMultiplier * 1,
              ),
              AppTextWidget(
                text: "Add Labour",
                fontSize: AppTextSize.textSizeMedium,
                fontWeight: FontWeight.w400,
                color: AppColors.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
