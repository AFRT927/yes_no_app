import 'package:flutter/material.dart';

class HerMsgBubble extends StatelessWidget {
  const HerMsgBubble({super.key});

  @override
  Widget build(BuildContext context) {

   final ColorScheme colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [        
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
               vertical: 10
               ),
            child:  Text(
              'hola mundo',
              style: TextStyle(
                color: Colors.white
              )
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        // to do Imagen
        _ImageBubble(),
        SizedBox(height: 10,)

      ],
    );
  }
}


class _ImageBubble extends StatelessWidget {
  const _ImageBubble({super.key});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://yesno.wtf/assets/yes/13-c3082a998e7758be8e582276f35d1336.gif',
        height: 150,
        width: size.width * 0.7,
        fit: BoxFit.cover,
      ),      
      );
  }
}