import 'package:flutter/material.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  mySpec(icon, tech) {
    return Container(
      width: 105,
      height: 115,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color(0xff252525),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                tech,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to launch social media profiles
  launchSocialMedia(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: PopupMenuButton(
          color: Colors.black,
          icon: Icon(Icons.menu, color: Colors.white),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: TextButton(
                child: Text(
                  'projects',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'projects');
                },
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: TextButton(
                child: Text(
                  'about',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'about');
                },
              ),
              value: 2,
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.38, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 35),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/images/main.jpg',
                    height: 400,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.49),
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      '',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        builder: (context, state) {
          double reducedIconSize =
              0.9 * DefaultTextStyle.of(context).style.fontSize!;

          return Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        launchSocialMedia('https://github.com/sourav-sketch');
                      },
                      icon: Icon(
                        FontAwesomeIcons.github,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(
                      width: 8,
                    ),
                    IconButton(
                      onPressed: () {
                        launchSocialMedia('https://twitter.com/surrro123');
                      },
                      icon: Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    IconButton(
                      onPressed: () {
                        launchSocialMedia('https://www.linkedin.com/in/sourav-singh-rajawat-b40484289/');
                      },
                      icon: Icon(
                        FontAwesomeIcons.linkedinIn,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    IconButton(
                      onPressed: () {
                        launchSocialMedia('https://www.facebook.com/souravsingh.rajawat.7');
                      },
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    IconButton(
                      onPressed: () {
                        launchSocialMedia('https://www.instagram.com/sourav757');
                      },
                      icon: Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Skills',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 15,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(Icons.flutter_dash, 'Flutter'),
                        mySpec(Icons.android, 'android'),
                        mySpec(Icons.app_registration, 'Dart'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                      width: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(Icons.apple, 'ios'),
                        mySpec(Icons.language, 'Go lang'),
                        mySpec(Icons.code, 'Git & Github'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                      width: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(Icons.api, 'REST API'),
                        mySpec(Icons.dataset_outlined, 'MySQL'),
                        mySpec(Icons.javascript, 'Java'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}