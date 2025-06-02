import 'package:assignment_61/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

  var now = DateTime.now();
  get weekDay => DateFormat('EEEE').format(now);
  get day => DateFormat('dd').format(now);
  get month => DateFormat('MMMM').format(now);

  List<String>  foodList = ["Burger","Avocado Salad","Ice Cream","Vegetable Soup"];
  List<String>  foodImages = ["assets/burger.jpg","assets/avocado.jpg","assets/icecream.jpg","assets/soup.jpg"];
  List<String>  foodPriceList = ["\$25","\$30","\$35","\$38"];
  List<String>  foodItemCount = ["3","1","2","4"];


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Cart")),
      body: SingleChildScrollView
        (
        child: Container
          (
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column
            (
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              ...buildHeader(),
              ListView.builder
                (
                  shrinkWrap: true,
                  itemCount: foodList.length,
                  itemBuilder: (context,index)
                  {
                    return Card
                      (
                      child: ListTile
                        (
                        leading: Image.asset(foodImages[index],width: 100,),
                        title: Row
                          (
                          children:
                          [
                            Text(foodList[index]),
                            SizedBox(width: 20,),
                            Text(foodPriceList[index])
                          ],
                        ),

                        subtitle: Row
                          (
                          children:
                          [
                            IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle)),
                            Text(foodItemCount[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                            IconButton(onPressed: (){}, icon: Icon(Icons.add_circle)),
                          ],
                        ),

                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    );
                  }),
              SizedBox(height: 20,),
              Divider(),
              MaterialButton(
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                minWidth: 350,
                color: Colors.purple.shade100,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => myapp()));
                },child: Text("CheckOut"),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildHeader() {
    return [

      Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 0),
        child: Text('$weekDay, ${day}th of $month',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),

      MaterialButton(onPressed: (){
        Navigator.of(context).pop();
      },child: Text('+ Add to order'),
      )

    ];
  }
}