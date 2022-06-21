import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';


Future<void> main() async {
  const String token = "";
  final username = (await Telegram(token).getMe()).username;

  var teledart = TeleDart(token, Event(username!));

  teledart.onMessage(keyword: "test")
    .listen((event) {event.reply("hello");});


  teledart.start();
}