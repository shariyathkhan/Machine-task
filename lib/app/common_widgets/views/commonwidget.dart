import 'package:flutter/material.dart';
import 'package:currencyapp/app/util/colors.dart';

class ReconnectingOverlay extends StatelessWidget {
  const ReconnectingOverlay({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ],
        ),
      );
}
