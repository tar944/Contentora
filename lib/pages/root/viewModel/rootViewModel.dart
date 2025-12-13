import 'package:contentora/data/models/destination.dart';
import 'package:contentora/pages/articles/views/articlePage.dart';
import 'package:contentora/pages/book/views/bookPage.dart';
import 'package:contentora/pages/media/views/mediaPage.dart';
import 'package:contentora/pages/notebook/views/noteBookPage.dart';
import 'package:contentora/pages/planing/views/planningPage.dart';
import 'package:contentora/utility/globalDataModel.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class RootViewModel extends ViewModel {

  int selectedIndex = 4;

  late List<Destination> allDestinations;
  late List<Widget> tabs;
  late GlobalDataModel gdm;
  late ArticlePage article;
  late BookPage book;
  late MediaPage media;
  late NoteBookPage note;
  late PlanningPage planing;
  late List<GlobalKey<NavigatorState>> navigatorKeys;


  @override
  void init() {
    gdm = context.watch<GlobalDataModel>();
    navigatorKeys = List.generate(5, (_) => GlobalKey<NavigatorState>(),);

    allDestinations= <Destination>[
      Destination(0, 'article', Icons.article_outlined,Icons.article_rounded, Colors.blue),
      Destination(1, 'book', Icons.book_outlined,Icons.book, Colors.orange),
      Destination(2, 'media', Icons.video_collection_outlined,Icons.video_collection_rounded, Colors.purple),
      Destination(3, 'noteBook', Icons.note_alt_outlined,Icons.note_alt_rounded, Colors.cyan),
      Destination(4, 'planning', Icons.calendar_month_outlined,Icons.calendar_month_rounded, Colors.teal),
    ];

    article=ArticlePage(destination: allDestinations[0]);
    book= BookPage(destination: allDestinations[1]);
    media=MediaPage(destination: allDestinations[2]);
    note=NoteBookPage(destination: allDestinations[3]);
    planing=PlanningPage(destination: allDestinations[4]);

    tabs=[
      article,
      book,
      media,
      note,
      planing,
    ];
  }

  void onNavChangeHandler(int index){
    selectedIndex = index;
    switch(index){
      case 0:
        article.vm.refreshData();
        break;
      case 1:
        book.vm.refreshData();
        break;
      case 2:
        media.vm.refreshData();
        break;
      case 3:
        note.vm.refreshData();
        break;
      case 4:
        planing.vm.refreshData();
        break;
    }
    notifyListeners();
  }

  Future<bool> onWillPop() async {
    final NavigatorState currentTabNavigator =
    navigatorKeys[selectedIndex].currentState!;
    if (currentTabNavigator.canPop()) {
      currentTabNavigator.pop();
      return false;
    }
    return true; // allow system back to exit app
  }

}
