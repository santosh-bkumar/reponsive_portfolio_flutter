import 'package:ali_portfolio/constants/appcolors.dart';
import 'package:ali_portfolio/constants/strings.dart';
import 'package:ali_portfolio/responsive_arhitecture/enum/device_screen_type.dart';
import 'package:ali_portfolio/responsive_arhitecture/utils.dart';
import 'package:ali_portfolio/ui/screens/about_me.dart';
import 'package:ali_portfolio/ui/screens/contact_screen.dart';
import 'package:ali_portfolio/ui/screens/protfolio_screen.dart';
import 'package:ali_portfolio/ui/screens/resume_screen.dart';
import 'package:ali_portfolio/widgets/custom_tab.dart';
import 'package:flutter/material.dart';







class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController _pageController = new PageController();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  double pageIndex = 0.0;
  int currentPage =0;

  bool isHome = true;
  bool isPortfolio = false;
  bool isResume = false;
  bool isContact = false;

  final List<Widget> pages= [
    AboutMe(),
    Portfolio(),
    Resume(),
    Contact(),
  ];
jjbknkl
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var media= MediaQuery.of(context);
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          
          children: [
            Container(
              height: media.size.height * 0.6,
              padding: EdgeInsets.all(20),
              color: AppColors.blueish,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tabs',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  Divider(color: AppColors.darkerBlueish,),
                  TextButton.icon(onPressed: () {
                   gotoTab(context, 0);

                   setTab();

                  },
                      icon: Icon(Icons.home_filled),
                      label: Text(Strings.homeTab)),
                  TextButton.icon(onPressed: () {
                    gotoTab(context, 1);
                    setTab();
                  },
                      icon: Icon(Icons.stars),
                      label: Text(Strings.portfolioTab)),
                  TextButton.icon(onPressed: () {
                    gotoTab(context, 2);
                    setTab();
                  },
                      icon: Icon(Icons.person_outlined),
                      label: Text(Strings.resumeTab)),
                  TextButton.icon(onPressed: () {
                    gotoTab(context, 3);
                    setTab();
                  },
                      icon: Icon(Icons.phone),
                      label: Text(Strings.contactMeTab)),

                ],
              ),
            ),


            Container(
              decoration: BoxDecoration(
                color: AppColors.colorBlue,
               shape: BoxShape.circle
              ),
              child: IconButton(
                iconSize: 30,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close, color: AppColors.colorWhite,),
              ),
            ),


          ],
        ),
      ),
      key: _scaffoldKey,
      appBar: getDeviceScreenType(media)== DeviceScreenType.Mobile ? AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              decoration: BoxDecoration(
                color: AppColors.colorBlue,
                borderRadius: BorderRadius.circular(30)
              ),

              child: IconButton(
                icon: Icon(Icons.menu,color: Colors.white,),onPressed: (){
                  _scaffoldKey.currentState.openEndDrawer();
              },
              ),
            ),
          )
        ],
        title: Text('AliRazaAbro', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Signature'
        ),),
      ): AppBar(
        elevation: 0,
        title: Text('AliRazaAbro', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Signature'
        ),),

        actions: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                GestureDetector(
                  onTap: () {
                    setTab();
                    _pageController.animateToPage(
                        0, duration: Duration(seconds: 2),
                        curve: Curves.easeInOutExpo);
                  },

                  child: CustomTab(

                    tabName: Strings.homeTab, isActive: isHome,),
                ),
                GestureDetector(
                  onTap: () {
                    setTab();
                    _pageController.animateToPage(
                        1, duration: Duration(seconds: 2),
                        curve: Curves.easeInOutExpo);
                  },

                  child: CustomTab(

                    tabName: Strings.portfolioTab, isActive: isPortfolio,),
                ),
                GestureDetector(
                  onTap: () {
                    setTab();
                    _pageController.animateToPage(
                        2, duration: Duration(seconds: 2),
                        curve: Curves.easeInOutExpo);
                  },
                  child: CustomTab(
                    tabName: Strings.resumeTab, isActive: isResume,),
                ),
                GestureDetector(
                  onTap: () {
                    setTab();

                    _pageController.animateToPage(
                        3, duration: Duration(seconds: 2),
                        curve: Curves.easeInOutExpo);
                  },

                  child: CustomTab(

                    tabName: Strings.contactMeTab, isActive: isContact,),
                ),


                SizedBox(width: MediaQuery.of(context).size.width*0.2,),


                Padding(
                  padding: const EdgeInsets.only(right: 100,
                      top: 10.0, bottom: 10.0
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState.openEndDrawer();
                    },
                    child: Container(
                        width: 50,
                        alignment: Alignment.center,

                        decoration: BoxDecoration(
                            color: AppColors.colorBlue,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Icon(Icons.menu_outlined, color: Colors.white,)),
                  ),
                )
              ],
            ),
          ),




        ],
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        pageSnapping: false,
        scrollDirection: Axis.vertical,
        itemCount: pages.length,
        itemBuilder: (context,int index){
          return pages[index];
        },
      ),
    );
  }

  setTab() async{
    await Future.delayed(Duration(seconds: 3));

    if (_pageController.page ==1) {

      /// for portfolio page 1
       isHome = false;
        isPortfolio = true;
        isResume = false;
        isContact = false;
    }

    else if(_pageController.page ==0){

      /// for home page 0
      isHome = true;
      isPortfolio = false;
      isResume = false;
      isContact = false;
    }

    // else if (_pageController.page <=2.0) {
    //     isHome = false;
    //     isPortfolio = true;
    //     isResume = false;
    //     isContact = false;
    // }
    else if (_pageController.page == 2) {
        isHome = false;
        isPortfolio = false;
        isResume = true;
        isContact = false;
    }
     else if ( _pageController.page==3) {

        isHome = false;
        isPortfolio = false;
        isResume = false;
        isContact = true;
    }

    setState(() {

    });
  }

  gotoTab(BuildContext context, int page){
    _pageController.animateToPage(page, duration: Duration(seconds: 2), curve: Curves.linearToEaseOut);
    Navigator.pop(context);
  }
}
