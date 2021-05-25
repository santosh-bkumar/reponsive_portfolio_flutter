import 'package:ali_portfolio/util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/strings.dart';

class SocialBar extends StatelessWidget {

  final bool horizontal;

  const SocialBar({Key key, this.horizontal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: horizontal? Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () => Util.launchURL(Strings.facebookUrl),
            child: Container(
              child: FaIcon(FontAwesomeIcons.facebook),
            ),
          ),
          TextButton(
            onPressed: ()=> Util.launchURL(Strings.githubUrl),
            child: Container(
              child: FaIcon(FontAwesomeIcons.github),
            ),
          ),
          TextButton(
            onPressed: ()=> Util.launchURL(Strings.linkedUrl),
            child: Container(
              child: FaIcon(FontAwesomeIcons.linkedin),
            ),
          )


      ],): Column(
        children: [

          TextButton(
            onPressed: ()=> Util.launchURL(Strings.facebookUrl),
            child: Container(

              child: FaIcon(FontAwesomeIcons.facebook),
            ),
          ),

          TextButton(
            onPressed: ()=> Util.launchURL(Strings.githubUrl),
            child: Container(
              child: FaIcon(FontAwesomeIcons.github),
            ),
          ),

          TextButton(
            onPressed: ()=> Util.launchURL(Strings.linkedUrl),
            child: Container(
              child: FaIcon(FontAwesomeIcons.linkedin),
            ),
          )

        ],
      ),
    );
  }
}
