import 'dart:convert';
import 'dart:developer' as dev;

import 'package:talker_flutter/talker_flutter.dart';

final talker = TalkerFlutter.init(
  settings: TalkerSettings(
    maxHistoryItems: 10000,
    timeFormat: TimeFormat.timeAndSeconds,
  ),
);

extension ExtendedObject on Object? {
  void log([String? logName]) => dev.log(toString(), name: logName ?? '');

  String get formatted {
    if (this is Map) {
      return (this as Map).prettyJson();
    }

    if (this is List<Map>) {
      return (this as List<Map>).prettyJson();
    }

    return toString();
  }

  void logInfo([Object? exception, StackTrace? stackTrace]) {
    talker.info(formatted, exception, stackTrace);
  }

  void logError([Object? exception, StackTrace? stackTrace]) {
    talker.error(formatted, exception, stackTrace);
  }

  void logDebug([Object? exception, StackTrace? stackTrace]) {
    talker.debug(formatted, exception, stackTrace);
  }
}

extension ExtendedListMapObject on List<Map>? {
  String prettyJson() {
    var spaces = ' ' * 4;
    var encoder = JsonEncoder.withIndent(spaces);

    return encoder.convert(this);
  }
}

extension ExtendedMapObject on Map? {
  String prettyJson() {
    var spaces = ' ' * 4;
    var encoder = JsonEncoder.withIndent(spaces);
    return encoder.convert(this);
  }
}
