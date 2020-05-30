import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';


class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
// you have to specify exactly the type to make work without errors
  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      //another way of using the for loop
      //for (int i = 0; i < currenciesList.length; i++) {
      //String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  List<Text> getPickerItems(){
    List<Text> pickerItems =[];
    for(String currency in currenciesList){
      pickerItems.add(Text(currency,
        style: TextStyle(color: Colors.white),
      ),);
    }
    return pickerItems;
  }


//another way to create the picker widget
  /*
  Widget getPickerWidgetWithTheList(){
    List<Widget> pickerItems = [];
    for(String currency in currenciesList){
      pickerItems.add(Text(currency, style: TextStyle(color: Colors.white),),);
    }
      return CupertinoPicker(backgroundColor: Colors.lightBlue,
          itemExtent: 32.0,
          onSelectedItemChanged: (selectedIndex){
            print(currenciesList[selectedIndex]);
          },
          children: pickerItems);
  }
  */



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
                backgroundColor: Colors.lightBlue,
                itemExtent: 32.0,
                onSelectedItemChanged: null,
                children: getPickerItems()),
          ),
        ],
      ),
    );
  }
}


//DropdownButton<String>(
//                value: selectedCurrency,
//                items: getDropdownItems(),
//                onChanged: (value) {
//                  setState(() {
//                    print(value);
//                    selectedCurrency = value;
//                  });
//                }),