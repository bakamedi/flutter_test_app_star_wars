import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../../core/responsive.dart';
import '../controller/home_controller.dart';
import '../controller/home_provider.dart';
import '../view/widgets/apply_filter.dart';
import 'clear_filter.dart';
import 'verify_filter.dart';

void openFilterModal(BuildContext context) async {
  final Responsive responsive = Responsive.of(context);

  showModalBottomSheet(
    context: context,
    isDismissible: false,
    builder: (context) {
      return Consumer(
        builder: (_, ref, __) {
          final homeController = ref.watch(homeProvider);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: _listTitle(
              responsive,
              homeController,
            ),
          );
        },
      );
    },
  );
}

List<Widget> _listTitle(
  Responsive responsive,
  HomeController homeController,
) {
  List<Widget> list = [];
  for (int i = 0; i < homeController.filters.length; i++) {
    list.add(
      ListTile(
        leading: _icon(i),
        selectedColor: Colors.blue,
        selectedTileColor: Colors.white,
        selected: homeController.filters[i],
        title: _title(i),
        onTap: () => homeController.selectedFilter(
          i,
          homeController.filters[i],
        ),
      ),
    );
  }
  list.add(
    Padding(
      padding: EdgeInsets.only(
        top: responsive.hp(2),
        bottom: responsive.hp(4),
      ),
      child: Column(
        children: [
          SizedBox(
            width: responsive.wp(90),
            child: ElevatedButton(
              onPressed:
                  homeController.applyFilter ? () => applyFilter() : null,
              child: Text(
                'Aplicar filtro',
                style: TextStyle(
                  fontSize: responsive.dp(1.3),
                ),
              ),
            ),
          ),
          SizedBox(
            width: responsive.wp(90),
            child: OutlinedButton(
              onPressed: () => clearFilter(),
              child: Text(
                'Limpiar filtro',
                style: TextStyle(
                  fontSize: responsive.dp(1.3),
                  color: Colors.red,
                ),
              ),
            ),
          ),
          SizedBox(
            width: responsive.wp(90),
            child: OutlinedButton(
              onPressed: () => verifyFilter(),
              child: Text(
                'Cerrar',
                style: TextStyle(
                  fontSize: responsive.dp(1.3),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  return list;
}

Widget _icon(int index) {
  if (index == 0) {
    return const Icon(Icons.male_outlined);
  } else if (index == 1) {
    return const Icon(Icons.female_outlined);
  } else {
    return const Icon(Icons.transgender_outlined);
  }
}

Widget _title(int index) {
  if (index == 0) {
    return const Text('Masculino');
  } else if (index == 1) {
    return const Text('Femenino');
  } else {
    return const Text('Sin Datos');
  }
}
