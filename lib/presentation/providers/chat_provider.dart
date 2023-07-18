import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';


// el change notifier puede notificar cuando hay cambios para redibujar los elementos
class ChatProvider extends ChangeNotifier {

final ScrollController chatScrollController = ScrollController();  
final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

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

  if(text.endsWith('?')) {
    await herReply();
  }
}

Future<void> moveScrollToBottom() async {

  await Future.delayed(const Duration(milliseconds: 100));

  chatScrollController.animateTo(
  chatScrollController.position.maxScrollExtent, 
  duration: Duration(milliseconds: 300),
   curve: Curves.easeOut
   );
}

Future<void> herReply() async {

  final herMsg = await getYesNoAnswer.getAnswer();
  messageList.add(herMsg);

    // notificar a quien este escuchando, que hubo un cambio en el provider
  notifyListeners();
  moveScrollToBottom();
}



}