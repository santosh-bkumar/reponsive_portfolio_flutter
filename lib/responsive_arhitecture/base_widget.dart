import 'package:flutter/material.dart';
import 'sizing_information.dart';
import 'utils.dart';



class BaseWidget extends StatelessWidget {
  final Widget Function(BuildContext context,SizingInformation sizingInformation) builder;

  const BaseWidget({Key key, this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mediaQuery =MediaQuery.of(context);

    return LayoutBuilder(builder: (context,boxConstraints){
      var  sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceScreenType: getDeviceScreenType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(boxConstraints.maxHeight, boxConstraints.maxWidth)
      ) ;
      return builder(context,sizingInformation);
    });
  }
}
