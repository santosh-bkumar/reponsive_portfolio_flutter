import 'dart:math';
import 'package:ali_portfolio/constants/appcolors.dart';
import 'package:ali_portfolio/constants/projects_list.dart';
import 'package:ali_portfolio/constants/strings.dart';
import 'package:ali_portfolio/responsive_arhitecture/base_widget.dart';
import 'package:ali_portfolio/responsive_arhitecture/enum/device_screen_type.dart';
import 'package:ali_portfolio/responsive_arhitecture/utils.dart';
import 'package:ali_portfolio/widgets/page_indicator.dart';
import 'package:ali_portfolio/widgets/social_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return getDeviceScreenType(media)== DeviceScreenType.Mobile? PortFolioMobile():PortFolioScreen();
  }
}


class PortFolioScreen extends StatelessWidget {

  final projectInstant = Projects();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BaseWidget(
      builder: (context,sizing){
        return Scaffold(
          backgroundColor: AppColors.blueish,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 40,
                  bottom: 40
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 70,
                          width: 70,
                          child: Image.asset('assets/images/student.png')),

                      Text(Strings.personelProjects,style: TextStyle(
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),),
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: sizing.screenSize.height * 0.4,
                    maxWidth: sizing.screenSize.width,
                  ),
                    child: PageViewWidget()
                ),

                Container(
                  child: showPageIndicator(projectInstant.projects.length, 1,Axis.horizontal),
                ),
                Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_ios,color: AppColors.colorBlue,),
                        Icon(Icons.arrow_forward_ios,color: AppColors.colorBlue,),
                      ],
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SocialBar(horizontal: true,),
                ),


                Container(
                padding: const EdgeInsets.only(bottom: 100,
                right: 50
                ),
                  alignment: Alignment.bottomRight,
                  child: showPageIndicator(4, 1,Axis.vertical)
                )
              ],

            ),
          ),

        );
      },
    );
  }



}



class PageViewWidgetMobile extends StatefulWidget {

  @override
  _PageViewWidgetMobileState createState() => _PageViewWidgetMobileState();
}

class _PageViewWidgetMobileState extends State<PageViewWidgetMobile> {
   final project= Projects();
   PageController pageController;

   double viewFraction=0.8;

   double pageOffset= 0.0;


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 1,
    viewportFraction: viewFraction
    )..addListener(() {
      setState(() {
        pageOffset= pageController.page;
      });

    });
  }


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return PageView.builder(
        itemCount: project.projects.length,
        controller: pageController,
        itemBuilder: (context,int index){
double scale = max(viewFraction, (1-(pageOffset - index).abs())+viewFraction);

// double angle = (pageOffset- index).abs();
//
// if(angle>0.5){
//   angle = 1- angle;
// }

          return Container(
        child: Material(
          elevation: 3,
          child: Stack(
            children: [
              Image(
                width: media.size.width,
                image: AssetImage(project.projects[index].imageUrl),
                  fit: BoxFit.cover,
                ),

              Positioned(
                bottom: 60,
                left: 20,
                child: AnimatedOpacity(
                  opacity: 1,
                  duration: Duration(
                    milliseconds: 200
                  ),
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)
                    ),
                    child: Text(project.projects[index].projectName,
                    style: TextStyle(
                      color: Colors.black
                    ),
                    ),
                  ),
                ),
              ),




            ],
          ),
        ),
        padding: EdgeInsets.only(right: 10,
        left: 20,
        top:  100 -scale * 25,
          bottom: 50,
         ),
      );
    });
  }
}




class PageViewWidget extends StatefulWidget {
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  final project= Projects();
  PageController pageController;
  double fraction = 0.8;
  double pageOffset=0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0,viewportFraction:fraction)..addListener(() {
      pageOffset = pageController.page;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media= MediaQuery.of(context);
    // TODO: implement build
    return PageView.builder(
      controller: pageController,
        pageSnapping: true,
        itemCount: project.projects.length,
        itemBuilder: (context,int index){
          double scale = max(fraction, (1-(pageOffset-index).abs())+fraction);


          return Container(
            margin: const EdgeInsets.only(right: 20),
            height: media.size.height ,
            width: media.size.width,
            decoration: BoxDecoration(
                color: AppColors.colorWhite,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Image.asset(project.projects[index].imageUrl,
                      fit: BoxFit.cover,
                      )
                      ),
                    ),
                  ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.colorWhite.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30)
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(Strings.projectName,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Signature'
                                ),
                                ),


                                Text(project.projects[index].projectName,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),

                                Text(Strings.projectDescription,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Signature'
                                  ),
                                ),
                                Text(project.projects[index].description)

                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),


              ],
            ),
          );
    });
  }
}




class PortFolioMobile extends StatelessWidget {
  final projectInstant = Projects();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context,sizing){
        return Scaffold(
          backgroundColor: AppColors.blueish,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 40,
                      bottom: 40
                  ),


                  child: Row(
                    children: [
                      Container(
                          height: 70,
                          width: 70,
                          child: Image.asset('assets/images/student.png')),
                      Text(Strings.personelProjects,style: TextStyle(
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                          fontSize: sizing.screenSize.width*0.05
                      ),),
                    ],
                  ),
                ),
                Container(
                    height: sizing.screenSize.height/2,
                    width: sizing.screenSize.width,
                    child: PageViewWidgetMobile()),

                Container(
                  color: AppColors.colorBlue,
                ),

                Container(
                  child: showPageIndicator(projectInstant.projects.length, 1,Axis.horizontal),
                ),
                Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_ios,color: AppColors.colorBlue,),
                        Icon(Icons.arrow_forward_ios,color: AppColors.colorBlue,),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SocialBar(horizontal: true,),
                )

              ],
            ),
          ),

        );
      },
    );}
}
