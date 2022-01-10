// Flutter
import "package:flutter/material.dart";
import "package:flutter/services.dart";

// widgets
import "../widgets/min.dart";

// utils
import "../utils/localization.dart";

/// Fullscreen image shower.
class FullScreen extends StatefulWidget {
  /// Constructor
  const FullScreen({
    required this.image,
    this.imageURL,
    Key? key,
  }) : super(key: key);

  /// Image Widget
  final Image image;

  /// The url of the image. Optional.
  final String? imageURL;

  @override
  FullScreenState createState() => FullScreenState();
}

/// The stateful part of the widget.
class FullScreenState extends State<FullScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.light,
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FloatingActionButton(
                  /// have to define heroTag because this widget uses
                  /// two [FloatingActionButton]-s which are making an
                  /// error because of their same default values.
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
              widget.imageURL != null ? Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  /// have to define heroTag because this widget uses
                  /// two [FloatingActionButton]-s which are making an
                  /// error because of their same default values.
                  heroTag: null,
                  backgroundColor: Colors.black,
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: widget.imageURL));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        content: Text(AppLocalizations.of(context)
                            .translate("UrlCopied"),),
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
              ) : const Min(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        body: InteractiveViewer(
          minScale: 1,
          maxScale: 4,
          child: Align(
            child: widget.image,
          ),
        ),
      );
}
