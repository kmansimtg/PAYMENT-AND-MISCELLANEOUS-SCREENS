import 'package:flutter/material.dart';



class MyAp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat UI',
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Material(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
       
              child: ListView(
                padding: EdgeInsets.all(8.0),
                children: <Widget>[
                  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_new_outlined, size: 20)),
              SizedBox(
                width: 20,
              ),
              const Text(
                "Chat",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
                  ChatMessage(isSender: true),
                  ChatMessage(isSender: false),
                  ChatMessage(isSender: true),
                  // Add more messages as needed
                  SizedBox(height: 430),
                    _buildInputArea(),
                ],
              ),
            
          )
          
        ),
    );

  }

  Widget _buildInputArea() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.add,color:Color(0xffEEEEEE)),
            onPressed: () {},
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send,color: Color(0xffF19305),),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool isSender;

  ChatMessage({required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          isSender
              ? CircleAvatar(
                  backgroundImage: AssetImage('assets/sender.jpg'),
                )
              : CircleAvatar(
                  backgroundImage: AssetImage('assets/reciever.jpg'),
                ),
          Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: isSender ? Color(0xffFDF2E1) : Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getMessage(),
                  style: TextStyle(
                    color: isSender ? Colors.black : Colors.black,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  '12:34 PM', // Replace with actual message time
                  style: TextStyle(
                    color: isSender ? Colors.black45 : Colors.black45,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getMessage() {
    if (isSender) {
      if (_messages.isEmpty) {
        return 'Hi';
      } else {
        if (_messages.length % 2 == 0) {
          return 'Booked a Cab';
        } else {
          return 'When are you reaching?';
        }
      }
    } else {
      return 'Hi';
    }
  }
}

List<ChatMessage> _messages = [];

