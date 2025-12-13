import 'package:contentora/data/models/destination.dart';
import 'package:contentora/pages/root/viewModel/rootViewModel.dart';
import 'package:contentora/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class RootPage extends StatelessWidget {

  RootPage( {super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: () => const _View(),
      viewModel: RootViewModel(),
    );
  }
}

class _View extends StatelessView<RootViewModel> {
  const _View({Key? key}) : super(key: key);
  @override
  Widget render(context, RootViewModel vm) {
    return WillPopScope(
      onWillPop: vm.onWillPop,
      child: Scaffold(
        body: IndexedStack(
          index: vm.selectedIndex,
          children: List.generate(
            vm.tabs.length,
                (index) => Navigator(
              key: vm.navigatorKeys[index],
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) => vm.tabs[index],
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: vm.selectedIndex,
          onDestinationSelected: (index)=>vm.onNavChangeHandler(index),
          destinations: vm.allDestinations.map<NavigationDestination>((Destination destination) {
            return NavigationDestination(
              icon: Icon(destination.icon, color: destination.color),
              selectedIcon: Icon(destination.selectedIcon,color: destination.color,),
              label: Strings.get(vm.gdm.lang,destination.titleKey),
            );
          }).toList(),
        ),
      ),
    );
  }
}