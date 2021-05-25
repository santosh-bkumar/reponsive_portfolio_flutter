import 'package:flutter/material.dart';

class CopyRightTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Positioned(
      bottom: 20,
      right: 20,
      child: Container(
        child: Text('CopyRight \n Ali Raza Abro\n © 2021 ',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
