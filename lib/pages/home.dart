

import 'package:flutter/material.dart';
import 'package:textformfield128/models/food.dart';

import 'package:textformfield128/models/subject.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key, required this.title }) : super(key: key);

  final String title;
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _forkey = GlobalKey<FormState>();

  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  
// บทเรียนchackbox
List<ListItem> dropdownItem = ListItem.getListItem();
late List<DropdownMenuItem<ListItem>> dropdownMenuItems;
late ListItem _selectedItem;
  // บทเรียนchackbox
// บทเรียนchackbox
  // bool thaiChk = false;
  // bool engChk = false;

  late List<Subject> subjects;

  List selectedSubject = [];
  
// บทเรียนchackbox
  // // บทเรียนRadio
  String? foodvalue;

  late List<Food> foods;

  // ignore: prefer_typing_uninitialized_variables

  @override
  void initState() {
    super.initState();
    foods = Food.getFood();

    subjects = Subject.getSubject();

    dropdownMenuItems = createDropdownMenu(dropdownItem);
    _selectedItem = dropdownMenuItems[0].value!;

   
    print(foods);
    print(subjects);
    print(dropdownItem);
   
  }

  List<DropdownMenuItem<ListItem>> createDropdownMenu(
     List<ListItem> dropdownItem) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (var item in dropdownItem) {
      items.add(DropdownMenuItem(
        child: Text(item.name),
        value: item,
      
      
      ));
    }
    return items;
  }


 
  @override

   // // บทเรียนRadio
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children:  [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _forkey,
              child: Column(
                children: [
                  User(),
                  const SizedBox(height: 10,),
                  User1(),
                  const SizedBox(height: 10,),
                  Column(
                    children: createFoodRadio(),
                    
                  ),
                  Text('Ipem Selected: $foodvalue'),
                  const SizedBox(height: 10,),

                  Column(
                    children: createSubjectCheckbox(),
                  ),
                  const SizedBox(height: 10,),
                  
                  DropdownButton(
                    value: _selectedItem,
                    items: dropdownMenuItems , 
                    onChanged: (value){
                      setState(() {
                        _selectedItem = value as ListItem;
                      });

                  },),
                  

                  // บทเรียนchackbox
                  // CheckboxListTile(
                  //   value: thaiChk,
                  //   title: Text('Thailand'), 
                  //   onChanged: (value){
                  //     setState(() {
                  //       thaiChk = value!;
                  //     });

                  // }),
                  
                  // CheckboxListTile(
                  //   value: engChk,
                  //   title: Text('English'), 
                  //   onChanged: (value){
                  //     setState(() {
                  //       engChk = value!;
                  //     });

                  // }),
                  // บทเรียนchackbox


                  // บทเรียนRadio
                  // RadioListTile(
                  //   title: Text('Pizzaaa'),
                  //   subtitle: Text('258 บาท'),
                  //   activeColor: Colors.indigo,
                  //   value: 'Pizza', 
                  //   groupValue: foodValue, 
                  //   onChanged: (Value) {
                  //     setState(() {
                  //       foodValue = Value.toString();
                  //     });
                  //   },
                    
                  // ),
                  // RadioListTile(
                  //   title: Text('Steak'),
                  //   subtitle: Text('258 บาท'),
                  //   activeColor: Colors.indigo,
                  //   value: 'Steak', 
                  //   groupValue: foodValue, 
                  //   onChanged: (Value) {
                  //     setState(() {
                  //       foodValue = Value.toString();
                  //     });
                  //   },
                    
                  // ),
                  // Text('Ipem Selected: $foodValue'),
                  // // บทเรียนRadio


                  summit(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget summit() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ElevatedButton(
                    onPressed: (){
                      if (_forkey.currentState!.validate()){
                        // ignore: avoid_print
                        print(_usernamecontroller.text);
                        // ignore: avoid_print
                        print(_passwordcontroller.text);

                      }
                    },
                    style: const ButtonStyle(

                    ),
                    child: const Text('Submit'),
                  
                  ),
    );
  }

  // ignore: non_constant_identifier_names
  TextFormField User() {
    return TextFormField(
                  controller: _usernamecontroller,
                  validator: (value){
                    if (value!.isEmpty){
                      return ' Please Enter Username';

                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 2.0
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 2.0
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0
                      ),
                    ),
                  ),
                );
  }

  // ignore: non_constant_identifier_names
  TextFormField User1() {
    return TextFormField(
                  controller: _passwordcontroller,
                  validator: (value){
                    if (value!.isEmpty){
                      return ' Please Enter password';

                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.password_rounded),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 2.0
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 2.0
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0
                      ),
                    ),
                  ),
                );
  }

  List<Widget> createFoodRadio() {
    List<Widget> listRadioFood = [];

    listRadioFood = foods
        .map(
          (food) => RadioListTile<dynamic>(
            title: Text(food.thName),
            subtitle: Text(food.enName),
            secondary: Text(food.price.toString() + ' บาท'),
            value: food.foodvalue, 
            groupValue: foodvalue, 
            onChanged: (value) {
              setState(() {
                // ignore: unused_local_variable
                foodvalue = value;
              });
            }),
        )
        .toList();

    return listRadioFood;

  }

  List<Widget> createSubjectCheckbox() {
    List<Widget> listCheckboxSubject = [];

    for (var subject in subjects) {
      listCheckboxSubject.add(
        CheckboxListTile(
          title: Text(subject.subName),
          subtitle: Text('creadit: ${subject.credit}'),
          value: subject.checked,
          onChanged: (value){
            setState(() {
              subject.checked = value!;
            });
            if(value!){
              selectedSubject.add(subject.subName);
            }
            else {
              selectedSubject.remove(subject.subName);
            }
            print(selectedSubject);
          },
        ),
      );
    }
    return listCheckboxSubject;
  }

 
}
class ListItem{
  late int value;
  late String name;

  ListItem(this.value, this.name);
    static List<ListItem> getListItem(){
      return [
        ListItem(1, 'Item'),
        ListItem(2, 'Item'),
        ListItem(3, 'Item'),
        
      ];
    }

}

