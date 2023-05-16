import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  Color color;
  Color iconecolor;
   ColorContainer({Key? key,
    required this.color,
    required this.iconecolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .04,
      width: size.width * .09,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
      child: Center(child: Icon(Icons.done_sharp,color: iconecolor)),
    );
  }
}
