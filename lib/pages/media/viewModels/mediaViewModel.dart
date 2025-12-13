import 'package:contentora/data/models/destination.dart';
import 'package:contentora/data/models/mediaDataModel.dart';
import 'package:contentora/utility/enums.dart';
import 'package:contentora/utility/globalDataModel.dart';
import 'package:contentora/value/strings.dart';
import 'package:pmvvm/pmvvm.dart';

class MediaViewModel extends ViewModel{
  final Destination destination;
  final String pageTitle = 'Store';
  late GlobalDataModel gdm;
  int archivedNumber = 0;
  ArchiveState archiveState = ArchiveState.none;
  MediaDataModel? goalMedia;
  List<MediaDataModel> allMaterials=[];

  MediaViewModel(this.destination);

  @override
  void init() async{
    gdm=context.read<GlobalDataModel>();
    refreshData();
  }

  void refreshData()async{
    // archivedNumber = (await MaterialDAO().getMaterials(false)).length;
    notifyListeners();
  }

  String getArchiveText(){
    if(archiveState==ArchiveState.mainList){
      return Strings.t('archStoreTitle',locale:gdm.lang,params: {'number':archivedNumber.toString()} );
    }else{
      return Strings.get(gdm.lang,'archivePage');
    }
  }

  void onArchiveHandler(ArchiveState archive){
    archiveState = archive;
    notifyListeners();
    refreshData();
  }


  void onMediaActionHandler(String action)async{
    var acts = action.split('&&');
    var item = allMaterials.firstWhere((e)=> e.id==int.parse(acts[1]));
  }

  void onAddClickedHandler(MediaDataModel? media){
    goalMedia=media;
    notifyListeners();
  }
}