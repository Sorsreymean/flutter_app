import 'package:flutter/material.dart';
import 'package:session_storage/home_page.dart';
import 'package:session_storage/register_page.dart';
import 'package:session_storage/login_page.dart';
import 'package:session_storage/session_storage.dart';
class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
     var nameCtrl = TextEditingController();
    var PasswordCtrl = TextEditingController();
    var Retype= TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child:Padding(
              padding: EdgeInsets.all(15), //
              child:Text(
              'SIGN UP',
               textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40,color: Colors.blue)),
            )
          ),
          Container(
            // height: 50,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child:TextField(
              controller: nameCtrl,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Input your username',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,color: Colors.blue
                )
              ),
              // onPressed: (){},
              // child: const Text('Login'),
            ),
          ),
          Container(
            // height: 50,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextField(
              obscureText: true,
              controller: PasswordCtrl,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Input your Password',
                hintStyle: TextStyle(
                  fontStyle: FontStyle.italic,color: Colors.blue
                )
              ),
              // onPressed: (){},
              // child: const Text('Login'),
            ),
          ),
          Container(
            // height: 50,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextField(
              obscureText: true,
              controller: Retype,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirm',
                hintText: 'Retype Password',
                hintStyle: TextStyle(
                  fontStyle: FontStyle.italic,color: Colors.blue
                )
              ),
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            child: ElevatedButton(
              onPressed: (){
                var username = nameCtrl.text;
                var Password = PasswordCtrl.text;
                var retype= Retype.text;
                SessionStorageHelper.savevalue("username",username);
                SessionStorageHelper.savevalue("password",Password);
                SessionStorageHelper.savevalue("retype",retype);
                if(username != "" && Password != ""){
                  showMessage('Register Success',context);
                   Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
                }else{
                   showMessage('UnSuccess!Please Register',context);
                }
              },
              child:const Text('Create Account'),
              style:const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue)
              ),
            ),
          ),
      ],
      ) ,
    );
  }
  
     void showMessage(String sms, BuildContext context) {
    ScaffoldMessenger.of(context)
    .showSnackBar(SnackBar(content: Text(sms)));
  }
}