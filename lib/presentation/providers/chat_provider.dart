import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';


// el change notifier puede notificar cuando hay cambios para redibujar los elementos
class ChatProvider extends ChangeNotifier {


final ScrollController chatScrollController = ScrollController();  

List<Message>  messageList = [
  Message(text: 'Hola', fromWho: FromWho.me),
  Message(text: 'ya regresaste del trabajo?', fromWho: FromWho.me),

];

Future<void> sendMessage({required String text,  String imgUrl = ''}) async {
  
  if(text.isEmpty) return;

  final newMessage = Message(text: text, fromWho: FromWho.me, imageUrl: imgUrl);
  messageList.add(newMessage);
  
  // notificar a quien este escuchando, que hubo un cambio en el provider
  notifyListeners();
  moveScrollToBottom();
}

void moveScrollToBottom() {
  chatScrollController.animateTo(
  chatScrollController.position.maxScrollExtent, 
  duration: Duration(milliseconds: 300),
   curve: Curves.easeOut
   );
}



}