import 'package:flutter/widgets.dart';

import 'enum/device_screen_type.dart';
DeviceScreenType getDeviceScreenType(MediaQueryData mediaQuery){
 var orientation = mediaQuery.orientation;



 /// Fixed Device width changes with orientation
  double deviceWidth =0;

  if(orientation == Orientation.landscape){
    deviceWidth = mediaQuery.size.height;
  }else{
    deviceWidth = mediaQuery.size.width;
  }

  if(deviceWidth > 950){
    return DeviceScreenType.Desktop;
  }
  if(deviceWidth >600){
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;

}