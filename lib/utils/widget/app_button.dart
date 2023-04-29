
import 'package:flutter/material.dart';
import 'package:smart_ed/utils/widget/appcolor.dart';




class AppButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const AppButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 52,
      child: Container(
        decoration: const BoxDecoration(
           
            ),
        child: MaterialButton(
          elevation: 0.5,
          height: 52,
          minWidth: 10,
          color:AppColor.primary,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xffffffff),
              fontFamily: 'Mulish',
            ),
          ),
        ),
      ),
    );
  }
}


  

