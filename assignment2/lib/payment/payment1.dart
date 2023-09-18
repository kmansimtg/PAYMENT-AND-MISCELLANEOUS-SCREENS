import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropdownItem {
  final String text;
  final String imagePath;
  final bool isSelected;

  DropdownItem({
    required this.text,
    required this.imagePath,
    required this.isSelected,
  });
}

class Abou extends StatelessWidget {
  const Abou({Key? key}) : super(key: key);

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
bool isCardFormVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios_new_outlined, size: 20)),
                  SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Payment",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Select the payment method you want to\n use',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
        SizedBox(height: 8,),
              DropdownWithImages(
              leading:   const FaIcon(
                  FontAwesomeIcons.wallet,
                  color: Color(0xffF19305),
                  size: 20,
                ),
              listTileText: 'PhonePe/ Google Pay/ BHIM UPI',
              dropdownItems: [
                DropdownItem(text: 'PhonePe', imagePath: 'assets/phonepe.jpg', isSelected: false),
                DropdownItem(text: 'Google Pay', imagePath: 'assets/Googlepay.jpg', isSelected: false),
                DropdownItem(text: 'BHIM UPI', imagePath: 'assets/upi.png', isSelected: false),
                // Add more dropdown items as needed
              ],
            ),
            
            DropdownWithImages(
               leading: const FaIcon(
                  FontAwesomeIcons.wallet,
                  color: Color(0xffF19305),
                  size: 20,
                ),
              listTileText: 'Paytm/ Wallets',
              dropdownItems: [
                DropdownItem(text: 'Paytm', imagePath: 'assets/paytm.png', isSelected: false),
                DropdownItem(text: 'Triphopper Wallet', imagePath: 'assets/paytm.png', isSelected: false),
    
              ]),
           
              
              ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.creditCard,
                  color: Color(0xffF19305),
                  size: 20,
                ),
                title: Text('Credit/ Debit Card'),
              //   trailing:
              //       Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              trailing: isCardFormVisible
              ? Icon(Icons.keyboard_arrow_up,color: Colors.grey)
              : Icon(Icons.keyboard_arrow_down,color: Colors.grey),onTap: () {
            setState(() {
              isCardFormVisible = !isCardFormVisible;
            });
          },
        ),
        if (isCardFormVisible) CreditCardForm(), 
              Divider(),
            DropdownWithImages(
               leading: const FaIcon(
                  FontAwesomeIcons.globe,
                  color: Color(0xffF19305),
                  size: 20,
                ),
              listTileText: 'Netbanking',
              dropdownItems: [
                DropdownItem(text: 'Axis Bank', imagePath: 'assets/axisbank.jpg', isSelected: false),
                DropdownItem(text: 'HDFC Bank', imagePath: 'assets/hdfcbank.png', isSelected: false),
                DropdownItem(text: 'ICICI Bank', imagePath: 'assets/icicibank.jpg', isSelected: false),
                DropdownItem(text: 'Kotak', imagePath: 'assets/kotak.png', isSelected: false),
                DropdownItem(text: 'SBI', imagePath: 'assets/sbi.png', isSelected: false),
              ]),
              
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.cashRegister,
                    color: Color(0xffF19305),
                    size: 20,
                  ),
                  title: Text('Cash'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ), Divider(),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      backgroundColor: Color(0xffF19305)),

                  // ignore: prefer_const_constructors
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 34),
                    child: const Text(
                      //PAY BUTTON
                      "Pay",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  // onPressed: () {},
                ),
              ),
            ],
          )),
    );
  }
}



class DropdownWithImages extends StatefulWidget {
  final FaIcon leading;
  final String listTileText;
  final List<DropdownItem> dropdownItems;

  DropdownWithImages({
    required this.leading,
    required this.listTileText,
    required this.dropdownItems,
  });

  @override
  _DropdownWithImagesState createState() => _DropdownWithImagesState();
}

class _DropdownWithImagesState extends State<DropdownWithImages> {
  DropdownItem? _selectedItem;
  bool _isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: widget.leading,
          title: Text(widget.listTileText),
          trailing: Icon(_isDropdownOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
          onTap: () {
            setState(() {
              _isDropdownOpen = !_isDropdownOpen;
            });
          },
        ),
        if (_isDropdownOpen)
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Stack(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.dropdownItems.length,
                  itemBuilder: (context, index) {
                    return RadioListTile<DropdownItem>(
                      groupValue: _selectedItem,
                      value: widget.dropdownItems[index],
                      title: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              widget.dropdownItems[index].imagePath,
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text(widget.dropdownItems[index].text),
                        ],
                      ),
                      onChanged: (selectedItem) {
                        setState(() {
                          _selectedItem = selectedItem;
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        Divider(),
      ],
    );
  }
}
class CreditCardForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRoundedTextField('Card Number'),
            SizedBox(height: 16.0),
            _buildRoundedTextField('Card Holder Name'),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: _buildRoundedTextField('Expiration Date'),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: _buildRoundedTextField('CVV'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedTextField(String hintText) {
    return Container(
      height: 50.0,  // Adjust the height as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade200,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
