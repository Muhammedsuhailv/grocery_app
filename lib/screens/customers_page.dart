import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_app/controller/controller.dart';
import 'package:product_app/model/models.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {

@override
@override
void initState() {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Provider.of<GetProduct>(context,listen: false).products;
  });
  super.initState();
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: Color(0xff064f1a),
        ),
        title: Text(
          "Customers",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey), // Updated hint text color
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.qr_code_2_outlined,
                          size: 25,
                          color: Colors.grey,
                        ),
                        IconButton(
                          style: ButtonStyle(backgroundColor:WidgetStatePropertyAll(Colors.blue)),
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 22.0, // set icon size
                          ),
                          color: Colors.blue,
                          constraints: BoxConstraints(),
                        ),
                      ],
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 700,
                child: Consumer<GetProduct>(

                  builder: (context,value, child) {
                    final data=value.products;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            elevation: 5.0,
                            shadowColor: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: 400,
                              height: 110,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(top:15.0),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(data[index].images.toString()),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Text(data[index].title.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                      Text(data[index].id.toString(),style: TextStyle(color: Colors.grey),),

                                        Row(
                                          children: [

                                            Text("Due Amount: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                            Text(data[index].price.toString(),style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),),

                                          ],
                                        ),

                                      ],),

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50.0,top:20),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          style: ButtonStyle(
                                            minimumSize: MaterialStateProperty.all(Size(20, 20)),
                                            maximumSize: MaterialStateProperty.all(Size(20, 20)),
                                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                                          ),
                                          onPressed: () {
                                            // Your onPressed code here
                                          },
                                          icon: Icon(Icons.call, size: 12),
                                        ),

                                        Image(image:AssetImage("assets/wp.png"),width: 20,height: 20,),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
