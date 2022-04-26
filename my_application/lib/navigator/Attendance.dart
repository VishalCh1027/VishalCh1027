

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Attendance extends StatefulWidget{
  const Attendance({Key? key,required this.project});
 
  final project;

  @override
  State<StatefulWidget> createState() => _AttendanceState();
  }


class _AttendanceState extends State<Attendance>{
  TimeOfDay inTime = const TimeOfDay(hour: 9,minute: 30);
   TimeOfDay outTime = const TimeOfDay(hour: 6,minute: 30);
   List<AttendanceClass>? workmens;
  void initState() {
    super.initState();
   workmens =[AttendanceClass(outTime,Workmen(1,"vishal","chinta"),inTime,1),
   AttendanceClass(outTime,Workmen(2,"shashank","lolam"),inTime,2),AttendanceClass(outTime,Workmen(3,"sai","kasturi"),inTime,3)];
  }  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      // ignore: unnecessary_null_comparison
      body: AttendanceClass==null? const Center(
        child: Text("Attendance Done"),
      ):
         ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
          children: <Widget>[ _buildHead(),
          _buildlist()
          ]),
    );
  }

  Widget _buildButton(){
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.all(0.0),
          child: Text("Submit"),),
        onPressed: null,
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
                  ),
        ),
        
        );
  }
  
  Widget _buildHead(){
    return const Center(
      child:Text("Project Name"));
  }

  Widget _buildlist(){
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Name',
          ),
        ),
        DataColumn(
          label: Text(
            'IN',
          ),
        ),
        DataColumn(
          label:Text(
            'OUT',
          ),
        )
        ]
        , rows: workmens!.map((workmen) => 
                 DataRow(
                          cells: [
                            DataCell(
                                Text(workmen.workmen.firstname),
                              ),
                             DataCell(
                                ElevatedButton(onPressed: (){_selectInTime(context,workmen);}, child:Text(workmen._in.format(context))),
                            ),
                             DataCell(
                                ElevatedButton(onPressed: (){_selectOutTime(context,workmen);}, child:Text(workmen.out.format(context))),
                            ),
                          ]),
                ).toList()
                ,
    );
  }

  PreferredSizeWidget _buildAppBar(){
    return AppBar(
        title: const Text("Attendance"),
      );
  }

Future<void> _selectInTime(BuildContext context,AttendanceClass attendanceClass) async {          
      final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: attendanceClass._in,
        initialEntryMode: TimePickerEntryMode.dial,
      );
      // ignore: unnecessary_null_comparison
      if(timeOfDay != null && timeOfDay != attendanceClass._in)
        {
          setState(() {
            var index = workmens?.indexWhere((element) => element.workmenId == attendanceClass.workmenId);
            if(index != null)
            {
                workmens?[index]._in = timeOfDay;
            }
          });
        }
  }
 Future<void> _selectOutTime(BuildContext context,AttendanceClass attendanceClass) async {          
      final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: attendanceClass.out,
        initialEntryMode: TimePickerEntryMode.dial,
      );
      // ignore: unnecessary_null_comparison
      if(timeOfDay != null && timeOfDay != attendanceClass.out)
        {
          setState(() {
            var index = workmens?.indexWhere((element) => element.workmenId == attendanceClass.workmenId);
            if(index != null)
            {
                workmens?[index].out = timeOfDay;
            }
          });
        }
  }

  }


  class Workmen{
    double id;

    String firstname;

    String lastname;

    Workmen(this.id,this.firstname,this.lastname);
  }

  class AttendanceClass
  {
      Workmen workmen;

      TimeOfDay _in;

      TimeOfDay out;

      double workmenId;

      AttendanceClass(this.out,this.workmen,this._in,this.workmenId);
  }