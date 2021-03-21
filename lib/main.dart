import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  List<bool> _selection = [true,false,false];
  String tip;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(tip!=null?"\$"+tip: "",style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Total Amount",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 100,
                  child: TextField(
                    controller: controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "\$100.00"),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
              ),
              Column(
                children: [
                  ToggleButtons(
                    children: [
                      Text("10%",style: TextStyle(fontSize: 16)),
                      Text("15%",style: TextStyle(fontSize: 16)),
                      Text("20%",style: TextStyle(fontSize: 16)),
                    ],
                    isSelected: _selection,
                    onPressed:updateSelection,
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  onPressed: calculateTip,
                  color: Colors.purple,
                  child: Text("Calculate",style: TextStyle(color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateSelection(int selectedIndex)
  {
    setState(() {
      for(int i =0;i<_selection.length;i++)
      {
        _selection[i]=selectedIndex==i;
      }
    });

  }
  void calculateTip()
  {

    final totalAmount = double.parse(controller.text);
    final selectedItem = _selection.indexWhere((element) => element);
    final tipPercentage = [0.1,0.15,0.20][selectedItem];

    final totaltip = (totalAmount*tipPercentage).toStringAsFixed(2);

    setState(() {
      tip = totaltip;
    });

    // if(selectedItem==0)
    //   {
    //     final totalTip = (totalAmount*0.1).toStringAsFixed(2);
    //     setState(() {
    //       tip = totalTip;
    //     });
    //   }
    // if(selectedItem==1)
    // {
    //   final totalTip = (totalAmount*0.15).toStringAsFixed(2);
    //   setState(() {
    //     tip = totalTip;
    //   });
    // }
    // if(selectedItem==2)
    // {
    //   final totalTip = (totalAmount*0.2).toStringAsFixed(2);
    //   setState(() {
    //     tip = totalTip;
    //   });
    // }

  }
}
