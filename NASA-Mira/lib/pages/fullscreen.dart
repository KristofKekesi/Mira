// Flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// utils
import '../utils/localization.dart';

class FullScreen extends StatefulWidget {
  final String imageURL;

  const FullScreen({Key? key, required this.imageURL}) : super(key: key);

  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.dark));
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.black, statusBarBrightness: Brightness.light));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: FloatingActionButton(
                /// have to have this because this widget uses two [FloatingActionButton]-s
                heroTag: null,
                backgroundColor: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
                tooltip: AppLocalizations.of(context).translate("back"),
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: MediaQuery.of(context).size.width * .075,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                /// have to have this because this widget uses two [FloatingActionButton]-s
                heroTag: null,
                backgroundColor: Colors.black,
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: widget.imageURL));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      content: Text(AppLocalizations.of(context).translate("UrlCopied")),
                      action: SnackBarAction(
                        label: AppLocalizations.of(context).translate("ok"),
                        onPressed: () {},
                      ),
                    ),
                  );
                },
                tooltip: AppLocalizations.of(context).translate("copyURL"),
                child: Icon(
                  Icons.link,
                  size: MediaQuery.of(context).size.width * .075,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: InteractiveViewer(
          panEnabled: true,
          minScale: 1,
          maxScale: 4,
          child: Align(
            alignment: Alignment.center,
            child: Image.network(
            widget.imageURL,
        ),),
      ),
    );
  }
}
