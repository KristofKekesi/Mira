// Flutter
import "package:flutter/material.dart";

// utils
import "../utils/localization.dart";

/// The [notifierIsReverse] is a [ValueNotifier] used in
/// the selector dialog as well as in the collections to
/// specify if the collection items are reversed or not.
ValueNotifier<bool> notifierIsReverse = ValueNotifier<bool>(false);

/// The [notifierAreHelicoptersVisible] is a [ValueNotifier] used in
/// the selector dialog as well as passed into a collection to
/// specify if the collection items should be visible or not.
ValueNotifier<bool> notifierAreHelicoptersVisible = ValueNotifier<bool>(true);

/// The [notifierAreRoversVisible] is a [ValueNotifier] used in
/// the selector dialog as well as passed into a collection to
/// specify if the collection items should be visible or not.
ValueNotifier<bool> notifierAreRoversVisible = ValueNotifier<bool>(true);

/// The [notifierAreOrbitersVisible] is a [ValueNotifier] used in
/// the selector dialog as well as passed into a collection to
/// specify if the collection items should be visible or not.
ValueNotifier<bool> notifierAreOrbitersVisible = ValueNotifier<bool>(true);

/// The [notifierAreLandersVisible] is a [ValueNotifier] used in
/// the selector dialog as well as passed into a collection to
/// specify if the collection items should be visible or not.
ValueNotifier<bool> notifierAreLandersVisible = ValueNotifier<bool>(true);

/// The [notifierAreFlybysVisible] is a [ValueNotifier] used in
/// the selector dialog as well as passed into a collection to
/// specify if the collection items should be visible or not.
ValueNotifier<bool> notifierAreFlybysVisible = ValueNotifier<bool>(true);

/// Visualises and makes editable the public
/// variables used to control collections.
void showSelectors(
  /// [BuildContext] of the caller.
  BuildContext context, {

  /// A [bool] value, which is representing the
  /// isEnabled parameters of the [InputChip]s.
  bool areTypesDisabled = false,
}) {
  showDialog(
    context: context,
    builder: (_) => StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) => AlertDialog(
        contentPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * .025,
        ),
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * .025,
                right: MediaQuery.of(context).size.height * .025,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .025,
                    ),
                    child: Text(
                      AppLocalizations.of(context)
                          .translate("selectorsandsort"),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .025,
                      bottom: MediaQuery.of(context).size.height * .01,
                    ),
                    child: Text(
                      AppLocalizations.of(context).translate("types"),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .05,
                      ),
                    ),
                  ),
                  Wrap(
                    spacing: 16,
                    children: <Widget>[
                      InputChip(
                        tooltip: AppLocalizations.of(context)
                            .translate("helicopters"),
                        label: Text(
                          AppLocalizations.of(context).translate("helicopters"),
                          style: TextStyle(
                            color: notifierAreHelicoptersVisible.value &&
                                    !areTypesDisabled
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        showCheckmark: false,
                        backgroundColor: const Color.fromRGBO(232, 103, 45, .3),
                        selectedColor: const Color.fromRGBO(232, 103, 45, .75),
                        disabledColor: const Color(0xffcccccc),
                        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
                        selectedShadowColor: const Color.fromRGBO(0, 0, 0, 0),
                        isEnabled: !areTypesDisabled,
                        selected: areTypesDisabled ||
                            notifierAreHelicoptersVisible.value,
                        onSelected: (bool value) {
                          setState(() {
                            notifierAreHelicoptersVisible.value = value;
                          });
                        },
                      ),
                      InputChip(
                        tooltip:
                            AppLocalizations.of(context).translate("rovers"),
                        label: Text(
                          AppLocalizations.of(context).translate("rovers"),
                          style: TextStyle(
                            color: notifierAreRoversVisible.value &&
                                    !areTypesDisabled
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        showCheckmark: false,
                        backgroundColor: const Color.fromRGBO(232, 103, 45, .3),
                        selectedColor: const Color.fromRGBO(232, 103, 45, .75),
                        disabledColor: const Color(0xffcccccc),
                        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
                        selectedShadowColor: const Color.fromRGBO(0, 0, 0, 0),
                        isEnabled: !areTypesDisabled,
                        selected:
                            areTypesDisabled || notifierAreRoversVisible.value,
                        onSelected: (bool value) {
                          setState(() {
                            notifierAreRoversVisible.value = value;
                          });
                        },
                      ),
                      InputChip(
                        tooltip:
                            AppLocalizations.of(context).translate("orbiters"),
                        label: Text(
                          AppLocalizations.of(context).translate("orbiters"),
                          style: TextStyle(
                            color: notifierAreOrbitersVisible.value &&
                                    !areTypesDisabled
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        showCheckmark: false,
                        backgroundColor: const Color.fromRGBO(232, 103, 45, .3),
                        selectedColor: const Color.fromRGBO(232, 103, 45, .75),
                        disabledColor: const Color(0xffcccccc),
                        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
                        selectedShadowColor: const Color.fromRGBO(0, 0, 0, 0),
                        isEnabled: !areTypesDisabled,
                        selected: areTypesDisabled ||
                            notifierAreOrbitersVisible.value,
                        onSelected: (bool value) {
                          setState(() {
                            notifierAreOrbitersVisible.value = value;
                          });
                        },
                      ),
                      InputChip(
                        tooltip:
                            AppLocalizations.of(context).translate("landers"),
                        label: Text(
                          AppLocalizations.of(context).translate("landers"),
                          style: TextStyle(
                            color: notifierAreLandersVisible.value &&
                                    !areTypesDisabled
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        showCheckmark: false,
                        backgroundColor: const Color.fromRGBO(232, 103, 45, .3),
                        selectedColor: const Color.fromRGBO(232, 103, 45, .75),
                        disabledColor: const Color(0xffcccccc),
                        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
                        selectedShadowColor: const Color.fromRGBO(0, 0, 0, 0),
                        isEnabled: !areTypesDisabled,
                        selected:
                            areTypesDisabled || notifierAreLandersVisible.value,
                        onSelected: (bool value) {
                          setState(() {
                            notifierAreLandersVisible.value = value;
                          });
                        },
                      ),
                      InputChip(
                        tooltip:
                            AppLocalizations.of(context).translate("flybys"),
                        label: Text(
                          AppLocalizations.of(context).translate("flybys"),
                          style: TextStyle(
                            color: notifierAreFlybysVisible.value &&
                                    !areTypesDisabled
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        showCheckmark: false,
                        backgroundColor: const Color.fromRGBO(232, 103, 45, .3),
                        selectedColor: const Color.fromRGBO(232, 103, 45, .75),
                        disabledColor: const Color(0xffcccccc),
                        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
                        selectedShadowColor: const Color.fromRGBO(0, 0, 0, 0),
                        isEnabled: !areTypesDisabled,
                        selected:
                            areTypesDisabled || notifierAreFlybysVisible.value,
                        onSelected: (bool value) {
                          setState(() {
                            notifierAreFlybysVisible.value = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .025,
                      bottom: MediaQuery.of(context).size.height * .01,
                    ),
                    child: Text(
                      AppLocalizations.of(context).translate("sort"),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .05,
                      ),
                    ),
                  ),
                  Wrap(
                    spacing: 16,
                    children: <Widget>[
                      InputChip(
                        tooltip:
                            AppLocalizations.of(context).translate("ascending"),
                        label: Text(
                          AppLocalizations.of(context).translate("ascending"),
                          style: TextStyle(
                            color: notifierIsReverse.value
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        showCheckmark: false,
                        backgroundColor: const Color.fromRGBO(232, 103, 45, .3),
                        selectedColor: const Color.fromRGBO(232, 103, 45, .75),
                        disabledColor: const Color(0xffcccccc),
                        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
                        selectedShadowColor: const Color.fromRGBO(0, 0, 0, 0),
                        selected: notifierIsReverse.value,
                        onSelected: (bool value) {
                          setState(() {
                            notifierIsReverse.value = true;
                          });
                        },
                      ),
                      InputChip(
                        tooltip: AppLocalizations.of(context)
                            .translate("descending"),
                        label: Text(
                          AppLocalizations.of(context).translate("descending"),
                          style: TextStyle(
                            color: !notifierIsReverse.value
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        showCheckmark: false,
                        backgroundColor: const Color.fromRGBO(232, 103, 45, .3),
                        selectedColor: const Color.fromRGBO(232, 103, 45, .75),
                        disabledColor: const Color(0xffcccccc),
                        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
                        selectedShadowColor: const Color.fromRGBO(0, 0, 0, 0),
                        selected: !notifierIsReverse.value,
                        onSelected: (bool value) {
                          setState(() {
                            notifierIsReverse.value = false;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        actionsPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * .025,
          right: MediaQuery.of(context).size.height * .025,
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.height * .025,
              ),
              child: Text(
                AppLocalizations.of(context).translate("ok"),
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * .05,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
