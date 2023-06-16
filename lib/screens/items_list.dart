import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_final/screens/items_provider.dart';

import 'items_selected.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({super.key});

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
 
 final List<Map<String,dynamic>>gridMap =[
            {  
              "title"  :  "White Snesker With adidas logo",
              "price"  :  "\$255",
              "images" :  'https://www.eatingwell.com/thmb/YxkWBfh2AvNYrDKoHukRdmRvD5U=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/article_291139_the-top-10-healthiest-foods-for-kids_-02-4b745e57928c4786a61b47d8ba920058.jpg',

            },
            {
              "title"  :  "Black Snesker With adidas logo",
              "price"  :  "\$505",
              "images" : 'https://images.unsplash.com/photo-1547584370-2cc98b8b8dc8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGJ1cmdlciUyMHBuZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
            },
            {
              "title"  :  "Orange Jeans With adidas logo",
              "price"  :  "\$255",
              "images"  :"https://media.istockphoto.com/id/886902912/photo/homemade-burger.webp?b=1&s=170667a&w=0&k=20&c=soMZ9xl7bYK6cuvnqmTpvaPZuYfz1MoUT_RQDtr0SEo=",
            },
            {
              "title"  :  "Yellow Cloths With adidas logo",
              "price"  :  "\$105",
              "images"  :"https://images.unsplash.com/photo-1576843776838-032ac46fbb93?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGJ1cmdlciUyMHBuZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
            },
            {  
              "title"  :  "Pink Snesker With adidas logo",
              "price"  :  "\$305",
              "images" :  'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyJTIwcG5nfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',

            },
            {
              "title"  :  "With adidas logo",
              "price"  :  "\$505",
              "images" : 'https://images.unsplash.com/photo-1547584370-2cc98b8b8dc8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGJ1cmdlciUyMHBuZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
            },
            {
              "title"  :  "Jeans With adidas logo",
              "price"  :  "\$255",
              "images"  :"https://media.istockphoto.com/id/886902912/photo/homemade-burger.webp?b=1&s=170667a&w=0&k=20&c=soMZ9xl7bYK6cuvnqmTpvaPZuYfz1MoUT_RQDtr0SEo=",
            },
            {
              "title"  :  "Burger BoyYellow Cloths With adidas",
              "price"  :  "\$905",
              "images"  :"https://images.unsplash.com/photo-1576843776838-032ac46fbb93?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGJ1cmdlciUyMHBuZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
            },
 ];
//List<int> selectedItemm=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Items"),
        centerTitle: true,
        
        actions: [
          //SizedBox(width: 15,),
          InkWell(
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(
                builder:(context)=> ItemsSelected(),
                ),
              );
            },
            child: Icon(Icons.favorite)),
          SizedBox(width: 25,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 313
                  ),
                  shrinkWrap: true,
                  itemCount: gridMap.length, 
                  itemBuilder   : (_ , index){
                    return Consumer<ItemsProvider>(
                      builder:(context, value, child) {
                        return Container(
                        //height: 300,
                        decoration: BoxDecoration(
                          color: Colors.redAccent.shade100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius:const BorderRadius.only(topRight: Radius.circular(16.0),topLeft: Radius.circular(16.0)),
                              child: Image.network("${gridMap.elementAt(index)['images']}",
                              fit: BoxFit.fill,
                              height: 170,
                              width: double.infinity,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${gridMap.elementAt(index)['title']}",
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.yellowAccent),),
                                  SizedBox(height: 8.0,),
                                   Text("${gridMap.elementAt(index)['price']}",
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                   
                                    IconButton(onPressed: (){
                                      
                                    }, 
                                    icon: InkWell(
                                      onTap: (){
                                        if(value.itemssSelected.contains(index)){
                                          value.removeItemss(index);
                                        }else{
                                          value.addItemss(index);
                                        };
                                      },
                                      child: Icon(
                                        value.itemssSelected.contains(index)?
                                        Icons.favorite:Icons.favorite_outline),
                                    ),),
                                  ],
                                  ),
                                  
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                      },
                      
                    );
                  }
                  ),
            ),
          ],
        ),
      ),
    );
  }
}