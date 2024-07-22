import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget{
  String? text;
  dynamic? onPress;
  IconData? icon;

  CustomFlatButton({
    Key? key,
    this.text,
    this.icon,
    this.onPress
}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      onPress();
      },
        child:Row(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(this.text!),
          Icon(this.icon!),
        ],
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0)
      ),
    );
  }

}