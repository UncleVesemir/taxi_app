import 'package:flutter/material.dart';
import 'package:taxi_app/src/presentation/utils/styles.dart';

class UtilsWidget {
  static void showInfoSnackBar(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: Text(
                error,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.errorValueBlack,
              ),
            ),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                onPressed: scaffold.hideCurrentSnackBar,
                child: const Text(
                  'Close',
                  style: AppTextStyles.errorValueOrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void navigateToScreen(BuildContext context, dynamic T) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => T));
  }
}
