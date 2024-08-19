import 'package:flutter/material.dart';

 class ContactSearchField extends StatelessWidget {
   const ContactSearchField({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Container(
         padding: EdgeInsets.all(5),
         decoration: BoxDecoration(
           color: Theme.of(context).colorScheme.primaryContainer,
           borderRadius: BorderRadius.circular(15),
         ),
         child: Row(
           children: [
             Expanded(child: TextField(
               textInputAction: TextInputAction.search,
               onSubmitted: (value)=> {print(value),},
               decoration: InputDecoration(
                   hintText: "search contacts",
                   prefixIcon: Icon(Icons.search)
               ),
             )),
           ],
         ));
   }
 }
