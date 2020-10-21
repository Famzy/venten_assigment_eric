import 'package:flutter/material.dart';

Widget getCenteredViewMessage(BuildContext context, String message,
    {bool error = false}) {
  return Center(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                message,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              error
                  ? Icon(
                      // WWrap in gesture detector and call you refresh future here
                      Icons.refresh,
                      color: Colors.white,
                      size: 45.0,
                    )
                  : Container()
            ],
          )));
}

Widget noDataUi(
  BuildContext context,
) {
  return getCenteredViewMessage(context, "No data available yet");
}

Widget errorUi(
  BuildContext context,
) {
  return getCenteredViewMessage(
      context, "Error retrieving your data. Tap to try again",
      error: true);
}

Widget getLoadingUi({BuildContext context}) {
  return Center(
      child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
      Text('Fetching Filters ...')
    ],
  ));
}
