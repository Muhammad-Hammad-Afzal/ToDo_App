import 'package:flutter/material.dart';
import 'package:task/color_container.dart';
import 'package:task/home.dart';
import 'modal_class.dart';
import 'package:intl/intl.dart';

class SetTask extends StatefulWidget {
  const SetTask({Key? key}) : super(key: key);

  @override
  State<SetTask> createState() => _SetTaskState();
}

class _SetTaskState extends State<SetTask> {
  final textvalueController = TextEditingController();
  TimeOfDay starttime = TimeOfDay.now();
  TimeOfDay endtime = TimeOfDay.now();
  DateTime selectdate = DateTime.now();
  bool red = false;
  bool green = false;
  bool pink = false;
  bool orange = false;
  bool purple = false;
  Color colorvalue = Colors.white;

  String chosestatus = 'To do';
  List Statuslist = ['To do', 'Done'];
  String chosevalue = "Ux";
  List listietm = ['Ux', 'Ui', 'calls'];

  void selectstarttime (){
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value){
      setState(() {
        starttime = value!;
      });
    });
  }

  void selectendtime (){
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value){
      setState(() {
        endtime = value!;
      });
    });
  }

  void chosedate (){
    showDatePicker(context: context,
        initialDate: selectdate, 
        firstDate: DateTime(2000),
        lastDate: DateTime(2025)).then((value){
      setState(() {
        selectdate = value!;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width * .04,vertical: size.height*.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Task',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
              Container(height: size.height*.02),
              Text('Title',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
              Container(height: size.height*.01),
              Container(
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54),
                      borderRadius: BorderRadius.circular(size.width*.03)
                  ),
                  child:Padding(
                    padding:  EdgeInsets.symmetric(horizontal: size.width*.03),
                    child: DropdownButtonHideUnderline(
                      child:  DropdownButton(

                          icon: Icon(Icons.keyboard_arrow_down_sharp),

                          value:  chosevalue,
                          items: listietm.map<DropdownMenuItem<String>>((e) =>
                              DropdownMenuItem(child: Text(e),value: e)).toList(),
                          onChanged: (val){
                            setState(() {
                              chosevalue = val as String;
                            });
                          }),
                    ),
                  )
              ),
              Container(height: size.height*.025),
              Text('Status',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
              Container(height: size.height*.01),
              Container(
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54),
                      borderRadius: BorderRadius.circular(size.width*.03)
                  ),
                  child:Padding(
                    padding:  EdgeInsets.symmetric(horizontal: size.width*.03),
                    child: DropdownButtonHideUnderline(
                      child:  DropdownButton(

                          icon: Icon(Icons.keyboard_arrow_down_sharp),

                          value:  chosestatus,
                          items: Statuslist.map<DropdownMenuItem<String>>((e) =>
                              DropdownMenuItem(child: Text(e),value: e)).toList(),
                          onChanged: (val){
                            setState(() {
                              chosestatus = val as String;
                            });
                          }),
                    ),
                  )
              ),
              Container(height: size.height*.025),
              Text('Note',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
              Container(height: size.height*.01),
              TextFormField(
                controller: textvalueController,
                maxLines: null,
                decoration: InputDecoration(
                    hintText: 'Type Note here',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                        borderRadius: BorderRadius.circular(size.width*.03)
                    )
                ),

              ),
              Container(height: size.height*.025),
              Text('Date',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
              Container(height: size.height*.01),
              TextFormField(
                decoration: InputDecoration(
                    hintText: DateFormat('dd').format(selectdate).toString()+DateFormat(' MMM').format(selectdate).toString()+DateFormat(' yyyy').format(selectdate).toString(),
                    suffixIcon: IconButton(onPressed: (){chosedate();}, icon: Icon(Icons.calendar_month_outlined)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                        borderRadius: BorderRadius.circular(size.width*.03)
                    )
                ),

              ),
              Container(height: size.height*.025),
              Row(
                children: [
                  Text('Start Time',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
                  Container(width: size.width*.25),
                  Text('End Time',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
                ],
              ),
              Container(height: size.height*.01),
              Row(
                children: [
                  Container(
                    width: size.width*.42,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: starttime.format(context),
                          suffixIcon: IconButton(onPressed: (){setState(() {
                            starttime = selectstarttime() as TimeOfDay;
                          });}, icon: Icon(Icons.watch_later_outlined)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                              borderRadius: BorderRadius.circular(size.width*.03)
                          )
                      ),

                    ),
                  ),
                  Container(width: size.width*.04),
                  Container(
                    width: size.width*.42,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: endtime.format(context),
                          suffixIcon: IconButton(onPressed: (){setState(() {
                            endtime = selectendtime() as TimeOfDay;
                          });}, icon: Icon(Icons.watch_later_outlined)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                              borderRadius: BorderRadius.circular(size.width*.03)
                          )
                      ),

                    ),
                  ),
                ],
              ),
              Container(height: size.height*.025),
              Text('Color',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
              Container(height: size.height*.01),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      red = true;
                      green = false;
                      pink = false;
                      orange = false;
                      purple = false;
                      setState(() {
                        colorvalue = Colors.red;
                      });
                    },
                    child: ColorContainer(color: Colors.red,iconecolor: red ? Colors.white : Colors.red,),
                  ),
                  GestureDetector(
                    onTap: (){
                      red = false;
                      green = true;
                      pink = false;
                      orange = false;
                      purple = false;
                      setState(() {
                        colorvalue = Colors.green;
                      });
                    },
                    child: ColorContainer(color: Colors.green,iconecolor: green ? Colors.white : Colors.green,),
                  ),
                  GestureDetector(
                    onTap: (){
                      red = false;
                      green = false;
                      pink = true;
                      orange = false;
                      purple = false;
                      setState(() {
                        colorvalue = Colors.pink;
                      });
                    },
                    child: ColorContainer(color: Colors.pink,iconecolor: pink ? Colors.white : Colors.pink,),
                  ),
                  GestureDetector(
                    onTap: (){
                      red = false;
                      green = false;
                      pink = false;
                      orange = true;
                      purple = false;
                      setState(() {
                        colorvalue = Colors.orange;
                      });
                    },
                    child: ColorContainer(color: Colors.orange,iconecolor: orange ? Colors.white : Colors.orange,),
                  ),
                  GestureDetector(
                    onTap: (){
                      red = false;
                      green = false;
                      pink = false;
                      orange = false;
                      purple = true;
                      setState(() {
                        colorvalue = Colors.deepPurple;
                      });
                    },
                    child: ColorContainer(color: Colors.deepPurple,iconecolor: purple ? Colors.white : Colors.deepPurple),
                  ),
                ],
              ),
              Container(height: size.height*.03),
              Center(
                child: GestureDetector(
                  onTap: (){
                    if(chosestatus == 'To do'){
                      TodoList.add(ModalClass(
                          title: chosevalue,
                          text: textvalueController.text,
                          backgroundcolor: colorvalue,
                          selectdate: DateFormat('dd').format(selectdate),
                          starttime: starttime,
                          status: 'To do',
                          endtime: endtime));
                      all_list.add(ModalClass(
                          title: chosevalue,
                          text: textvalueController.text,
                          backgroundcolor: colorvalue,
                          selectdate: DateFormat('dd').format(selectdate),
                          starttime: starttime,
                          status: 'To do',
                          endtime: endtime));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));

                    }
                    else{
                      DoneList.add(ModalClass(
                          title: chosevalue,
                          text: textvalueController.text,
                          backgroundcolor: colorvalue,
                          selectdate: DateFormat('dd').format(selectdate),
                          starttime: starttime,
                          status: 'Done',
                          endtime: endtime));
                      all_list.add(ModalClass(
                          title: chosevalue,
                          text: textvalueController.text,
                          backgroundcolor: colorvalue,
                          selectdate: DateFormat('dd').format(selectdate),
                          starttime: starttime,
                          status: 'Done',
                          endtime: endtime));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                    }
                  },
                  child: Container(
                    height: size.height * .05,
                    width: size.width * .5,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(size.width*.1)
                    ),
                    child: Center(child:Text('Add Task',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
