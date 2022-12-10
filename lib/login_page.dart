import 'package:flutter/material.dart';
import 'package:session_storage/home_page.dart';
import 'package:session_storage/register_page.dart';
import 'package:session_storage/session_storage.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var nameCtrl = TextEditingController();
    var PasswordCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        // backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body:Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Image(
          image: AssetImage('images/download.png')),
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
                  fontWeight: FontWeight.bold,color: Colors.green
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
                  fontStyle: FontStyle.italic,color: Colors.green
                )
              ),
              // onPressed: (){},
              // child: const Text('Login'),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed:(){
            },
             child:const Text('Forget Password?'), 
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            child: ElevatedButton(
              onPressed: (){
                var username = nameCtrl.text;
                var Password = PasswordCtrl.text;
                var user = SessionStorageHelper.getValue("username");
                var pass = SessionStorageHelper.getValue("password");
                // debugPrint('Username: ${nameCtrl.text}');
                // debugPrint('Password: ${PasswordCtrl.text}');
                if(username == user && Password==user){
                  showMessage('login Success',context);
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
                }if(username == "admin" && Password=="admin"){
                  showMessage('login Success',context);
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
                }
                else{
                  showMessage('Invalid Username or Password',context);
                }
                nameCtrl.clear();
                PasswordCtrl.clear();
              },
              child:const Text('Login'),
              style:const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.indigo)
              ),
            ),
          ),
          
          SizedBox(height: 30),
          TextButton(
            onPressed:(){
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => Registerpage(),
              ));
            },
             child:const Text('Create Account'), 
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
