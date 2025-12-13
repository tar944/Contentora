import 'package:contentora/data/models/destination.dart';
import 'package:contentora/utility/enums.dart';
import 'package:contentora/utility/globalDataModel.dart';
import 'package:contentora/value/dimens.dart';
import 'package:contentora/value/strings.dart';
import 'package:contentora/value/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class ArchiveWidget extends StatelessWidget {
  ArchiveWidget(
      {Key? key,
        required this.destination,
        required this.text,
        required this.archiveState,
        required this.onActionCaller})
      : super(key: key);

  ValueSetter<ArchiveState> onActionCaller;
  final Destination destination;
  final String text;
  final ArchiveState archiveState;

  @override
  Widget build(BuildContext context) {
    var gdm = context.watch<GlobalDataModel>();
    return IconButton(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.zero)
      ),
      onPressed: ()=>onActionCaller(archiveState==ArchiveState.archiveList?ArchiveState.mainList:ArchiveState.archiveList),
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: Dimens.actionBtnW,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: destination.color.shade300),
          ),
          child: Row(
            children: [
              if(archiveState == ArchiveState.archiveList)
                ...[
                  Icon(Icons.archive_outlined,color: destination.color.shade600,),
                  SizedBox(width: 5,),
                ],
              Text(text,style: TextSystem.textS(archiveState==ArchiveState.archiveList?destination.color.shade600:destination.color.shade400),),
              Spacer(),
              if(archiveState==ArchiveState.archiveList)
                ...[
                  Text(Strings.get(gdm.lang,'mainPage'),style: TextSystem.textS(destination.color.shade600),),
                  Icon(Icons.chevron_right_rounded,size: 25,color: destination.color.shade600,)
                ]
            ],
          )
        ),
      ),
    );
  }
}
