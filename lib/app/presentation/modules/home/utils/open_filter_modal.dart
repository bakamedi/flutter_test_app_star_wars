import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../../core/responsive.dart';
import '../controller/home_provider.dart';
import 'filter_index.dart';

void openFilterModal(BuildContext context) async {
  final Responsive responsive = Responsive.of(context);

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Consumer(
        builder: (_, ref, __) {
          final homeController = ref.watch(homeProvider);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.male_outlined),
                selectedColor: Colors.blue,
                selectedTileColor: Colors.white,
                selected: homeController.maleFilterSelected,
                title: Text('Masculino'),
                onTap: () {
                  homeController.selectedFilter(
                    FilterOption.MALE,
                    true,
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.female_outlined),
                selectedColor: Colors.blue,
                selectedTileColor: Colors.white,
                selected: homeController.femaleFilterSelected,
                title: Text('Femenino'),
                onTap: () {
                  homeController.selectedFilter(
                    FilterOption.FEMALE,
                    true,
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.transgender_outlined),
                selectedColor: Colors.blue,
                selectedTileColor: Colors.white,
                selected: homeController.unknowmFilterSelected,
                title: Text('Sin Datos'),
                onTap: () {
                  homeController.selectedFilter(
                    FilterOption.UNKNOWM,
                    true,
                  );
                },
              ),
              SizedBox(
                height: responsive.hp(4),
              ),
            ],
          );
        },
      );
    },
  );
}
