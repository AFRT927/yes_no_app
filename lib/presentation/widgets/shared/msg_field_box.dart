import 'package:flutter/material.dart';

class MsgFieldBox extends StatelessWidget {
  const MsgFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final ColorScheme colors = Theme.of(context).colorScheme;

    final outLineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color:  Colors.transparent        
      ),
      borderRadius: BorderRadius.circular(40)
    );

    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: outLineInputBorder,
        focusedBorder: outLineInputBorder,
        filled: true,
        suffixIcon:  IconButton(
          onPressed: (){},
          icon: const Icon(Icons.send_outlined))
      ),
    );
  }
}