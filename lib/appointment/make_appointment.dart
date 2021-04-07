
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:afyasasa/widgets/dialog.dart';

class MyMakeAppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyMakeAppointmentPageScreen()
    );
  }
}

class MyMakeAppointmentPageScreen extends StatefulWidget {
  MyMakeAppointmentPageScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyMakeAppointmentPageScreenState createState() => _MyMakeAppointmentPageScreenState();

}

class _MyMakeAppointmentPageScreenState extends State<MyMakeAppointmentPageScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final format = DateFormat('EEEE, d MMMM, yyyy');

  TextEditingController _textEditingController = new TextEditingController();
  List<String> _values = new List();
  List<bool> _selected = new List();

  @override
  void dispose() {
    _textEditingController?.dispose();
    super.dispose();
  }

  Widget buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < _values.length; i++) {
      InputChip actionChip = InputChip(
        //selected: _selected[i],
        label: Text(_values[i]),
        labelStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.black,
        deleteIconColor: Colors.white,
        elevation: 10,
        pressElevation: 5,
        shadowColor: Colors.grey,
        onPressed: () {
          setState(() {
            _selected[i] = !_selected[i];
          });
        },
        onDeleted: () {
          _values.removeAt(i);
          _selected.removeAt(i);

          setState(() {
            _values = _values;
            _selected = _selected;
          });
        },
      );

      chips.add(actionChip);
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      //shrinkWrap: true,
      children: chips,
    );
  }

  String dropdownValue = 'Speciality Diagnostic Treatment';

  int _selectedIndex;
    List<String> _options = ['Video', 'Call', 'Visit'];
  
  Widget _buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(_options[i], style: TextStyle(color: Colors.white)),
        elevation: 10,
        pressElevation: 5,
        backgroundColor: Colors.black54,
        selectedColor: Colors.blue,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex = i;
            }
          });
        },
      );

      chips.add(Row(
        children: <Widget>[
          choiceChip
        ],
      //width: 20.0,
        //padding: EdgeInsets.symmetric(horizontal: 10),
        //child: choiceChip
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // This next line does the trick.
      //scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  //final servicesField = 

  @override
   Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
      children: <Widget>[

        SizedBox(height: 2.0),

        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Availability",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00284B)),
              ),
            ]
          ),
        ),
        SizedBox(height: 10.0),

        //https://stackoverflow.com/questions/59312786/flutter-custom-toggle-buttons-selection
        Container(
          margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Today, 27 April 2020",
            textAlign: TextAlign.left,),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  splashColor: Colors.blue[100],
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(width: 1.0, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Text('7.00',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                  ),
                ),
                InkWell(
                  splashColor: Colors.blue[100],
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      //color: Colors.blueAccent[100],
                      border: Border.all(width: 1.0, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Text('8.00',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
                  ),
                ),
                InkWell(
                  splashColor: Colors.blue[100],
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      //color: Colors.blueAccent[100],
                      border: Border.all(width: 1.0, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Text('10.00',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  ),
                ),

                InkWell(
                  splashColor: Colors.blue[100],
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      //color: Colors.blueAccent[100],
                      border: Border.all(width: 1.0, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Text('13.00',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  ),
                ),

                InkWell(
                  splashColor: Colors.blue[100],
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      //color: Colors.blueAccent[100],
                      border: Border.all(width: 1.0, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Text('16.00',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  ),
                ),
              ],
            ),
            SizedBox(height:10.0),
          ]),
        ),
        SizedBox(height: 10.0),

        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Time Schedule",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00284B)),
              ),
            ]
          ),
        ),
        SizedBox(height: 10.0),

        Container(
          margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
          padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.grey, width: 2)),
          child: Column(
            children: <Widget>[
            DateTimeField(
              format: format,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.calendar_today)
              ),
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.combine(date, time);
                } else {
                  return currentValue;
                }
              },
            ),
          ],
          ),
        ),

        
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Services",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00284B)),
              ),
            ]
          ),
        ),
        SizedBox(height: 10.0),

        Container(
          //height: 54.0,
          margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
          padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19.0),
            border: Border.all(color: Colors.grey, width: 2)),
          child: DropdownButton<String>(  
            isExpanded: true,         
            icon: Icon(Icons.keyboard_arrow_down),
            style: new TextStyle(
              color: Colors.black,
            ),
            underline: Container(
              color: Colors.white,
            ),
            hint: Text("Select Service"),
            value: dropdownValue,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Speciality Diagnostic Treatment', 'Preventive Medicine', 'Diabetes Management', 'Cancer treatment']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),

        SizedBox(height: 10.0),

        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Symptoms",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00284B)),
              ),
            ]
          ),
        ),
        SizedBox(height: 10.0),
        //https://stackoverflow.com/questions/52155254/how-can-i-build-a-chip-input-field-in-flutter
        Container(
          margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 30,
                child: buildChips(),
              ),
              
              TextFormField(
                controller: _textEditingController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    RaisedButton(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                      onPressed: () {
                        _values.add(_textEditingController.text);
                        _selected.add(true);
                        _textEditingController.clear();
      
                        setState(() {
                          _values = _values;
                          _selected = _selected;
                        });
                      },
                      child: Text('Add Symptom'),
                    ),
                  ],
                ),
                
              ),
            ],
          ),
        ),

        SizedBox(height: 10.0),

        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Consultation Method",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00284B)),
              ),
            ]
          ),
        ),
        SizedBox(height: 10.0),

        Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          //height: 30,
          //child: _buildChips(),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child:InkWell(
                  splashColor: Colors.blue[100],
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(width: 1.0, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Text('Call',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                  ),
                ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                  splashColor: Colors.blue[100],
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      //color: Colors.blueAccent[100],
                      border: Border.all(width: 1.0, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Text('Visit',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
                  ),
                ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                  splashColor: Colors.blue[100],
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      //color: Colors.blueAccent[100],
                      border: Border.all(width: 1.0, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Text('Video',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  ),
                ),
                ),
              ],
          ),
        ),

        SizedBox(height: 20.0),

        Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child:Column(
            //mainAxisAlignment: MainAxisAlignment.,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DecoratedBox(
                decoration:
                    ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)), color: Color(0xFF000000),),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      buttonTheme: ButtonTheme.of(context).copyWith(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
                  child: OutlineButton(
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                    child: Text('Make Appointment', style: TextStyle(color: Colors.white, fontSize: 22.0,), ),
                    onPressed: () => {
                      showDialog(context: context, builder: (BuildContext context) => CustomDialog())
                    },
                  ),
                ),
              ),
            ],
          )
        )
      ]
      ),
    );
  }

}
