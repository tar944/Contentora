import 'package:contentora/data/models/destination.dart';
import 'package:contentora/value/dimens.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget(
      {Key? key,
        required this.destination,
        required this.hintText,
        required this.onTextChangedCaller})
      : super(key: key);

  ValueSetter<String> onTextChangedCaller;
  final Destination destination;
  final String hintText;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: Dimens.actionBtnW,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(Dimens.actionBtnH/2),
          border: Border.all(color: destination.color.shade300),
        ),
        child: TextField(
          onChanged:(e)=>onTextChangedCaller(e),
          style: TextStyle(color: destination.color.shade500),
          decoration: InputDecoration(
            icon: Icon(Icons.search,color: destination.color.shade300,),
            hintText: hintText,
            hintStyle: TextStyle(
                color: destination.color.shade200
            ),
            helperStyle: TextStyle(
                color: destination.color.shade500
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
