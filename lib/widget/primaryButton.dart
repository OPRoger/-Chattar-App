import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  final String BtName;
  final IconData icon;
  final VoidCallback ontap;
  const PrimaryButton({Key? key, required this.BtName, required this.icon, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
    Container(
    padding:const  EdgeInsets.symmetric(horizontal: 20,vertical: 15),
    decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.primary,
    borderRadius: BorderRadius.circular(15)
    ),
    child: InkWell(
      onTap: ontap,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Icon(icon),
      const SizedBox(width: 10,),
      Text(BtName,style: Theme.of(context).textTheme.bodyLarge,)
      ],
      ),
    ),
    );
  }
}
