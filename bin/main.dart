import 'package:logging/logging.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

import 'dart:io' show Platform; // for env


void main() async {
  final token = Platform.environment['TOKEN']!;

  final username = (await Telegram(token).getMe()).username;

  var teledart = TeleDart(token, Event(username!));


  // registering events
  teledart.onMessage(keyword: "test")
    .listen((event) {event.reply("hello");});


  // Logging test
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message} // source: ${record.loggerName}');
  });

  final log = Logger("TestLogger");
  log.fine("test log");
  log.warning("test warning");

  // teledart.start();
}