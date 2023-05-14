import 'package:flutter/material.dart';
class optionpage extends StatefulWidget {
  const optionpage({Key? key}) : super(key: key);

  @override
  State<optionpage> createState() => _optionpageState();
}

class _optionpageState extends State<optionpage> {
  String _selected = 'first';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
     ),
      body:
      Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60,),
              Container(
                child: Text(
                  "Please select your profile",
                  style:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 380,
                height: 90,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: ListTile(
                  leading: Radio<String>(
                    value: 'first',
                    groupValue: _selected,
                    onChanged: (value) {
                      setState(() {
                        _selected = value!;
                      });
                    },
                  ),
                  title: Row(
                    children: [
                      Container(
                        child: Image.asset(
                          "img/house.png",
                          width: 50,
                          height: 80,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              "Shipper",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text("Lorem ipsum dolor sit amet,",
                              style: TextStyle(fontSize: 14),),
                          ),
                          Container(
                            child: Text("Condectetur adipiscing",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60,),
              Container(
                width: 380,
                height: 90,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: ListTile(
                  leading: Radio<String>(
                    value: 'second',
                    groupValue: _selected,
                    onChanged: (value) {
                      setState(() {
                        _selected = value!;
                      });
                    },
                  ),
                  title: Row(
                    children: [
                      Container(
                        child: Image.asset(
                          "img/bus.png",
                          width: 50,
                          height: 80,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              "Shipper",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text("Lorem ipsum dolor sit amet,",
                              style: TextStyle(fontSize: 14),),
                          ),
                          Container(
                            child: Text("Condectetur adipiscing",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 390,
                height: 50,
                child: ElevatedButton(onPressed: (){}, child: Text("CONTINUE"),
                  style: ElevatedButton.styleFrom(
                  primary: Color(0xFF035AA6),

                ),),
              ),
            ],
          )),
    );
  }
}
