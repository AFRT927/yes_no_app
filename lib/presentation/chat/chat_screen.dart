import 'package:flutter/material.dart';

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
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget> [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, i){
                  return Text('indice: $i');
                },
                )
              ),
            const Text('Mundo')
          ],
        ),
      ),
    );
  }
}
