import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
const activeColor =Colors.blue;
const inactiveColor =Colors.grey;
class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();

  }


class _HomeScreenState extends State<HomeScreen> {

  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inactiveColor;
  int height=180;
  double weight=50;
  int age =30;
  double result =0;
  int femaleChecked=0;
  int maleChecked=0;
  TextEditingController weightController = TextEditingController();
String calculatingResult(int height,double weight){
  result=weight/pow(height/100,2);
  
  return result.toStringAsPrecision(1);
}
String descrption (double result){
  if (result>=25){
    return 'You have a higher than normal body weight. Try to exercise more.';
  }
  else if (result>18){
    return'You have a normal body weight, Good jop!';
  }
  else {
    return'You have a lower than normal body weight, You can eat a bit more.';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator"),backgroundColor: Colors.black,),
      body:
      ListView(
        children: <Widget>[

       Row(
          children: <Widget>[


                  GestureDetector(
                    onTap: (){
                      setState(() {
                        if(maleChecked==0) {
                          maleChecked = 1;
                          femaleChecked=0;
                        }
                        else{
                          maleChecked=0;
                          femaleChecked=1;
                        }
                        // updateBoxColor(1);
                      });
                    },
                  child:

       Container(
         child: 
         Column(
           children: <Widget>[
             Icon(Icons.attribution_sharp,
             size: 80.0,),
             SizedBox(height: 15.0,),
             Text("Male",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w900),)
           ],),

         width: 165,
              height: 200,
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(



                borderRadius: BorderRadius.circular(10.0),
                color: maleChecked==0?Colors.white:activeColor,


                boxShadow: [
                  BoxShadow(
                    // color: Colors.grey.shade500,
                    spreadRadius: 5.0,
                    blurRadius: 7.0,

                )],
              ),
            ),
            ),



            GestureDetector(
            onTap: (){
            setState(() {
              if(femaleChecked==0) {
                femaleChecked = 1;
                maleChecked=0;
              }
              else{
                femaleChecked=0;
                maleChecked=1;
              }

            });
            },
              child:
            Container(
              child:
              Column(
                children: <Widget>[
                  Icon( Icons.pregnant_woman_rounded,
                    size: 80.0,),
                  SizedBox(height: 15.0,),
                  Text("Female",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w900),)
                ],),
              height: 200,
              width: 160,
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10.0),
                color: femaleChecked==0?Colors.white:activeColor,
                boxShadow: [
              BoxShadow(
              color: Colors.grey.shade500,
                spreadRadius: 5.0,
                blurRadius: 7.0,
      )],
            ),

            ),
            ),



          ],
        ),


          Container
            (
            height: 200,


            child:
              Center(
    child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Text("Height",
              style: TextStyle(fontSize: 30),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(height.toString(),
                  style: (TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  )
                 ),
                  ),
                  Text("  CM",
                  style: (TextStyle(
                    fontSize: 20,
                  )),)

                ],),
              Slider(

                  value: height.toDouble(),
                  min: 100,
                  max: 300,
                  activeColor: activeColor,
                  inactiveColor: inactiveColor,
                  onChanged: (double newValue){
                    setState(() {
                      height= newValue.round();

                    });
    }
              ),
            ],
          ),
          ),

            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  spreadRadius: 5.0,
                  blurRadius: 7.0,


                )],
            ),

          ),


     Row(
    children: <Widget>[

    Container(
      height: 210,
      width: 165,
      child:


    Column(
    mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[
    Text("Weight",
    style: TextStyle(fontSize: 30),),
    TextFormField(
      keyboardType: TextInputType.number,
    controller: weightController,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
    borderSide: new BorderSide(color: activeColor, width: 10 )),
    hintText: weight.toString(),
    filled: true,
    hintStyle: TextStyle(fontSize: 40,
    fontWeight: FontWeight.w900,color: Colors.black,)

    ),
    ),
          Text(" KG",
          style: TextStyle(fontSize: 23),),




      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: activeColor,
            child:Icon(Icons.add,color: Colors.white,) ,
            onPressed: (){
              setState(() {
                weight+=0.5;
              });
            },),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: activeColor,
            child:Icon(Icons.remove,color: Colors.white,) ,
            onPressed: (){
              setState(() {
                weight-=0.5;
              });
            },),
        ],
      )



    ]
    ),

    margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade500,
          spreadRadius: 5.0,
          blurRadius: 7.0,
        )],
    ),
    ),


    Container(
      height: 210,
      width: 165,
      child:
      Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text("Age",
              style: TextStyle(fontSize: 30),),

            TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: activeColor, width: 10 )),
                hintText: age.toString(),
                hintStyle: TextStyle(fontSize: 40,
                  fontWeight: FontWeight.w900,color: Colors.black,)

              ),
            ),

            Text(" Year",
              style: TextStyle(fontSize: 23),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: activeColor,
                  child:Icon(Icons.add,color: Colors.white,) ,
                  onPressed: (){
                    setState(() {
                      age++;
                    });
                  },),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  backgroundColor: activeColor,
                  child:Icon(Icons.remove,color: Colors.white,) ,
                  onPressed: (){
                    setState(() {
                      age--;
                    });
                  },),
              ],
            )



          ]
      ),
    margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade500,
          spreadRadius: 5.0,
          blurRadius: 7.0,
        )],
    ),
    ),

        ],
      ),

          Center(child:
          ElevatedButton(
            child: const Text(
              "Calculate",
              style:
              TextStyle(fontSize: 35,color: Colors.white ),
            ),
            onPressed: () {

                double weight =  double.parse(weightController.value.text);
                calculatingResult(height,weight);
                print(result);

                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                    title:  Text("Your BMI IS"),
                content:  Text(result.toString(),style:
                TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),


                    actions: <Widget>[
                  TextButton(

                  onPressed: () {
                Navigator.of(ctx).pop();


              },
                child: Container(
                  color: activeColor,
                  padding: const EdgeInsets.all(14),
                  child: const Text("Back",style: TextStyle(color: Colors.white),),
              ),
                  ),
                  ],
                  ),
              );
            },
          ),)
    ],
    ),
    );
  }
}