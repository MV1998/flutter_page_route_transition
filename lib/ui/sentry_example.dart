import 'package:flutter/material.dart';
import 'package:sentry/io_client.dart';

final SentryClient sentryClient = SentryClient(dsn: 'https://f180f5e29a8049de94a2817734f2891b@o406105.ingest.sentry.io/5272896');

class SentryExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          onPressed: () async {
            await throwDartException();
          },
          child: Text(
            'Access',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.deepPurple,
          splashColor: Colors.amber,
          shape: BeveledRectangleBorder(
              side: BorderSide(
                  color: Colors.black12, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10)),
        ),
      ],
    );
  }
}


Future throwDartException() async {
  try {
    throw new StateError('This is dart exception');
  } catch (error, stackTrack){
    print(error);
    sentryClient.captureException(exception: error,stackTrace: stackTrack);
  }
}