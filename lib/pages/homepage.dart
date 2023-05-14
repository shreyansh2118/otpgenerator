import 'package:flutter/material.dart';
import 'numberinputpage.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 180,
              ),
              Container(
                child: Image.asset(
                  "img/imglogo.png",
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  "Please select your Language",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: [
                    Text("You can change the language"),
                    Text("at any time"),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 230,
                height: 60,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "English",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 230,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Loginpage()));
                  },
                  child: Container(child: Text("NEXT")),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF035AA6),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 123.0),
                child: Container(
                  child: Image.asset(
                    "img/background.png",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
