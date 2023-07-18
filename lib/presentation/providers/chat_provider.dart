import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';


// el change notifier puede notificar cuando hay cambios para redibujar los elementos
class ChatProvider extends ChangeNotifier {

List<Message>  messageList = [
  Message(text: 'Hola', fromWho: FromWho.me),
  Message(text: 'ya regresaste del trabajo?', fromWho: FromWho.me),

];


Future<void> sendMessage({required String text,  String imgUrl = ''}) async {
  
  final newMessage = Message(text: text, fromWho: FromWho.me, imageUrl: imgUrl);
  messageList.add(newMessage);
  
  // notificar a quien este escuchando, que hubo un cambio en el provider
  notifyListeners();

}


}