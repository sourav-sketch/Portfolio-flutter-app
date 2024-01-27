import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  // Function to create a project card
  Widget myPro(String lang, String title, String desc, String star, String githubUrl) {
    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: Color(0xff262628),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lang,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(height: 15),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 3),
              Text(
                desc,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.white70,
                    size: 18,
                  ),
                  SizedBox(width: 5),
                  Text(
                    star,
                    style: TextStyle(color: Colors.white70),
                  ),
                  Expanded(child: Container()),
                  // IconButton to launch GitHub repository
                  IconButton(
                    onPressed: () {
                      launch(githubUrl);
                    },
                    icon: Icon(FontAwesomeIcons.github, color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff252525),
        title: Text('Projects', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              // Example projects
              myPro(
                'Flutter',
                'Click on icon to code',
                'A Portfolio App with project insight and skill showcase',
                '10',
                'https://github.com/your-username/your-repository1',
              ),
              myPro(
                'Flutter',
                'Click on icon to code',
                'ToDo App - Flutter app for seamless task management',
                '10',
                'https://github.com/sourav-sketch/ToDoApp/tree/master',

              ),
              myPro(
                'Go lang',
                'Click on icon to code',
                'MySQL - CRUD  -  Bookstore Management API',
                '10',
                'https://github.com/sourav-sketch/MySQL-CRUD-Bookstore-Management-API',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
