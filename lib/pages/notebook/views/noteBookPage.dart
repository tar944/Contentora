import 'package:contentora/data/models/destination.dart';
import 'package:contentora/pages/notebook/viewModels/noteBookViewModel.dart';
import 'package:contentora/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class NoteBookPage extends StatelessWidget {

  final Destination destination;
  late NoteBookViewModel vm;

  NoteBookPage( {super.key, required this.destination}) {
    vm = NoteBookViewModel(destination);
  }

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: () => const _View(),
      viewModel: vm,
    );
  }
}

class _View extends StatelessView<NoteBookViewModel> {
  const _View({Key? key}) : super(key: key);
  @override
  Widget render(context, NoteBookViewModel vm) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            title: Text(Strings.get(vm.gdm.lang,vm.destination.titleKey)),
            backgroundColor: vm.destination.color,
            foregroundColor: Colors.white,
        ),
        backgroundColor: vm.destination.color[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Note book part")
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: ()=>vm.onAddClickedHandler(),
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