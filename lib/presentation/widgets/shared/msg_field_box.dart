import 'package:flutter/material.dart';

class MsgFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MsgFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();

    final FocusNode focusNode = FocusNode();

    final outLineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color:  Colors.transparent        
      ),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
        enabledBorder: outLineInputBorder,
        focusedBorder: outLineInputBorder,
        filled: true,
        suffixIcon:  IconButton(
          onPressed: (){
            final textValue = textController.value.text;            
            textController.clear();
            onValue(textValue);
          },
          icon: const Icon(Icons.send_outlined))
      );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {        
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}