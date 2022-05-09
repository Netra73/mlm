import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/api/getUser.dart';
import 'package:mlm/functions/UserData.dart';
import 'package:mlm/layouts/AboutUs.dart';
import 'package:mlm/layouts/CustomerSupport.dart';
import 'package:mlm/layouts/Loginpage.dart';
import 'package:mlm/layouts/MoneyEarned.dart';
import 'package:mlm/layouts/MyAccount.dart';
import 'package:mlm/layouts/MyDownLink.dart';
import 'package:mlm/layouts/PrivacyAndPolicy.dart';
import 'package:mlm/layouts/ReferFriend.dart';
import 'package:mlm/layouts/Settings.dart';
import 'package:mlm/layouts/TermsAndConditions.dart';

const blue = Color(0xff47b5be);

class HomePage extends StatefulWidget {

  @override
  _HomePage createState() => _HomePage();

}
class _HomePage extends State<HomePage> {
  String id="";
  String name="";
  String email="";
  String reference_id="";
  bool login = false;

  @override
  void initState() {
  _getUserDetails();
    super.initState();
  }
  _logout() {
    removeData("USER").then((value) {
      removeData("USER_DATA").then((value) {
        setState(() {
          login = false;
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              LoginPage()), (Route<dynamic> route) => false);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            InkWell(
              child: UserAccountsDrawerHeader(
                accountName:  Text(name,style: TextStyle(color: Colors.white),) ,
                accountEmail: Text(email,style: TextStyle(color: Colors.white),),
                currentAccountPicture: GestureDetector(
                  onTap: () {
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: Icon(Icons.person,color: blue,),
                       ),
                ),
                decoration: BoxDecoration(
                    color:blue
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                   MaterialPageRoute(builder: (context) => MyAccount()));
              },
              child: ListTile(
                title: Text('MY ACCOUNT',style: TextStyle(color:blue,fontWeight: FontWeight.bold),),
               // leading: Icon(Icons.person),
              ),
            ),
            Divider(color: Colors.black,),
            InkWell(
              onTap: () {
                Navigator.push(context,
                   MaterialPageRoute(builder: (context) => TermsAndConditions()));
              },
              child: ListTile(
                title: Text('TERMS AND CONDITIONS',style: TextStyle(color:blue,fontWeight: FontWeight.bold),),
               // leading: Icon(Icons.warning),
              ),
            ),
            Divider(color: Colors.black,),

            InkWell(
              onTap: () {
                Navigator.push(context,
                   MaterialPageRoute(builder: (context) => PrivacyAndPolicy()));
              },
              child: ListTile(
                title: Text('PRIVACY AND POLICY',style: TextStyle(color:blue,fontWeight: FontWeight.bold),),
                //leading: Icon(Icons.privacy_tip),
              ),
            ),
            Divider(color: Colors.black,),
            InkWell(
              onTap: () {
                Navigator.push(context,
                   MaterialPageRoute(builder: (context) => CustomerSupport()));
              },
              child: ListTile(
                title: Text('CUSTOMER SUPPORT',style: TextStyle(color:blue,fontWeight: FontWeight.bold),),
               // leading: Icon(Icons.privacy_tip),
              ),
            ),
            Divider(color: Colors.black,),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));

              },
              child: ListTile(
                title: Text('ABOUT US',style: TextStyle(color:blue,fontWeight: FontWeight.bold),),
                //leading: Icon(Icons.workspaces_outline),
              ),
            ),
            Divider(color: Colors.black,),
            InkWell(
              onTap: () {
                _logout();
              },
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.exit_to_app),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title:
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: const [
                Text('A',style: TextStyle(fontSize: 30),),
                Text('I',style: TextStyle(fontSize: 30),),
                Text('M',style: TextStyle(fontSize: 30),),
                SizedBox(width: 10,),
                Text('2',style: TextStyle(fontSize: 30),),
                Text('.',style: TextStyle(fontSize: 30),),
                Text('1',style: TextStyle(fontSize: 30),),
                SizedBox(width: 20,),
              ],
            ),
            Row(
              children: const [
                Text('H',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
                Text('E',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
                Text('L',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
                Text('P',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
                SizedBox(width: 5,),
                Text('O',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
                Text('N',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
                Text('L',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
                Text('I',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
                Text('N',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
                Text('E',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
              ],
            )
          ],
        ),
        backgroundColor:blue,
      ),
      body: SingleChildScrollView(
        child:  Column(
          children: [
            Container(
              height: 50,
              width:400,
              color: blue,
              child: Center(
                  child: Text("REFERENCE ID : "+reference_id,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Container(
                height: 100,
                width: 230,
                child: Image(
                  image: AssetImage("assets/image/aimlogo.png") ,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0,left: 50.0,right: 2.0,bottom: 20.0),
              child: IconTheme(
                data: IconThemeData(size: 10, color: Colors.white),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing:6,
                  mainAxisSpacing: 6,
                  shrinkWrap: true,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyAccount()));
                      },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/myprofile.png"))
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MoneyEarned()));
                    },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/moneyearned.png"))
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ReferFriend()));
                      },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/refer.png"))
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyDownLink()));
                      },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/mydownlink.png"))
                    ),
                  ),
                ],
              ),
            ),
          ),
          ],
        ),
      ),
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
              var data = response.data['data'];
              name =data["name"];
              email =data["email"];
              reference_id =data["reference_id"];
            });
          }
        });
      });

    });

  }
}
class FeatureIconButton extends StatelessWidget {
  final Widget image;

  const FeatureIconButton({Key? key, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
          bottomLeft: Radius.circular(32.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
        ],
      ),
    );
  }
}
