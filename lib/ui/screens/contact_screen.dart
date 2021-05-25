import 'package:ali_portfolio/constants/appcolors.dart';
import 'package:ali_portfolio/constants/strings.dart';
import 'package:ali_portfolio/responsive_arhitecture/base_widget.dart';
import 'package:ali_portfolio/responsive_arhitecture/enum/device_screen_type.dart';
import 'package:ali_portfolio/responsive_arhitecture/utils.dart';
import 'package:ali_portfolio/widgets/copyright_widget.dart';
import 'package:ali_portfolio/widgets/page_indicator.dart';
import 'package:ali_portfolio/widgets/social_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final fireStore = FirebaseFirestore.instance;
final TextEditingController nameController =new TextEditingController();
final TextEditingController emailController =new TextEditingController();
final TextEditingController topicController =new TextEditingController();
final TextEditingController messageController =new TextEditingController();



class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return getDeviceScreenType(media) == DeviceScreenType.Mobile ?ContactScreenMobile():ContactScreen();
  }

}


Future<void> sendMessage(BuildContext context)async {
  bool validate= validateFields();

  print('Send Message Called');
  if(validate){
    try{


      await fireStore.collection('messages').doc().set({
        "name ": nameController.text.trim(),
        "email ": emailController.text.trim(),
        "topic ": topicController.text.trim(),
        "message ": messageController.text.trim(),
        "time":DateTime.now().millisecondsSinceEpoch.toString(),
      });

      print('Message Sent to Developer');
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: Text('Message Sent Succesffuly',style: TextStyle(
            color: Colors.white
        ),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: AppColors.colorBlue,
      ));


      nameController.clear();
      emailController.clear();
      messageController.clear();
      topicController.clear();


    }catch(e){

      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: Text('Message Sent Succesffuly',style: TextStyle(
            color: Colors.white
        ),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: AppColors.colorBlue,
      ));

    }

 // String id = (random.nextInt(100)+238) .toString(); // from 10 upto 99 included


  }else{
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      backgroundColor: Colors.red,
        content: Text("Inavlid Inputs, Try Again!",style: TextStyle(
          color: Colors.white
        ),)));
  }


}

bool validateFields(){
  if(nameController.text.trim().length <3 ||
  emailController.text.trim().length < 4 || topicController.text.trim().length < 3||
   messageController.text.trim().length< 5 || !emailController.text.trim().contains('@') ){
    return false;
  }else
    return true;
}





class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context,sizing){
        return Scaffold(
          backgroundColor: AppColors.blueish,
          body: Container(
           height: sizing.screenSize.height,
            width: sizing.screenSize.width,
            child: Stack(
              children: [
                Positioned(
                  right: sizing.screenSize.width/3,
                  top: 10,
                  child: Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'Take Coffee and Chat with Me',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                ),



                Positioned(
                top: sizing.screenSize.height * 0.2,
                 left: sizing.screenSize.width * 0.15 ,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: sizing.screenSize.height *0.15,
                      width: sizing.screenSize.width * 0.3,
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Icon(Icons.email,size: 20,color: Colors.red,),
                            Text('alirazaabro908@gmail.com')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: sizing.screenSize.height *0.2,
                  right: sizing.screenSize.width * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: sizing.screenSize.height *0.15,
                      width: sizing.screenSize.width * 0.3,
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.phone_android,size: 20,color: Colors.red,),
                            Text('+923433855008')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),




               //Name TextFeild

                ///EmailTextField

                Positioned(
                    bottom: 200,
                    child: Container(
                      width: sizing.screenSize.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                      Container(
                        width: 200,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Name'
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: 'Email'
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextField(
                          controller: topicController,
                          decoration: InputDecoration(
                              hintText: 'Topic'
                          ),
                        ),
                      ),
                  ],
                ),
                    )),

                ///Message Textfield

                Positioned(
                  right: sizing.screenSize.width/2.6,
                  bottom: 80,
                  child: Container(
                    width: 300,
                    child: TextField(
                      maxLines: 3,
                      controller: messageController,
                      decoration: InputDecoration(
                          hintText: 'Your Message'
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: sizing.screenSize.width/2.3,
                  child: Container(
                    height: 100,
                    width: 200,
                    child: TextButton(
                      child: Text('Send Message',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.colorBlue
                      ),
                      ),
                      onPressed: (){
                        sendMessage(context);

                      },
                    ),
                  ),
                ),

                SocialBar(horizontal: true,),

                CopyRightTextWidget(),

                Positioned(
                    bottom: sizing.screenSize.height * 0.2,
                    right: 50,
                    child: showPageIndicator(4, 3,Axis.vertical)

                )

              ],
            ),
          ),
        );
      },
    );
  }

}


class ContactScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BaseWidget(
      builder: (context,sizing){
        return Scaffold(
          backgroundColor: AppColors.blueish,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'Take Coffee and Chat with Me',
                      style: TextStyle(
                          fontSize: sizing.screenSize.width *0.047,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: sizing.screenSize.height*0.12,
                      width: sizing.screenSize.width * 0.8,
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            
                            Icon(Icons.email,size: 20,color: Colors.red,),
                            SelectableText('alirazaabro908@gmail.com')
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: sizing.screenSize.height*0.12,
                      width: sizing.screenSize.width * 0.8,
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [


                            Icon(Icons.phone_android,size: 20,color: Colors.red,),
                            SelectableText('+923433855008',textAlign: TextAlign.start,),
                            SizedBox(width: sizing.screenSize.width/12,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Name TextFeild

                  ///EmailTextField

                  Container(
                    width: sizing.screenSize.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: sizing.screenSize.width/2,
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                hintText: 'Name'
                            ),
                          ),
                        ),
                        Container(
                          width: sizing.screenSize.width/2,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText: 'Email'
                            ),
                          ),
                        ),
                        Container(
                          width: sizing.screenSize.width/2,
                          child: TextField(
                            controller: topicController,
                            decoration: InputDecoration(
                                hintText: 'Topic'
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///Message Textfield

                  Container(
                    width: sizing.screenSize.width/2,
                    child: TextField(
                      maxLines: 3,
                      controller: messageController,
                      decoration: InputDecoration(
                          hintText: 'Your Message'
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    child: TextButton(
                      child: Text('Send Message',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: AppColors.colorBlue
                        ),
                      ),
                      onPressed: (){
                        sendMessage(context);
                      },
                    ),
                  ),

                  Container(
                      alignment: Alignment.center,
                      child: SocialBar(horizontal: true,)),

                  showPageIndicator(4, 3,Axis.horizontal),
                  Container(
                    alignment: Alignment.center,
                    child: Text(Strings.copyRightText,
                    textAlign: TextAlign.center,
                    ),
                  ),



                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


