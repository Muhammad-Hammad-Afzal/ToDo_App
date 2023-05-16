import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task/modal_class.dart';
import 'package:task/set_task.dart';

import 'all_tasks.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  DateTime dayyy =DateTime.now();
  Color Colorvalue = Colors.white;
  List filtertodo = [];
  List filterdone = [];
  int _currentindex = 0;
  int selectindex = 0;
  bool tapped = false;





  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    DateTime enddate = DateTime.now().subtract(Duration(days: 10));

    final listitem = List<DateTime>.generate(21, (i){
      DateTime date = enddate;
      return date.add(Duration(days: i));
    });

    void filterfromtodo(value){
      setState(() {
        dayyy = value;
      });
      filtertodo.clear();
      for(var data in TodoList){
        String selectday = DateFormat('dd').format(dayyy);
        String date = data.selectdate.toString();
        if(date == selectday){
          filtertodo.add(data);
        }
      }

    }

    void filterfromdone(value){
      setState(() {
        dayyy = value;
      });
      filterdone.clear();
      for(var data in DoneList){
        String selectday = DateFormat('dd').format(dayyy);
        String date = data.selectdate.toString();
        if(date == selectday){
          filterdone.add(data);
        }
      }

    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * .02, horizontal: size.width * .05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Your Tasks',style: TextStyle(fontSize: size.width * .06)),
                  ElevatedButton(
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AllTasks()));},
                    child: Text('All Tasks',style: TextStyle(fontSize: size.width * .04,color: Colors.black)),style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),)

                ],
              ),
              Container(height: size.height * .02),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listitem.length,
                  itemBuilder: (context, index){

                    return InkWell(
                      onTap: (){
                        filterfromtodo(listitem[index]);
                        filterfromdone(listitem[index]);
                        setState(() {
                          selectindex = listitem[index].day;
                        });
                      },
                      child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: selectindex == listitem[index].day ? Colors.yellow : Colors.transparent,
                            borderRadius: BorderRadius.circular(10)
                          ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, top: 7),
                          child: Column(
                            children: [
                              Text(listitem[index].day.toString()+'   ',style: TextStyle(fontSize: 20,color: selectindex == listitem[index].day ? Colors.black : Colors.white,fontWeight: FontWeight.w800)),
                              SizedBox(height: 10),
                              Text(DateFormat('EE      ').format(listitem[index]), style: TextStyle(fontSize: 15  ,color: selectindex == listitem[index].day ? Colors.black : Colors.white, fontWeight: FontWeight.w800)),
                            ],
                          ),
                        )
                      ),
                    );
            }),
              ),
              Container(height: size.height * .02),
              Text('To do',style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
              Container(height: size.height * .02),
              Expanded(
                flex: 3,
                child: ListView.builder(
                  itemCount: filtertodo.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding:  EdgeInsets.symmetric(vertical: size.height * .02),
                      child: Container(
                        decoration: BoxDecoration(
                            color: filtertodo[index].backgroundcolor,
                            borderRadius: BorderRadius.circular(size.width * .02 )
                        ),
                        child: Row(
                          children: [
                            Container(height: size.height * .11, width: size.width * .02,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(size.width * .09)
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: size.height * .03, horizontal: size.width * .04),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(filtertodo[index].title.toString(),style: TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.w500)),
                                  Container(height: size.height * .01),
                                  Text(filtertodo[index].text.toString(),style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500,color: Colors.black)),
                                  Container(height: size.height * .01),
                                  Row(
                                    children: [
                                      Text(filtertodo[index].starttime!.format(context).toString()),
                                      Text('-'),
                                      Text(filtertodo[index].endtime!.format(context).toString()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );

            }),
              ),
              Container(height: size.height * .02),
              Text('Done  ',style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
              Container(height: size.height * .02),
              Expanded(
                flex: 3,
                child: ListView.builder(
                    itemCount: filterdone.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding:  EdgeInsets.symmetric(vertical: size.height * .02),
                        child: Container(
                          decoration: BoxDecoration(
                              color: filterdone[index].backgroundcolor,
                              borderRadius: BorderRadius.circular(size.width * .02 )
                          ),
                          child: Row(
                            children: [
                              Container(height: size.height * .11, width: size.width * .02,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(size.width * .09)
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(vertical: size.height * .03, horizontal: size.width * .04),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(filterdone[index].title.toString(),style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                                    Container(height: size.height * .01),
                                    Text(filterdone[index].text.toString(),style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500,color: Colors.black)),
                                    Container(height: size.height * .01),
                                    Row(
                                      children: [
                                        Text(filterdone[index].starttime!.format(context).toString()),
                                        Text('-'),
                                        Text(filterdone[index].endtime!.format(context).toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );

                    }),
              ),

            ]
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            iconSize: size.width * .06,
            selectedItemColor: Colors.blueAccent,
            currentIndex: _currentindex,
            onTap: (newindex){
              setState(() {
                _currentindex = newindex;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.request_page),label: ''),

              BottomNavigationBarItem(icon: Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle
                  ),
                  child: IconButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => SetTask()));}, icon: Icon(Icons.add),color: Colors.black)),label: ''),

              BottomNavigationBarItem(icon: Icon(Icons.chat),label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
            ]),

      ),
    );
  }
}
