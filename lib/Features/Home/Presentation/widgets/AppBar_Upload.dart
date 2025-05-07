import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Constants/Color_Manager.dart';
import '../../../../Constants/Text_Style_Manger.dart';

class AppBarUpload extends StatelessWidget implements PreferredSizeWidget {
  final bool isvisible;
  AppBarUpload({required this.isvisible});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.SecondaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        toolbarHeight: 130.h,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Campus Trade", style: TextStyles.White16Meduim),
            SizedBox(height: 5.h),
            Text("Tech Manager", style: TextStyles.white14Regular),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: CircleAvatar(
              radius: 23.r,
              backgroundColor: ColorManager.PrimaryColor,
              child: IconButton(
                icon: Badge.count(
                  count: 0,
                  textColor: ColorManager.PrimaryColor,
                  child: Icon(
                    Icons.notifications,
                    size: 30,
                    color: ColorManager.SecondaryColor,
                  ),
                  backgroundColor: ColorManager.SecondaryColor,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(130.h);
}
