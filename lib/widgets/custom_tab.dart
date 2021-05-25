import 'package:ali_portfolio/constants/appcolors.dart';
import 'package:ali_portfolio/constants/strings.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatefulWidget {
  final String tabName;
  final bool isActive;

   CustomTab({Key key,@required this.tabName,
     this.isActive,
   }) : super(key: key);

  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(height: 5,
              width: 10,
              color: widget.isActive ? AppColors.colorBlue: AppColors.blueish,
            ),
            Text(widget.tabName,style: TextStyle(
              color: widget.isActive ? AppColors.colorBlue:Colors.black,
              fontWeight: widget.isActive ? FontWeight.bold:FontWeight.normal,
            ),),
          ],
        ),
    );
  }
}
