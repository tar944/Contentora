import 'package:contentora/data/models/destination.dart';
import 'package:contentora/utility/enums.dart';
import 'package:contentora/utility/globalDataModel.dart';
import 'package:contentora/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class NoteBookViewModel extends ViewModel {
  final Destination destination;
  int archivedNumber = 0;
  ArchiveState archiveState = ArchiveState.none;
  late GlobalDataModel gdm;

  NoteBookViewModel(this.destination);

  @override
  void init() {
    gdm = context.watch<GlobalDataModel>();
    refreshData();
  }

  void refreshData() async {
    // archivedNumber = (await OrderDAO().getOrders(false)).length;
    notifyListeners();
  }


  String getArchiveText(){
    if(archiveState==ArchiveState.mainList){
      return Strings.t('archOrderTitle',locale:gdm.lang,params: {'number':archivedNumber.toString()} );
    }else{
      return Strings.get(gdm.lang,'archivePage');
    }
  }

  void onArchiveHandler(ArchiveState archive){
    archiveState = archive;
    notifyListeners();
    refreshData();
  }

  void onAddClickedHandler() async {
    // showModalBottomSheet(
    //   context: context,
    //   isScrollControlled: true,
    //   backgroundColor: destination.color.shade50,
    //   useSafeArea: false,
    //   showDragHandle: false,
    //   builder: (context) {
    //     return OrderBottomSheet(onDetailsChangeCaller: refreshData, order: order, destination: destination);
    //   },
    // );
  }

  void onNoteActionHandler(String action) async {
    var acts = action.split('&&');
  }
}
