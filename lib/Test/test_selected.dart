import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_final/Test/test_provider.dart';


class ItemsSelectedd extends StatefulWidget {
  const ItemsSelectedd({super.key});

  @override
  State<ItemsSelectedd> createState() => _ItemsSelecteddState();
}

class _ItemsSelecteddState extends State<ItemsSelectedd> {
   final List<Map<String,dynamic>>gridMap =[
            {  
              "title"  :  "White",
              "price"  :  "\$255",
              "images" :  'https://www.eatingwell.com/thmb/YxkWBfh2AvNYrDKoHukRdmRvD5U=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/article_291139_the-top-10-healthiest-foods-for-kids_-02-4b745e57928c4786a61b47d8ba920058.jpg',

            },
            {
              "title"  :  "Black",
              "price"  :  "\$505",
              "images" : 'https://images.unsplash.com/photo-1547584370-2cc98b8b8dc8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGJ1cmdlciUyMHBuZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
            },
            {
              "title"  :  "Orange",
              "price"  :  "\$255",
              "images"  :"https://media.istockphoto.com/id/886902912/photo/homemade-burger.webp?b=1&s=170667a&w=0&k=20&c=soMZ9xl7bYK6cuvnqmTpvaPZuYfz1MoUT_RQDtr0SEo=",
            },
            {
              "title"  :  "Yellow",
              "price"  :  "\$105",
              "images"  :"https://images.unsplash.com/photo-1576843776838-032ac46fbb93?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGJ1cmdlciUyMHBuZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
            },
            {  
              "title"  :  "Snesker",
              "price"  :  "\$305",
              "images" :  'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyJTIwcG5nfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',

            },
            {
              "title"  :  "Adidas",
              "price"  :  "\$505",
              "images" : 'https://images.unsplash.com/photo-1547584370-2cc98b8b8dc8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGJ1cmdlciUyMHBuZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
            },
            {
              "title"  :  "Jeans",
              "price"  :  "\$255",
              "images"  :"https://media.istockphoto.com/id/886902912/photo/homemade-burger.webp?b=1&s=170667a&w=0&k=20&c=soMZ9xl7bYK6cuvnqmTpvaPZuYfz1MoUT_RQDtr0SEo=",
            },
            {
              "title"  :  "Burger",
              "price"  :  "\$905",
              "images"  :"https://images.unsplash.com/photo-1576843776838-032ac46fbb93?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGJ1cmdlciUyMHBuZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
            },
 ];
  @override
  Widget build(BuildContext context) {
    final favouriteeProvider = Provider.of<ItemsProviderr>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Test Selected'),
          centerTitle: true,

        ),
        body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                  itemExtent: 80,
                  //shrinkWrap: true,
                  itemCount: favouriteeProvider.iitemssSelected.length,
                  //itemCount: favouriteeProvider.iitemssSelected.length, 
                  itemBuilder   : (_ , index){
                    return Consumer(
                      builder:(context, value, child) {
                        return Container(
                          //color: Colors.white,
                          child:
                              Container(
                                
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Image.network("${gridMap.elementAt(index)['images']}",
                                  width: 100,
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                         Text("${gridMap.elementAt(index)['title']}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                         SizedBox(
                                          height: 10,
                                         ),
                                         Text("${gridMap.elementAt(index)['price']}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                 
                                    ],
                                  ),
                                  Container(
                                  color: Colors.blueGrey,
                                  child: Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   //crossAxisAlignment: CrossAxisAlignment.end,
                                   children: [
                                     InkWell(
                                      onTap: (){
                                        favouriteeProvider.decreaseItemss();
                                      },
                                      child: Icon(Icons.remove,size: 34,),
                                      ),
                                     Consumer(
                                      builder: (BuildContext context, value, Widget? child) { 
                                        return Text(favouriteeProvider.values.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),);
                                       },
                                     
                                      ),
                                     InkWell(
                                      onTap: () {
                                        favouriteeProvider.incrementItemss();
                                      },
                                      child: Icon(Icons.add,size: 34,),
                                      ),
                                   ],
                                  ),
                                   ),
                                ],
                                ),
                                
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
      ),
    );
  }
}