import 'package:flutter/material.dart';
import 'package:appsguide/shared/responsive.dart';
import 'package:appsguide/utilerias/colors.dart';


//Boton personalizado
class ButtonWidget extends StatelessWidget {
  //const ButtonWidget({Key? key}) : super(key: key);

  final String? tittle;
  final bool? hasColor;
  final void Function()? onPressed;
  final Color? color;
  final double? height;
  final double? width;
  final double? fontSize;
  final bool? otherColor;
  final Color? colorButton;

  const ButtonWidget({
    Key? key,
    this.tittle,
    this.hasColor,
    this.onPressed,
    this.color,
    this.height = 60.0,
    this.width = -1.0,
    this.fontSize,
    this.otherColor = false,
    this.colorButton = GlobalColors.colorGrey,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {

    double fontSizeButton = 0;
    if(isTab(context) || isDesktop(context)){
      fontSizeButton = fontSize ?? 20;
    }else if(isMobile(context)){
      fontSizeButton = fontSize ?? 14;
    }

    return Material(
      borderRadius: BorderRadius.circular(4.0),
      child: Ink(
        decoration: BoxDecoration(
          color: hasColor! ? GlobalColors.colorWhite : otherColor! ? colorButton : GlobalColors.colorBlueRaf,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: onPressed,
          child: SizedBox(
            width: width! < 0 ? MediaQuery.of(context).size.width : width!,
            height: height,
            child: Center(
              child: Text(
                tittle!,
                style: TextStyle(
                    color: hasColor! ? GlobalColors.colorBlueRaf: GlobalColors.colorWhite,
                    fontWeight: FontWeight.w400,
                    fontSize: fontSizeButton
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}