import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_msg_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/msg_field_box.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://www.medespoir.fr/wp-content/uploads/2019/05/jennifer-aniston.jpg',
              ),
          ),
        ),
        title: const Center(child: Text('Reachel')),        
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {

    // esta linea se encarga de escuchar los cambios que sucedan en la instancia de "ChatProvider"
    final chatProvider = context.watch<ChatProvider>();

    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget> [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, i){
                  final message = chatProvider.messageList[i];
                  return message.fromWho == FromWho.hers ?
                   HerMsgBubble(message: message,) : MyMsgBubble(message: message);
                },
                )
              ),
              // caja de mensajes
            MsgFieldBox(onValue: (value) => chatProvider.sendMessage(text: value),),
          ],
        ),
      ),
    );
  }
}
