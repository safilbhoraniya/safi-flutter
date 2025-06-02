import 'package:flutter/material.dart';

class FoodDetailsPage extends StatefulWidget
{
  final String image;
  final String diceName;
  const FoodDetailsPage({super.key,  required this.image,  required this.diceName});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage>
{
  String dec = "Simply put, ramen is a Japanese noode soup, with a combination of a rich flavoured broth, one of a variety of types of noodle and a selection of meats or vegetables, often topped with a boiled egg.";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("Size ==> ${size.width * 0.38}");
    return Scaffold
      (
      backgroundColor: Colors.blue.shade50,
      body: Container
        (
        width: size.width,height: size.height,
        child: Stack
          (
          alignment: Alignment.topCenter,
          children:
          [
            InkWell(onTap:(){
              Navigator.of(context).pop();
            }),

            Positioned(
              top: size.width * 0.5,
              right: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(size.width * 0.12),
                      topLeft: Radius.circular(size.width * 0.12),
                    )
                ),
                child: Column
                  (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.width * 0.25,),
                    Text(widget.diceName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Row(children: [
                          Icon(Icons.watch_later_outlined,color: Colors.blue,size: 15 ,),
                          Text("50 min",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
                        ],),
                        SizedBox(width: 30,),
                        Row(children: [
                          Icon(Icons.star,color: Colors.yellow,size: 15 ,),
                          Text("4.8",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
                        ],),
                        SizedBox(width: 30,),
                        Row(children: [
                          Icon(Icons.local_fire_department,color: Colors.red,size: 15 ,),
                          Text("350 kcal",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
                        ],)
                      ],),
                    SizedBox(height: 20,),
                    Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration
                        (
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(30),

                      ),
                      child: Row
                        (
                        children: [
                          SizedBox(width: 15,),
                          Text("\$",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w800),),
                          Text("12",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),),
                          SizedBox(width: 15,),
                          Expanded(
                            child: Container
                              (
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade300,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.remove,size: 18,),
                                  Container(
                                    width: 22,
                                    height: 22,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text("1",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w800),),
                                  ),
                                  Icon(Icons.add,size: 18,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children:
                        [
                          Text("Ingredients",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800),),
                          SizedBox(height: 20,),
                          Row(
                            children:
                            [
                              Container(
                                width: 60,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:
                                  [
                                    SizedBox(height: 15,),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("assets/i1.png"),fit: BoxFit.cover,),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    Text("Noodle",style: TextStyle(fontSize: 12,),),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                width: 60,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 15,),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration
                                        (
                                        image: DecorationImage(image: AssetImage("assets/i2.png"),fit: BoxFit.cover,),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    Text("shrimp",style: TextStyle(fontSize: 12,),),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                width: 60,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 15,),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("assets/i3.png"),fit: BoxFit.cover,),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    Text("Egg",style: TextStyle(fontSize: 12,),),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                width: 60,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 15,),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("assets/i4.png"),fit: BoxFit.cover,),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    Text("Scallion",style: TextStyle(fontSize: 12,),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Text("About",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800),),
                          SizedBox(height: 20,),
                          Text(dec,maxLines: 5,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Positioned(
              top: size.width * 0.25,
              child: Container(
                width: size.width * 0.45,
                height: size.width * 0.45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: Offset(-2, 2)
                      ),
                      BoxShadow(
                          color: Colors.white12,
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: Offset(2, -2)
                      ),
                    ],
                    image: DecorationImage(image: AssetImage(widget.image),fit: BoxFit.cover,)
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 85,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100)
        ),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor:Colors.blue.shade300,
          child: Row(
            children: [
              Icon(Icons.shopping_bag_outlined),
              SizedBox(width: 2,),
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)
                ),
                child: Text("1",style: TextStyle(fontSize: 10),),
              )
            ],
          ),
          onPressed: (){},
        ),

      ),
    );
  }
}