import 'package:contentora/data/models/articleDataModel.dart';
import 'package:contentora/data/models/destination.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../../value/strings.dart';
import '../viewModels/articleViewModel.dart';

class ArticlePage extends StatelessWidget {

  final Destination destination;
  late ArticleViewModel vm;

  ArticlePage( {super.key, required this.destination}){
    vm=ArticleViewModel(destination);
  }

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: () => const _View(),
      viewModel: vm,
    );
  }
}

class _View extends StatelessView<ArticleViewModel> {
  const _View({Key? key}) : super(key: key);
  @override
  Widget render(context, ArticleViewModel vm) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text(Strings.get(vm.gdm.lang,vm.destination.titleKey)), backgroundColor: vm.destination.color, foregroundColor: Colors.white),
        backgroundColor: vm.destination.color[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Article page")
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed:()=> vm.onAddClickedHandler(null),
          label: Text(Strings.get(vm.gdm.lang, 'add')),   // RTL text works fine
          icon: const Icon(Icons.add),
          backgroundColor: vm.destination.color,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}