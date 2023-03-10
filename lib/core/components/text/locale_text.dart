import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocaleText extends StatelessWidget {
  const LocaleText(this.txt, {Key? key, this.style, this.overflow, this.maxLines, this.textAlign}) : super(key: key);
  final String txt;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt.tr(),
      style: style,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      
    );
  }
}
