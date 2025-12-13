import 'package:contentora/data/models/destination.dart';
import 'package:contentora/utility/enums.dart';
import 'package:contentora/utility/globalDataModel.dart';
import 'package:contentora/value/strings.dart';
import 'package:pmvvm/pmvvm.dart';

class PlanningViewModel extends ViewModel {
  final Destination destination;
  int archivedNumber = 0;
  ArchiveState archiveState = ArchiveState.none;
  late GlobalDataModel gdm;

  PlanningViewModel(this.destination);

  @override
  void init() {
    gdm = context.watch<GlobalDataModel>();
    notifyListeners();
    refreshData();
  }

  void refreshData() async {
    // archivedNumber = (await ShopItemDAO().getItems(false)).length;
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

  void onPlaningActionHandler(String action) async{
    var acts = action.split('&&');
  }

  void onAddClickedHandler() async {
  }
}
