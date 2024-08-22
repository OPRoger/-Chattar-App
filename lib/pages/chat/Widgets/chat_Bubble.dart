import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final String status;
  final String imageUrl;
  final bool isComing;

  const ChatBubble(
      {Key? key,
      required this.message,
      required this.time,
      required this.status,
      required this.imageUrl,
      required this.isComing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Column(
        crossAxisAlignment:
            isComing ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 1.4),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: isComing? BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(15)) :
                  BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(0))

              ),
              child: imageUrl == ""
                  ? Text(message)
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(imageUrl),
                        ),
                        SizedBox(height: 10,),
                        Text(message)
                      ],
                    )),
          const SizedBox(
            width: 10,height: 5,
          ),
          isComing
              ? Row(
                  children: [
                    Text(
                      time,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: isComing
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                  children: [
                    Text(time, style: Theme.of(context).textTheme.labelMedium),
                   const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                        child: Image.asset(
                      "assets/Icons/double_tick.png",
                      width: 18,
                      height: 20,
                    ))
                  ],
                )
        ],
      ),
    );
  }
}
