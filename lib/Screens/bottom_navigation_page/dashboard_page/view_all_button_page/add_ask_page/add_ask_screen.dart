import 'dart:convert';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/view_all_button_page/my_asks_screen.dart';
import 'package:community_app/Screens/bottom_navigation_page/dashboard_page/view_all_button_page/my_leads_asks_tab_page/my_leads_asks_tab_screen.dart';
import 'package:community_app/models/my_ask_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../../../../components/all_button_const.dart';
import '../../../../../components/app_bar_const.dart';
import '../../../../../components/text_const.dart';
import '../../../../../components/text_field_const.dart';
import '../../../../../utils/app_url.dart';
import '../../../../../utils/color_const.dart';
import '../../../../../utils/image_const.dart';

class AddAskScreen extends StatefulWidget {
  const AddAskScreen({Key? key}) : super(key: key);

  @override
  State<AddAskScreen> createState() => _AddAskScreenState();
}

class _AddAskScreenState extends State<AddAskScreen> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController companyName = TextEditingController();
  TextEditingController businessCategory = TextEditingController();
  TextEditingController description = TextEditingController();

  int selectTextField = -1;

  List<String> _locations = ['Inquiry', 'Urgent', 'In 1 Month', 'In 2 Month', 'In 3 Month'];
  String? _selectedLocation;

  Future<MyAskModel?> addMyAsk(
      String companyName, String businessCategory, description, timeDuration) async {
    try {
      String url = AppUrl.baseUrl + AppUrl.addMyAskApi;
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode({
        "companyName": "$companyName",
        "businessCategory": "$businessCategory",
        "description": "$description",
        "timeDuration": "$timeDuration"
      });
      print("data pass : ${request.body}");
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print("Response: ${response.statusCode}");
        var jsonD = jsonDecode(await response.stream.bytesToString());
        return MyAskModel.fromJson(jsonD);
      } else {
        print("Error");
      }
    } catch (e) {
      print("Error: " + e.toString());
    }
    return null;
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 4), () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyLeadsAsksTabScreen()));
        });
        return AlertDialog(
          icon: Image.asset(
            height: 80,
            width: 80,
            filterQuality: FilterQuality.high,
            AssetImageConst.submitted,
          ),
          title: TextConst(
            text: 'New Ask Added!',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Poppins',
            color: AppColors.appBaseColor,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarConst(
          text: 'Add Ask',
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          icon: Icons.arrow_back_rounded,
          iconColor: Colors.black,
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black.withOpacity(.2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 05,left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextConst(
                        text: 'Tell us your requirement',
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                      TextConst(
                        text: 'So we can find relevant business for you',
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 05,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 165,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black.withOpacity(.2),
                  ),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextConst(
                          text: 'ADD ASK FORM',
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          letterSpacing: 4.0,
                        ),
                        Divider(
                          color: Colors.black.withOpacity(.3),
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selectTextField == 0
                                  ? AppColors.appBaseColor
                                  : Colors.black.withOpacity(.2),
                            ),
                          ),
                          child: TextFieldConst(
                            readOnly: false,
                            controller: companyName,
                            textAlignVertical: TextAlignVertical.bottom,
                            filled: true,
                            onTap: () {
                              setState(() {
                                selectTextField = 0;
                              });
                            },
                            hintText: 'Company Name',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selectTextField == 1
                                  ? AppColors.appBaseColor
                                  : Colors.black.withOpacity(.2),
                            ),
                          ),
                          child: TextFieldConst(
                            readOnly: false,
                            controller: businessCategory,
                            textAlignVertical: TextAlignVertical.bottom,
                            filled: true,
                            onTap: () {
                              setState(() {
                                selectTextField = 1;
                              });
                            },
                            hintText: 'Business Category',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selectTextField == 2
                                  ? AppColors.appBaseColor
                                  : Colors.black.withOpacity(.2),
                            ),
                          ),
                          child: TextFieldConst(
                            readOnly: false,
                            maxLines: 6,
                            controller: description,
                            textAlignVertical: TextAlignVertical.bottom,
                            filled: true,
                            onTap: () {
                              setState(() {
                                selectTextField = 2;
                              });
                            },
                            hintText: 'Description',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 13),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selectTextField == 3
                                  ? AppColors.appBaseColor
                                  : Colors.black.withOpacity(.2),
                            ),
                            color: Colors.grey.shade200,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: DropdownButton(
                              hint: Text('Time Duration'), // Not necessary for Option 1
                              isExpanded: true,
                              iconSize: 35,
                              icon: Icon(Icons.arrow_drop_down_rounded),
                              underline: SizedBox(),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 17,
                              ),
                              value: _selectedLocation,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedLocation = newValue;
                                });
                              },
                              items: _locations.map((location) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    location,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                  value: location,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        AllButtonConst(
                          onPressed: () {
                            if (companyName.text.isNotEmpty &&
                                businessCategory.text.isNotEmpty &&
                                description.text.isNotEmpty &&
                            _selectedLocation!.isNotEmpty) {
                              addMyAsk(companyName.text.toString(),
                                  businessCategory.text.toString(), description.text.toString(), _selectedLocation.toString());
                              _showMyDialog();
                            } else {
                              Fluttertoast.showToast(
                                msg: 'Required All Form Fields',
                                gravity: ToastGravity.BOTTOM,
                                toastLength: Toast.LENGTH_SHORT,
                                backgroundColor: AppColors.appBaseColor,
                                textColor: Colors.black,
                              );
                            }
                          },
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          text: 'SUBMIT',
                          elevation: 0,
                          color: AppColors.appBaseColor,
                          fontSize: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
