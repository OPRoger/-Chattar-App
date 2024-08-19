import 'package:flutter/material.dart';

class NewContactTile extends StatelessWidget {

  final String BtName;
  final IconData icon;
  final VoidCallback onTap;

  const NewContactTile({Key? key, required this.BtName, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primaryContainer
        ),
          child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            child: Icon(icon,size: 30,),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(100)
            ),
        ),
        SizedBox(width: 20,),
        Text(BtName,style: Theme.of(context).textTheme.bodyLarge,)
        ],
      )),
    );
  }
}
