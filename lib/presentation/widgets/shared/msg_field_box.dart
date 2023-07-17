import 'package:flutter/material.dart';

class MsgFieldBox extends StatelessWidget {
  const MsgFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final outLineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color:  Colors.transparent        
      ),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
        enabledBorder: outLineInputBorder,
        focusedBorder: outLineInputBorder,
        filled: true,
        suffixIcon:  IconButton(
          onPressed: (){
            print('valor de la caja de texto');
          },
          icon: const Icon(Icons.send_outlined))
      );

    return TextFormField(
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('submit value $value');
      },
      onChanged: (value) {
        print(value);
      },
    );
  }
}