import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMsgBubble extends StatelessWidget {

  final Message message;

  const HerMsgBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

   final ColorScheme colors = Theme.of(context).colorScheme;    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [        
        _textBubble(colors: colors, msg: message),
        const SizedBox(height: 5),        
        _ImageBubble(msg: message,),
        const SizedBox(height: 10,)
      ],
    );
  }
}

class _textBubble extends StatelessWidget {
  const _textBubble({
    super.key,
    required this.colors,
    required this.msg,
  });

  final ColorScheme colors;
  final Message msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
           vertical: 10
           ),
        child:  Text(
          msg.text,
          style: const TextStyle(
            color: Colors.white
          )
        ),
      ),
    );
  }
}





class _ImageBubble extends StatelessWidget {
  final Message msg;
  const _ImageBubble({super.key, required Message this.msg});
  
  @override
  Widget build(BuildContext context) {    
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        msg.imageUrl!,
        height: 150,
        width: size.width * 0.7,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: const Center(
              child:  Text('Reachel esta enviando una imagen')
              ),
          );
        },
      ),      
      );
  }
}