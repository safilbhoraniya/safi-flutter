import 'package:assignment_61/second.dart';
import 'package:flutter/material.dart';


void main()
{
  runApp(MaterialApp(home: myapp(),));
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {

  int selectedItem = 0;

  List<String>  items = ["Recommend","Popular","Noodles","Pasta"];
  List<String>  foodList = ["Spaghetti bacon","Pollo foodie Gourmet","Stir fry noodles","Shrimp-pasta fried rice"];
  List<String>  foodImagesList = ["assets/i1.jpg","assets/i2.jpg","assets/i3.jpg","assets/i4.jpg"];
  List<String>  foodPriceList = ["\$25","\$30","\$35","\$38"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("menu",style: TextStyle(fontWeight: FontWeight.bold)),

          actions:
          [

            Padding(padding: EdgeInsets.only(right: 10.0),
              child: IconButton(onPressed: ()
              {

                },icon: Icon(Icons.search_sharp),
              ),
            ),
          ]),


      body: Padding
        (
        padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: Center
          (
          child: Column
            (
            children:
            [
              Container
                (
                width: double.infinity,
                height: 50,
                child: ListView.builder(
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx,index){
                      return InkWell(
                        onTap: (){
                          selectedItem = index;
                          setState(() {});
                        },
                        child: selectedItem == index? Container(
                          width: 120,
                          height: 40,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(items[index],style: TextStyle(fontWeight: FontWeight.w800),),
                        ):Container(
                          width: 120,
                          height: 40,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(items[index],style: TextStyle(fontWeight: FontWeight.w800),),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 10,),

              Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                        (
                          crossAxisCount: 2,
                          mainAxisSpacing: 1.0,
                          crossAxisSpacing: 1.0
                      ),
                      itemCount: items.length,
                      itemBuilder: (context,index)
                      {
                        return Card
                          (
                          child: GridTile
                            (
                              child: Center
                                (
                                child: Column
                                  (
                                  children:
                                  [
                                    Image.asset(foodImagesList[index],height: 115,width: double.infinity,),
                                    Text(foodList[index],style: TextStyle(fontWeight: FontWeight.bold),),
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 45),
                                        child: Center(
                                          child: Row(
                                            children:
                                            [
                                              Text(foodPriceList[index]),
                                              SizedBox(width: 40,),
                                              IconButton(onPressed: ()
                                              {
                                                _showMenu(index);
                                              }, icon: Icon(Icons.add_box_sharp))
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }

  void _showMenu(index)
  {
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        margin: EdgeInsets.all(15),
        child: Wrap(
          alignment: WrapAlignment.center,
          children:
          [

            ListTile
              (
              leading: Text("Your Order",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
              trailing: IconButton(onPressed: ()
              {
                Navigator.of(context).pop();
              },icon: Icon(Icons.delete),),
            ),
            SizedBox(height: 10,),

            ListTile
              (
              leading: Text(foodList[index],style: TextStyle(fontSize: 20)),
              trailing: Text(foodPriceList[index],style: TextStyle(fontSize: 18)),
            ),

            ListTile
              (
              leading: Text("TOTAL :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26)),
              trailing: Text(foodPriceList[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26)),
            ),


            MaterialButton(
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              minWidth: 350,
              color: Colors.purple.shade100,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => second()));
              },child: Text("Add to Cart"),
            )

          ],
        ),
      );
    });
  }
}