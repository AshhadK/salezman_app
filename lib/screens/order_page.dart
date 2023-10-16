import 'package:flutter/material.dart';
import '/constants.dart';
import '/widget/products_class.dart';
import '../../tabs/custom_action_bar.dart';
import '../../widget/custom_btn.dart';
import '../screens/landing_page.dart';
import '../widget/dropdown_widget.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<ProductModel> productModel = [
    ProductModel("Soaps", 23.1, 2819, "6326", false),
    ProductModel("Shampoo", 11.1, 2419, "6426", false),
    ProductModel("ToothPaste", 43.1, 7819, "6226", false),
    ProductModel("Lotions", 13.1, 9719, "8426", false),
    ProductModel("Powder", 21.2, 4219, "1126", false),
    ProductModel("Detergent", 233.0, 3719, "5826", false),
    ProductModel("Moisturizers", 13.3, 1739, "8126", false),
    ProductModel("Sanitizers", 21.5, 4269, "5156", false),
    ProductModel("Tissue Box", 231.0, 1119, "5226", false),
  ];
  List<ProductModel> selectedProducts = <ProductModel>[];
  double price = 0;
  double amount = 0;
  int code = 0;
  String sku = '';

  TextEditingController editingController = TextEditingController();

  var status = "";
  late String dropdownvalue;
  var a = ["SKU :", "Qty :", "Capping :"];

  var c = [
    "Price :",
    "Amount :",
    "Mode :",
  ];
  var mode = ["Credit", "COD"];
  final borderSide = BorderSide(
    color: black,
    width: 1.0,
    style: BorderStyle.solid,
  );
  late final List<String> duplicateItems = List<String>.generate(
      productModel.length, (i) => "${productModel[i].productName}");
  var items = <String>[];

  void initState() {
    items.addAll((duplicateItems));

    super.initState();
  }

  @override
  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];

      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget confirmButton = TextButton(
      child: Text("YES"),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LandingPage()));
      },
    );
    Widget declineButton = TextButton(
      child: Text("NO"),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LandingPage()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert", style: TextStyle(color: Colors.red)),
      content: Text("Do You want to merge? or not"),
      actions: [
        confirmButton,
        declineButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 105 / 2),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 20.0),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "VENDERS’ SHOP NAME",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (var j = 0; j < a.length; j++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (var i = 0; i < 4; i++)
                              Container(
                                  width: i == 0
                                      ? 70
                                      : i == 1
                                          ? 50
                                          : i == 2
                                              ? 70
                                              : (i == 3)
                                                  ? 80
                                                  : 0,
                                  child: (i == 0)
                                      ? Text("${a[j]}")
                                      : (i == 2)
                                          ? Text("${c[j]}")
                                          : (i == 1) && (j == 1)
                                              ? Container(
                                                  height: 20,
                                                  child: TextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: ((value) =>
                                                        setState(() {
                                                          amount = price *
                                                              int.parse(value);
                                                        })),
                                                  ))
                                              : (i == 3)
                                                  ? Container(
                                                      height:
                                                          (j == 2) ? 30 : 20,
                                                      padding: (j == 2)
                                                          ? EdgeInsets.all(0)
                                                          : EdgeInsets.only(
                                                              left: 15.0),
                                                      child: (j == 0)
                                                          ? Text("Rs $price")
                                                          : (j == 1)
                                                              ? Text(
                                                                  "Rs ${amount}")
                                                              : DropdownWidget(
                                                                  dropdownvalue:
                                                                      mode[0],
                                                                  horizontalPadding:
                                                                      5,
                                                                  items: mode,
                                                                  marginTop: 0,
                                                                  width: double
                                                                      .infinity,
                                                                  textSyle: TextStyle(
                                                                      fontSize:
                                                                          12.0),
                                                                ))
                                                  : (i == 1) && (j == 0)
                                                      ? Container(
                                                          height: 20,
                                                          child:
                                                              Text("${code}"))
                                                      : Text("")),
                          ],
                        ),
                    ],
                  ),
                  Container(
                    // margin: EdgeInsets.only(top: 130 / 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          margin: EdgeInsets.only(top: 15.0),
                          width: double.infinity,
                          height: 75.0 / 2,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            onChanged: (value) {
                              filterSearchResults(value);
                            },
                            controller: editingController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: lightseagreen, width: 2.0),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: lightseagreen, width: 2.0),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            border: Border.all(
                              color: black,
                              width: 1,
                            ),
                          ),
                          width: 650.0 / 2,
                          height: 420,
                          margin: EdgeInsets.only(top: 15.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    itemCount: items.length,
                                    itemBuilder: (BuildContext context, index) {
                                      // return item
                                      return Products(
                                          productModel[index].productSKU,
                                          productModel[index].productPrice,
                                          productModel[index].productCode,
                                          productModel[index].isSelected,
                                          items[index],
                                          index);
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                ),
                                border: Border.fromBorderSide(borderSide),
                                color: white),
                            width: 650.0 / 2,
                            height: 60,
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomBtn(
                                    text: "Add",
                                    onPressed: () {
                                      setState(() {
                                        price = 0;
                                      });
                                    },
                                    isLoading: false,
                                    color: grey,
                                    TextStyle: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: black,
                                    ),
                                    width: 180 / 2,
                                  ),
                                  CustomBtn(
                                    text: "Done",
                                    onPressed: () {
                                      showAlertDialog(context);
                                    },
                                    isLoading: false,
                                    color: lightseagreen,
                                    width: 180 / 2,
                                    TextStyle: Constants.btnText,
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Custom_Action_Bar(
            title: 'Order Page',
            hasBackArrow: false,
            newPage: LandingPage(),
          ),
        ],
      )),
    );
  }

  Widget Products(productSKU, double productPrice, int productCode,
      bool isSelected, final productItem, int index) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: lightseagreen,
          child: Text("${index + 1}", style: TextStyle(color: white))),
      title: Text(
        "Product : $productItem",
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Price : Rs $productPrice"),
          Text("Code : $productCode"),
        ],
      ),
      trailing: (selectedProducts.length > 1)
          ? isSelected
              ? Icon(
                  Icons.check_circle,
                  color: lightseagreen,
                )
              : Icon(
                  Icons.check_circle_outline,
                  color: Colors.grey,
                )
          : Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
      onTap: () {
        setState(() {
          productModel[index].isSelected = !(productModel[index].isSelected);

          if (productModel[index].isSelected) {
            price = productModel[index].productPrice;
            sku = productModel[index].productSKU;
            code = productModel[index].productCode;
            amount = price;
            selectedProducts.add(ProductModel(
                productItem, productPrice, productCode, productSKU, true));
            print(selectedProducts.length);
          } else {
            price = 0;
            amount = 0;
            sku = '';
            code = 0;
          }
        });
      },
    );
  }
}
