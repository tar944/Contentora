import 'package:contentora/data/models/bookDataModel.dart';
import 'package:contentora/data/models/destination.dart';
import 'package:contentora/utility/enums.dart';
import 'package:contentora/utility/globalDataModel.dart';
import 'package:contentora/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class BookViewModel extends ViewModel {
  final Destination destination;
  int archivedNumber = 0;
  ArchiveState archiveState = ArchiveState.none;
  BookDataModel? goalBook;
  final String pageTitle = 'Cellar';
  late GlobalDataModel gdm;

  BookViewModel(this.destination);

  @override
  void init() {
    gdm = context.watch<GlobalDataModel>();
    notifyListeners();
    refreshData();
  }

  void refreshData() async {
    // archivedNumber = (await ShopItemDAO().getItems(false)).length;
    // if(archiveState==ArchiveState.none&&archivedNumber!=0){
    //   archiveState = ArchiveState.mainList;
    // }else if(archiveState!=ArchiveState.none&&archivedNumber==0){
    //   archiveState = ArchiveState.none;
    // }
    // shopItems = await ShopItemDAO().getItems(archiveState!= ArchiveState.archiveList);
    // shopItems.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    // goalItem = null;
    notifyListeners();
  }

  String getArchiveText(){
    if(archiveState==ArchiveState.mainList){
      return Strings.t('archShopTitle',locale:gdm.lang,params: {'number':archivedNumber.toString()} );
    }else{
      return Strings.get(gdm.lang,'archivePage');
    }
  }

  void onArchiveHandler(ArchiveState archive){
    archiveState = archive;
    notifyListeners();
    refreshData();
  }

  void onBookActionHandler(String action) async{
    var acts = action.split('&&');
  }

  void onAddClickedHandler(BookDataModel? book) async {
    goalBook = book;
    notifyListeners();
  }
}
