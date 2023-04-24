import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../../../core/responsive.dart';
import '../../../../global/controllers/sensor_controller.dart';
import '../../utils/open_filter_modal.dart';

class TitleSensor extends StatelessWidget {
  const TitleSensor({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return ProviderListener<SensorController>(
      provider: sensorProvider,
      onInitState: (_, notifier) => notifier.initGyro(),
      builder: (_, __) {
        return Consumer(
          builder: (_, ref, __) {
            final sensorController = ref.watch(sensorProvider);
            final x = sensorController.x;
            final y = sensorController.y;

            return AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateX(x)
                  ..rotateY(y),
                alignment: Alignment.center,
                child: Container(
                  color: Colors.black,
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                    height: 45,
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.black,
                    size: responsive.dp(4),
                  ),
                  onPressed: () => openFilterModal(context),
                )
              ],
            );
          },
        );
      },
    );
  }
}
