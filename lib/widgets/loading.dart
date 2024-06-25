import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// https://dhgavali.medium.com/flutter-loading-animation-without-setstate-bfd79d13c111
// https://medium.com/@fahim.ahmed131014/migrating-from-willpopscope-to-popscope-in-flutter-ed792e6011ce
class Loadings {
//function starts here

  static Future<void> showLoading(BuildContext context, GlobalKey key) async {
//returning dialog which is void basically

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
//used to avoid closing of dialog by user click and back events
        return PopScope(
          canPop: false,
          child: SimpleDialog(
            key: key,
            backgroundColor: Colors.white,
            children: const <Widget>[
              Center(
                child: Column(children: [
                  SpinKitWaveSpinner(color: Colors.blueGrey),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "uploading..",
                  )
                ]),
              )
            ],
          ),
        );
      },
    );
  }
}
