import 'package:dashboard/Constants/Color_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Constants/Text_Style_Manger.dart';

class ContainerState extends StatelessWidget {
  final Color? color;
  final Color? colorIcon;
  final String? contentContainer;
  final IconData? iconContainer;
  final String? titleContainer;
  ContainerState({
    required this.colorIcon,
    required this.color,
    required this.contentContainer,
    required this.iconContainer,
    required this.titleContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      width: 160.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(iconContainer, size: 30.h, color: colorIcon),

            Text(contentContainer!, style: TextStyles.grey14Medium),

            Text(titleContainer!, style: TextStyles.Black38Bold),

            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                color: ColorManager.greyColor,
                size: 24.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
