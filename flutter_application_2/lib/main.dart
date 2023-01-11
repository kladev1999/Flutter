import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key : key);

    @override
    Widget build(BuildContext context) {
      return(MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('ป๋าหลอง ป๋าหลอง',style: TextStyle(fontSize: 30, color: Colors.black )),backgroundColor: Colors.orange),
      body: Appkla(),
      backgroundColor : Color.fromARGB(255,117,101,201)
  )));
    }
}
const TextStyle mystyle = TextStyle(
  
  fontSize: 55,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  
);
class Appkla extends StatelessWidget{
  const Appkla({Key? key}) : super (key : key);
  @override
  Widget build(BuildContext context) {
      return (Center( child:
        Column(children : [
            Text('สถานการณ์ Covid - 19',style:mystyle),
            Text('ในประเทศไทย',style:TextStyle(fontSize:30,color: Colors.white)),
            Container(
          child: Text('12 กรกฎาคม 2565',style:TextStyle(fontSize:30 ,fontWeight: FontWeight.bold)),
          width: 500,
          height: 50,
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.yellowAccent[400],
            borderRadius: BorderRadius.circular(12),
            boxShadow :[
            BoxShadow(
              color : Colors.black,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(3,3),
            )
          ]
          ),
          
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,children: [
          
             Container(child:
              Column(children: [
                
                 Text('หายป่วยวันนี้',style:TextStyle(fontSize:25 ,color: Colors.white,)),
            Text('+2,345',style:TextStyle(fontSize:80 ,fontWeight: FontWeight.bold,color: Colors.white,fontStyle: FontStyle.italic)),
              ],),
              
          width: 500,
          height: 200,
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 159, 193, 116),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),),
            boxShadow :[
            BoxShadow(
              color : Colors.black,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(3,3),
            )
          ]
          ),
          
          
        ),
         Container(child:
              Column(children: [
                
                 Text('หายป่วยสะสม',style:TextStyle(fontSize:25 ,color: Colors.white,)),
                 Text('ตั้งแต่ 1 มกราคม 2565',style:TextStyle(fontSize:12 ,color: Colors.white,)),
            Text('+2,325,540',style:TextStyle(fontSize:80 ,fontWeight: FontWeight.bold,color: Colors.white,fontStyle: FontStyle.italic)),
              ],),
       
          width: 500,
          height: 200,
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 132, 186, 62),
             borderRadius: BorderRadius.only(topRight: Radius.circular(30),),
            boxShadow :[
            BoxShadow(
              color : Colors.black,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(3,3),
            )
          ]
          ),
          
          
        ),
        
        ],),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,children: [
             Container(child:
              Column(children: [
                
                 Text('จำนวนผู้ป่วยรักษาตัวในโรงพยาบาล',style:TextStyle(fontSize:20 ,color: Colors.white,)),
                 Text('รายใหม่วันนี้',style:TextStyle(fontSize:10 ,color: Colors.white,)),
                 Text('(By RT-PCR & ATK)',style:TextStyle(fontSize:10 ,color: Colors.white,)),
                 Text('+1,679',style:TextStyle(fontSize:60 ,fontWeight: FontWeight.bold,color: Colors.white,fontStyle: FontStyle.italic)),
                Row(

                  
                  mainAxisAlignment: MainAxisAlignment.center,children: [
                    Text(' '),
                    Center(child: Column(children: [
                       Text(' '),
                    Text('ผู้ป่วยในประเทศ',style: TextStyle(color: Colors.white,),),
                    Text('+1669',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),),
                    ],),),
                    Text(' '),
                       SizedBox(
                  height: 55,
                  width: 40,
                  child: VerticalDivider(color: Colors.white,thickness: 2,),
                ),
                Center(child: Column(children: [
             
             Text('ผู้ป่วยในต่างประเทศ',style: TextStyle(color: Colors.white,),),
             Text('-',style: TextStyle(color: Colors.white,),),
                    ],),),
                    


            
                   ]
                
                )


              ],),
          
          width: 500,
          height: 200,
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 221, 90, 106),
           boxShadow :[
            BoxShadow(
              color : Colors.black,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(3,3),
            )
          ]
           
          ),
          
          
        ),
         Container(child:
              Column(children: [
                
                 Text('ป่วยสะสม',style:TextStyle(fontSize:25 ,color: Colors.white,)),
                 Text('ตั้งแต่ 1 มกราคม 2565',style:TextStyle(fontSize:12 ,color: Colors.white,)),
            Text('+2,325,098',style:TextStyle(fontSize:80 ,fontWeight: FontWeight.bold,color: Colors.white,fontStyle: FontStyle.italic)),
              ],),
          width: 500,
          height: 200,
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 223, 119, 108),
            boxShadow :[
            BoxShadow(
              color : Colors.black,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(3,3),
            )
          ]
           
          ),
          
          
        ),
        
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,children: [
             Container(child:
              Column(children: [
                
                 Text('กำลังรักษา',style:TextStyle(fontSize:25 ,color: Colors.white,)),
            Text('23,167',style:TextStyle(fontSize:80 ,fontWeight: FontWeight.bold,color: Colors.white,fontStyle: FontStyle.italic)),
              ],),
          
          width: 332,
          height: 150,
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 162, 198, 234),
           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),),
            boxShadow :[
            BoxShadow(
              color : Colors.black,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(3,3),
            )
          ]
          ),
          
          
        ),
         Container(child:
              Column(children: [
                
                 Text('ผู้ป่วยปอดอักเสบ',style:TextStyle(fontSize:20 ,color: Colors.white,)),
                 Text('รักษาตัวอยู่ในโรงพยาบาล',style:TextStyle(fontSize:20 ,color: Colors.white,)),
            Text('788',style:TextStyle(fontSize:70 ,fontWeight: FontWeight.bold,color: Colors.white,fontStyle: FontStyle.italic)),
              ],),
          
          width: 332,
          height: 150,
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 155, 153, 203),
             boxShadow :[
            BoxShadow(
              color : Colors.black,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(3,3),
            )
          ]
           
          ),
          
          
        ),
         Container(
          child:
              Column(children: [
                
                 Text('เสียชีวิตเพิ่ม',style:TextStyle(fontSize:20 ,color: Colors.white,)),
            Text('23',style:TextStyle(fontSize:60,fontWeight: FontWeight.bold,color: Colors.white,fontStyle: FontStyle.italic)),
              SizedBox(
                  height: 1,
                  width: 250,
                  child: Divider(color: Colors.white,thickness: 2,),
                ),
              Row(

                  
                  mainAxisAlignment: MainAxisAlignment.center,children: [
                   
                    Center(child: Column(children: [
                      
                    Text('เสียชีวิตสะสม',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                    Text('ตั้งแต่ 1 มกราคม 2565',style: TextStyle(fontSize: 10,color: Colors.white,),),
                    ],),),
                    
                       SizedBox(
                  height: 1,
                  width: 25,
                  
                ),
                Center(child: Column(children: [
             
             Text('9,184',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
            
                    ],),),
                    


            
                   ]
                
                )
              
              ],),
          width: 332,
          height: 150,
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 127, 127, 127),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),),
             boxShadow :[
            BoxShadow(
              color : Colors.black,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(3,3),

            ),
           
          ]
           
          ),
          
          
        ),
        
        ],)
        

        ]
        ),

      )
    );
  }
}