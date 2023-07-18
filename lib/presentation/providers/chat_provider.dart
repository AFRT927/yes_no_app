import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';


// el change notifier puede notificar cuando hay cambios para redibujar los elementos
class ChatProvider extends ChangeNotifier {

List<Message>  message = [
  Message(text: 'Hola', fromWho: FromWho.me),
  Message(text: 'ya regresaste del trabajo?', fromWho: FromWho.me),

];


Future<void> sendMessage(String text) async {
  // to do: implementar metodo
}


}