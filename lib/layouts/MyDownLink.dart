import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mlm/api/getUser.dart';
import 'package:mlm/functions/UserData.dart';

const lightblue = Color(0xff47b5be);
const paleblue = Color(0xff57c2d7);
const  blue= Color(0xff007ba4);

class MyDownLink  extends StatefulWidget {

  @override
  _MyDownLink createState() => _MyDownLink();

}

class _MyDownLink extends State<MyDownLink> {

  String id="";
  String name="";

  bool response = false;
  bool udata = false;

  @override
  void initState() {
    _getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('My Downlink',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor:lightblue,
      ),
      body:SingleChildScrollView(
        child: TreeView(
          nodes: [
            TreeNode(
                content: Text('Netra',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
              children: [
                TreeNode(
                    content: Text(' Sushma',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                  children: [
                    TreeNode(
                      content: Text('Prema',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),

                    ),
                    TreeNode(
                      content: Text('Neha',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ),
                    TreeNode(
                      content: Text('Nayana',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ) ,
                    TreeNode(
                      content: Text('Nayana',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                TreeNode(
                  content: Text('Deepti',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                  children: [
                    TreeNode(
                      content: Text('Megha',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ),
                    TreeNode(
                      content: Text('Bhavana',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ),
                    TreeNode(
                      content: Text('Priya',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ),
                    TreeNode(
                      content: Text('Priya',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                TreeNode(
                  content: Text('leepika',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                  children: [
                    TreeNode(
                      content: Text('Apoorva',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ),
                    TreeNode(
                      content: Text('Suzan',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ),
                    TreeNode(
                      content: Text('suma',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ),
                    TreeNode(
                      content: Text('suma',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                TreeNode(
                  content: Text('aishwarya',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                  children: [
                    TreeNode(
                      content: Text('veena',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ),
                    TreeNode(
                      content: Text('Sushmita',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ),
                    TreeNode(
                      content: Text('aradhya',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ),
                    TreeNode(
                      content: Text('aradhya',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),


              ],
            ),
          ],
        ),
      ),
     /* GridView.builder(
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 8.0 / 10.0,
          crossAxisCount: 4,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.all(5),
              child: Card(
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              "Netra",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          )),
                    ],
                  )));
        },
      ),*/
       /* Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            color: Colors.white,
            elevation: 10,
            margin: EdgeInsets.only(left: 90.0, right: 90.0, bottom:30.0, top: 20.0),
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: Column(
                  children:  const [
                   Text("Emmanuel",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:lightblue),),
                    SizedBox(height: 5,),
                   Center(
                      child: FaIcon(FontAwesomeIcons.personArrowDownToLine,color:blue,size: 40,),
                  ),
                  ],
                ),
              ),
            ),
          ),
          // Banner(),
           /* GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 8.0 / 10.0,
                crossAxisCount: 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.all(5),
                    child: Card(
                        semanticContainer: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    "Netra",
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                )),
                          ],
                        )));
              },
            ),*/
          ],
        ),*/

    );
  }
  _getUserDetails(){
    checkData("USER").then((value) {
      getData("USER_DATA").then((value) {
        if (value != null) {
          var data = jsonDecode(value);
          setState(() {
            id = data['id'];
          });
        }
        getUser(id).then((value) {
          var response = value;
          if(response.statusCode == 200){
            setState(() {
              udata == true;
              var data = response.data['data'];
              name =data["name"];
              });
          }
        });
      });

    });

  }

}
class Banner extends StatelessWidget {
  const Banner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: Colors.white,
          elevation: 10,
         // margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom:10.0, top: 10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  const [
                Text("Netra",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:lightblue),),
                SizedBox(height: 5,),
                Center(
                  child: FaIcon(FontAwesomeIcons.personArrowDownToLine,color:blue,size: 40,),
                ),
              ],
            ),
          ),
        ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            color: Colors.white,
            elevation: 10,
            //margin: EdgeInsets.only(left: 90.0, right: 90.0, bottom:30.0, top: 20.0),
            child: Center(
              child: Column(
                children:  const [
                  Text("Mohammad",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:lightblue),),
                  SizedBox(height: 5,),
                  Center(
                    child: FaIcon(FontAwesomeIcons.personArrowDownToLine,color:blue,size: 40,),
                  ),
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            color: Colors.white,
            elevation: 10,
            //margin: EdgeInsets.only(left: 90.0, right: 90.0, bottom:30.0, top: 20.0),
            child: Center(
              child: Column(
                children:  const [
                  Text("Laxmi",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:lightblue),),
                  SizedBox(height: 5,),
                  Center(
                    child: FaIcon(FontAwesomeIcons.personArrowDownToLine,color:blue,size: 40,),
                  ),
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            color: Colors.white,
            elevation: 10,
            //margin: EdgeInsets.only(left: 90.0, right: 90.0, bottom:30.0, top: 20.0),
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: Column(
                  children:  const [
                    Text("Aktar",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:lightblue),),
                    SizedBox(height: 5,),
                    Center(
                      child: FaIcon(FontAwesomeIcons.personArrowDownToLine,color:blue,size: 40,),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}