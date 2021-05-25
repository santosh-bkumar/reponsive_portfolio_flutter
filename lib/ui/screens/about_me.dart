import 'package:ali_portfolio/constants/appcolors.dart';
import 'package:ali_portfolio/constants/strings.dart';
import 'package:ali_portfolio/responsive_arhitecture/base_widget.dart';
import 'package:ali_portfolio/responsive_arhitecture/enum/device_screen_type.dart';
import 'package:ali_portfolio/responsive_arhitecture/sizing_information.dart';
import 'package:ali_portfolio/responsive_arhitecture/utils.dart';
import 'package:ali_portfolio/widgets/copyright_widget.dart';
import 'package:ali_portfolio/widgets/page_indicator.dart';
import 'package:ali_portfolio/widgets/social_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return  getDeviceScreenType(media)== DeviceScreenType.Mobile? AboutMeMobile():AboutMeScreen();
  }
}



class AboutMeScreen extends StatefulWidget {
  @override
  _AboutMeScreenState createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {

  ScrollController _scrollController = new ScrollController();


  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context,sizing){
        return Scaffold(
          backgroundColor: AppColors.blueish,
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: sizing.screenSize.height * 0.9,
                    maxWidth: sizing.screenSize.width,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          left: sizing.screenSize.width* 0.15,
                          top: sizing.screenSize.height*0.5,
                          child: Container(
                            height: sizing.screenSize.height * 0.17,
                            width: sizing.screenSize.width *0.18,
                            decoration: BoxDecoration(
                                color: AppColors.colorWhite,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(Strings.photoUrl,
                                scale: 10,
                                ),
                                Text(
                                  'Flutter App Developer',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),

                      )),

                      Positioned(
                          right: sizing.screenSize.width *0.1,
                          top: sizing.screenSize.height* 0.1,
                          child: Container(
                            height: sizing.screenSize.height *0.2,
                            width: sizing.screenSize.width*0.17,
                            decoration: BoxDecoration(
                                color: AppColors.colorWhite,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                    'Software Engineering\n Student At',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                    'Muet SZAB',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700
                                  ),
                                ),


                              ],
                            ),

                          )),

                      Positioned(
                        left:sizing.screenSize.width *0.1,
                        top: sizing.screenSize.height*0.1,
                        child: Container(
                          height: sizing.screenSize.height *0.2,
                          width: sizing.screenSize.width *0.2,
                          decoration: BoxDecoration(
                              color: AppColors.colorWhite,
                              borderRadius: BorderRadius.circular(50)
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 2.0,left: 2.0),
                                  height: sizing.screenSize.height *0.1,
                                  width: sizing.screenSize.width * 0.05,
                                  child: Image.asset('assets/images/hand.png')),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Hi '),
                                  Text('I am Ali ',
                                  style: TextStyle(
                                    fontSize: sizing.screenSize.height*0.03,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5
                                  ),)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: sizing.screenSize.height *0.3,
                        left: sizing.screenSize.width*0.27,
                        child: Container(
                          height: sizing.screenSize.height *0.5,
                          width: sizing.screenSize.width*0.5,
                          decoration: BoxDecoration(
                           shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 50,
                                  spreadRadius: 0.2,
                                  offset: Offset(0,3),
                                  color: AppColors.colorBlue)
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.darkerBlueish,
                                AppColors.blueish
                              ]
                            )
                          ),
                        ),
                      ),
                      Positioned(
                        top: sizing.screenSize.height*0.2,
                        left: sizing.screenSize.width*0.27,
                        child: Container(
                          height: sizing.screenSize.height*0.7,
                          width: sizing.screenSize.width*0.5,
                          child: Image.asset('assets/images/profile.png',
                            scale: 10,
                            fit: BoxFit.fitHeight,
                          ),

                        ),
                      ),


                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: SocialBar(horizontal: true,)),
                   CopyRightTextWidget(),

                      Positioned(
                        bottom: sizing.screenSize.height *0.2,
                          right: 50,
                          child: showPageIndicator(4, 0,Axis.vertical)

                      )

                    ],
                  ),
                ),
              )



            ],
          ),
        );
      },
    );
  }
}




class AboutMeMobile extends StatefulWidget {
  @override
  _AboutMeMobileState createState() => _AboutMeMobileState();
}

class _AboutMeMobileState extends State<AboutMeMobile> {

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizing) {
        return Scaffold(
          backgroundColor: AppColors.blueish,
          body: CustomScrollView(
              controller: scrollController,
              slivers: [

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: sizing.screenSize.width/5,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.circular(50),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                                height: sizing.screenSize.height *0.1,
                                width: sizing.screenSize.width * 0.1,
                                child: Image.asset('assets/images/hand.png',
                                fit: BoxFit.fitWidth,
                                )),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Hi '),
                              Text('I am Ali ',
                                style: TextStyle(
                                    fontSize: sizing.screenSize.width*0.06,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5
                                ),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),


              _buildStack(sizing),


                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40,
                    right: 40
                    ),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: 50,
                              child: Image.network(Strings.photoUrl)),

                          
                          Text('Flutter App Developer',style: TextStyle(
                            fontWeight: FontWeight.w700
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40,
                        right: 40,top: 15
                    ),
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.colorWhite,
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: 50,
                              child: Text('Software Undergraduate\n Student At',
                              textAlign: TextAlign.center,
                              )),
                          
                          Text('Muet SZAB',style: TextStyle(
                              fontWeight: FontWeight.w700
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: SizedBox(height: 20,),
                ),

                SliverToBoxAdapter(
                  child: SocialBar(horizontal: true,),
                ),

                SliverToBoxAdapter(
                  child: showPageIndicator(4, 0, Axis.horizontal),
                ),



                SliverToBoxAdapter(
                 child: Container(
                   alignment: Alignment.center,
                   child: Text(
                     Strings.copyRightText,
                     textAlign: TextAlign.center,
                   ),
                 ),
                )
          ],
        ),);
      },
    );
  }

  _buildStack(SizingInformation sizing){
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: sizing.screenSize.height *0.5,
              width: sizing.screenSize.width,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.darkerBlueish,
                        AppColors.blueish
                      ]
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 50,
                        spreadRadius: 0.2,
                        offset: Offset(0,3),
                        color: AppColors.colorBlue)
                  ],


              )
            ),
          ),
          
          Positioned(
            // bottom: sizing.screenSize.height * 0.01,
            bottom: 0,
            left: sizing.screenSize.width * 0.02,
            child: Container(
              height: sizing.screenSize.height/2,
              width: sizing.screenSize.width /1,
              child: Image(image: AssetImage('assets/images/profile.png',
              ),
              fit: BoxFit.fitHeight,
                // height: sizing.screenSize.height/2,
                width: sizing.screenSize.width* 1,
              )
            ),
            ),
        ],
      ),
    );
  }
}
