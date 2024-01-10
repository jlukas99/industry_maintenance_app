import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends StatelessWidget{
  final List factoryPath;
  final String uid;
  const MyDrawer({super.key, required this.factoryPath, required this.uid});

  @override
  Widget build(BuildContext context){
    return Drawer(
      width: MediaQuery.of(context).size.width/1.6,
      elevation: 16.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index){
              return Center(
                  child: ElevatedButton(
                    onPressed: index == factoryPath.length - 1? null : (){
                      if(index == 0){
                        context.goNamed('factory_zones', pathParameters: {'uid' : uid});
                      }
                    },
                      child: Text(factoryPath[index].toUpperCase(), style: const TextStyle(fontSize: 25.0),)));
            },
            separatorBuilder: (BuildContext context, int index){
              return const Icon(Icons.keyboard_arrow_down_outlined, size: 60,);
            },
            itemCount: factoryPath.length),
      )
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     for(var item in factoryPath)
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(item.toString().toUpperCase(), style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),),
      //       ),
      //   ],
      // ),
    );
  }
}