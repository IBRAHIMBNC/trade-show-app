import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_snap/app/constants/colors.dart';
import 'package:supplier_snap/app/constants/padding_constants.dart';
import 'package:supplier_snap/app/core/extensions/double.dart';
import 'package:supplier_snap/app/widgets/custom_text/custom_text.dart';
import 'package:supplier_snap/app/widgets/my_container.dart';
import 'package:supplier_snap/app/widgets/rounded_button/my_rounded_button.dart';

class DeleteAccountSuccess extends StatelessWidget {
  const DeleteAccountSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      width: double.infinity,
      height: double.infinity,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xffCCFF02), Color(0xffA8FF57)],
      ),
      child: Center(
        child: MyContainer(
          width: 335.w,
          height: 509.h,
          radius: 16.r,
          padding: kPadding24.hp,
          color: KColors.black10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(radius: 60.r, backgroundColor: KColors.white),
              32.verticalSpace,
              CustomText.label24b800(
                'Your Account has been deleted successfully.',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
                color: KColors.white,
              ),
              12.verticalSpace,
              CustomText.label14b400(
                'Your data is gone. Sad to see you leave. Create a new account if you ever return. Thanks for being with us!',
                textAlign: TextAlign.center,
                color: KColors.white,
                fontWeight: FontWeight.w300,
              ),
              24.verticalSpace,
              RoundedButton(
                'Return to Login',
                onTap: () {},
                backgroundColor: KColors.white20,
                fontColor: KColors.white,
              ),
              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
