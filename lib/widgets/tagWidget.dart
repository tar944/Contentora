import 'package:contentora/value/dimens.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class TagWidget extends StatelessWidget {
  TagWidget(
      {Key? key,
        required this.text,
        required this.bodyColor,
        required this.borderColor,
        required this.textStyle,
        this.onActionCaller})
      : super(key: key);

  VoidCallback? onActionCaller;
  final String text;
  final Color bodyColor;
  final Color borderColor;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onActionCaller!=null?()=>onActionCaller!():null,
      child: Container(
        height: Dimens.tagHeight-5,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular((Dimens.tagHeight-5)/2)),
          color: bodyColor,
        ),
        child: Padding(
            padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 2),
            child: Text(text,style: textStyle,),
        ),
      ),
    );
  }
}
