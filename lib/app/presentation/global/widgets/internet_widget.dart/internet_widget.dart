import 'package:flutter/material.dart';

import '../../../../core/responsive.dart';
import '../primary_button.dart';

class InternetWidget extends StatelessWidget {
  final void Function()? onPressed;
  const InternetWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Padding(
      padding: EdgeInsets.only(
        top: responsive.hp(10),
      ),
      child: Column(
        children: [
          Icon(
            Icons.signal_wifi_connected_no_internet_4_rounded,
            color: Colors.grey,
            size: responsive.dp(1.5),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: responsive.wp(5),
            ),
            child: Text(
              'No tiene internet',
              style: TextStyle(
                fontSize: responsive.dp(1.5),
                color: Colors.grey,
              ),
            ),
          ),
          PrimaryButton(
            text: 'Hola mundo',
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
