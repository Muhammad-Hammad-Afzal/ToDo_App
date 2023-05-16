import 'package:flutter/material.dart';
import 'package:task/modal_class.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  State<AllTasks> createState() => _AllTasksState();
}



class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: size.height * .01, horizontal: size.width * .05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('All Tasks',style: TextStyle(fontSize: size.width * .06)),
            Expanded( child:  ListView.builder(
                itemCount: all_list.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: size.height * .02),
                    child: Container(
                      decoration: BoxDecoration(
                          color: all_list[index].backgroundcolor,
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
                                Row(
                                  children: [
                                    Text(all_list[index].title.toString(),style: TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.w500)),
                                    Container(width: size.width * .6),
                                    Text('('+all_list[index].status.toString()+')',style: TextStyle(fontSize: 15,color: Colors.black)),
                                  ],
                                ),
                                Container(height: size.height * .01),
                                Text(all_list[index].text.toString(),style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500,color: Colors.black)),
                                Container(height: size.height * .01),
                                Row(
                                  children: [
                                    Text(all_list[index].starttime!.format(context).toString()),
                                    Text('-'),
                                    Text(all_list[index].endtime!.format(context).toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                })),


          ],
        ),
      ),
    );
  }
}
