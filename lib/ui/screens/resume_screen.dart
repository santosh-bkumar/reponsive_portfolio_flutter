import 'package:ali_portfolio/constants/appcolors.dart';
import 'package:ali_portfolio/responsive_arhitecture/enum/device_screen_type.dart';
import 'package:ali_portfolio/responsive_arhitecture/utils.dart';
import 'package:ali_portfolio/util.dart';
import 'package:ali_portfolio/widgets/page_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ali_portfolio/constants/strings.dart';
import 'package:ali_portfolio/widgets/social_bar.dart';


class Resume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return getDeviceScreenType(media) == DeviceScreenType.Mobile ? ResumeScreenMobile(): ResumeScreen();
  }
}


class ResumeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.blueish,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    AppColors.colorBlue.withOpacity(0.4),
                    AppColors.colorBlue,
                  ]
                )
              ),
              child: TextButton(
                onPressed: (){
                  Util.launchURL(Strings.resumeUrl);
                },
                child: Text(Strings.download,style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 3,
                    color: Colors.white
                ),),
              ),
            ),

           Container(
             padding: EdgeInsets.only(right: 50),
             alignment: Alignment.bottomRight,
             child:  showPageIndicator(4, 2,Axis.vertical),
           ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SocialBar(horizontal: true,),
            )

          ],
        ),
      ),
    );
  }
}

class ResumeScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueish,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      colors: [
                        AppColors.colorBlue.withOpacity(0.4),
                        AppColors.colorBlue,
                      ]
                  )
              ),
              child: TextButton(
                onPressed: (){

                  Util.launchURL(Strings.resumeUrl);
                },
                child: Text(Strings.download,style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 3,
                    color: Colors.white
                ),),
              ),
            ),

            SizedBox(height: 50,),
            Container(
              child: showPageIndicator(4, 2, Axis.horizontal)
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SocialBar(horizontal: true,),
            )
          ],
        ),
      ),
    );
  }
}
