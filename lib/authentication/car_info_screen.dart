import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:olacab/authentication/signup_screen.dart';
import 'package:olacab/global/global.dart';
import 'package:olacab/splashScreen/splash_screen.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({Key? key}) : super(key: key);

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carmodel=TextEditingController();
  TextEditingController carnumber=TextEditingController();
  TextEditingController carcolor=TextEditingController();
  TextEditingController nam=TextEditingController();
  
  List<String> carTypesList=["uber-x","uber-go","bike"];
  String? selectedcartype;

  saveCarInfo(){
    Map driverCarInfo={
      "car_color":carmodel.text.trim(),
      "car_number":carnumber.text.trim(),
      "car_model":carmodel.text.trim(),
      "type":selectedcartype,
    };
    DatabaseReference driverRef=FirebaseDatabase.instance.ref().child("drivers");
    driverRef.child(currentFirebaseUser!.uid).child("car_details").set(driverCarInfo).catchError((m){
      Fluttertoast.showToast(msg: "Error" + m.toString());
    });
    Fluttertoast.showToast(msg: "CAR INFORMATION HAS BEEN SAVED");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children:  [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("lib/images/logo1.png"),
              ),
              SizedBox(height: 10,),
              const Text("Write Car details",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 26,
              ),),
              SizedBox(height: 20,),

              TextField(
                controller:carnumber,
                keyboardType: TextInputType.name,
                style: TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: "Car model",
                  labelText: "Car Model",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
          ),
              TextField(
                controller: carmodel,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  hintText: "car number",
                  labelText: "Car Number",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  )
                ),
              ),

              TextField(
                controller: carcolor,
                style: TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  hintText: "color",
                  labelText: "Car Color",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),

                ),
              ),

              SizedBox(height: 30,),
              DropdownButton(hint: const Text(
                "Please choose car type",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
              value: selectedcartype,
              onChanged: (newValue){
                setState(() {
                  selectedcartype=newValue.toString();
                });
              },
              items: carTypesList.map((car){
                return DropdownMenuItem(child:
                Text(
                  car,
                  style: TextStyle(color: Colors.grey),
                ),
                  value: car,
                );
              }).toList(),
              ),

              ElevatedButton(onPressed: (){
                if(carcolor.text.isNotEmpty && carnumber.text.isNotEmpty && carmodel.text.isNotEmpty && selectedcartype!=null){
                  saveCarInfo();
                }

                Navigator.push(context, MaterialPageRoute(builder: (c)=>MySplash_Screen()));
              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                )
                  , child: Text("SAVE NOW",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),),)

    ]
        ),
      ),)
    );
  }
}
