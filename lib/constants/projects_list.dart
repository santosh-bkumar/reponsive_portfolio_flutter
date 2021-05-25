import 'package:ali_portfolio/constants/strings.dart';
import 'package:ali_portfolio/model/project.dart';

class Projects{
  final List<Project> projects= [
    Project(projectName: 'Covid-19 Statistics Tracker App ',
    description: 'App that Track Statistics of Covid 19 WorldWide',
      imageUrl: Strings.iconC,
    ),


    Project(projectName: 'Bakery App ',
      description: 'Flutter Bakery App to purchase bakery items Online ',
        imageUrl: Strings.iconSoon,
    ),

    Project(projectName: 'Uber-Clone ',
      description: 'Taxi Booking App in FLutter',
      imageUrl: Strings.iconUber
    ),

    Project(projectName: 'Coming Soon',
        description: 'Stay tuned',
      imageUrl: Strings.iconSoon,
    ),


  ];
}
