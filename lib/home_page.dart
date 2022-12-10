import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var primaryColor  = Theme.of(context).colorScheme.primary;
    var clickCount=  1;
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      backgroundColor: primaryColor,
      body: const Center(
        child: Text("This is home screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          var now = DateTime.now();
          debugPrint('I click this button $now');
          debugPrint('Click count: $clickCount');
          if(clickCount % 10 ==0){
            showMessage('You have clicked $clickCount times',context);
          }
          clickCount++;
        },
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.mail),
        
         ),
    );
  }
  
  void showMessage(String sms, BuildContext context) {
    ScaffoldMessenger.of(context)
    .showSnackBar(SnackBar(content: Text(sms)));
  }
}