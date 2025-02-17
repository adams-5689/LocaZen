import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locazen/app_decoration.dart';
import 'package:locazen/views/widgets/amenities_ui.dart';

class CreatPostingScreen extends StatefulWidget {
  const CreatPostingScreen({super.key});

  @override
  State<CreatPostingScreen> createState() => _CreatPostingScreenState();
}

class _CreatPostingScreenState extends State<CreatPostingScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _priceTextEditingController = TextEditingController();
  TextEditingController _descriptionTextEditingController =
      TextEditingController();
  TextEditingController _addressTextEditingController = TextEditingController();
  TextEditingController _cityTextEditingController = TextEditingController();
  TextEditingController _countryTextEditingController = TextEditingController();
  TextEditingController _amenitiesTextEditingController =
      TextEditingController();

  final List<String> residenceTypes = [
    "Detatched House",
    "Villa",
    "Appartement",
    "Condo",
    "Flat",
    "Town house",
    "Studio"
  ];
  String residenceTypeSelected = "";

  Map<String, int>? _beds;
  Map<String, int>? _bathroom;
  List<MemoryImage>? _imagesList;

  _selectImageFromGallery(int index) async {
    var imageFilePickedFromGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFilePickedFromGallery != null) {
      MemoryImage imageFileInByteForme = MemoryImage(
          (File(imageFilePickedFromGallery.path)).readAsBytesSync());
      if (index < 0) {
        _imagesList!.add(imageFileInByteForme);
      } else {
        _imagesList![index] = imageFileInByteForme;
      }
      setState(() {});
    }
  }

  initializeValues() {
    _nameTextEditingController = TextEditingController(text: "");
    _priceTextEditingController = TextEditingController(text: "");
    _descriptionTextEditingController = TextEditingController(text: "");
    _addressTextEditingController = TextEditingController(text: "");
    _cityTextEditingController = TextEditingController(text: "");
    _countryTextEditingController = TextEditingController(text: "");
    _amenitiesTextEditingController = TextEditingController(text: "");
    residenceTypeSelected = residenceTypes.first;

    _beds = {"small": 0, "medium": 0, "large": 0};
    _bathroom = {"full": 0, "half": 0};

    _imagesList = [];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: AppDecoration.gradientBoxDecoration,
        ),
        title: Text(
          "Create / update a listing",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.upload),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(26, 26, 26, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Listing name
                      Padding(
                        padding: EdgeInsets.only(top: 1.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Listing the Name",
                          ),
                          style: TextStyle(fontSize: 25),
                          controller: _nameTextEditingController,
                          validator: (textInput) {
                            if (textInput!.isEmpty) {
                              return "please enter a valid name";
                            }
                            return null;
                          },
                        ),
                      ),

                      //Select Propertiy type
                      Padding(
                        padding: EdgeInsets.only(top: 28),
                        child: DropdownButton(
                          items: residenceTypes.map((item) {
                            return DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ));
                          }).toList(),
                          onChanged: (valueItem) {
                            setState(() {
                              residenceTypeSelected = valueItem.toString();
                            });
                          },
                          isExpanded: true,
                          value: residenceTypeSelected,
                          hint: Text(
                            "Selectionne le type de residence",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),

                      //price / night
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                                child: TextFormField(
                              decoration: InputDecoration(labelText: "Price"),
                              style: TextStyle(fontSize: 25.0),
                              keyboardType: TextInputType.number,
                              controller: _priceTextEditingController,
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return "please enter a valide price";
                                }
                                return null;
                              },
                            )),
                            Padding(
                              padding: EdgeInsets.only(left: 10, bottom: 10),
                              child: Text(
                                "FCFA /Nuit",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      //Description
                      Padding(
                        padding: EdgeInsets.only(top: 21.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: "Description"),
                          style: TextStyle(fontSize: 25.0),
                          controller: _descriptionTextEditingController,
                          validator: (descript) {
                            if (descript!.isEmpty) {
                              return "please enter a description ";
                            }
                            return null;
                          },
                          maxLines: 4,
                          minLines: 2,
                        ),
                      ),

                      //Address
                      Padding(
                        padding: EdgeInsets.only(top: 21.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: "Address"),
                          style: TextStyle(fontSize: 25.0),
                          controller: _addressTextEditingController,
                          validator: (descript) {
                            if (descript!.isEmpty) {
                              return "please enter a valide Address ";
                            }
                            return null;
                          },
                          maxLines: 3,
                          minLines: 1,
                        ),
                      ),

                      //Beds
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Text(
                          "Beds",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 21.0),
                          child: Column(
                            children: [
                              //twin/single bed
                              AmenitiesUi(
                                  type: 'twin/single',
                                  startValue: _beds!['small']!,
                                  decreaseValue: () {
                                    _beds!["small"] = _beds!["small"]! - 1;
                                    if (_beds!["small"]! < 0) {
                                      _beds!["small"] = 0;
                                    }
                                  },
                                  increaseValue: () {
                                    _beds!["small"] = _beds!["small"]! + 1;
                                  }),

                              //double bed
                              AmenitiesUi(
                                  type: "Double",
                                  startValue: _beds!["medium"]!,
                                  decreaseValue: () {
                                    _beds!["medium"] = _beds!["medium"]! - 1;
                                    if (_beds!["medium"]! < 0) {
                                      _beds!["medium"] = 0;
                                    }
                                  },
                                  increaseValue: () {
                                    _beds!["medium"] = _beds!["medium"]! + 1;
                                  }),

                              //Queen king bed
                              AmenitiesUi(
                                  type: "Queen/King",
                                  startValue: _beds!["large"]!,
                                  decreaseValue: () {
                                    _beds!["large"] = _beds!["large"]! - 1;
                                    if (_beds!["large"]! < 0) {
                                      _beds!["large"] = 0;
                                    }
                                  },
                                  increaseValue: () {
                                    _beds!["large"] = _beds!["large"]! + 1;
                                  }),
                            ],
                          )),
                      //bathroom
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Bathroom",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                        child: Column(
                          children: [
                            //full bathroom
                            AmenitiesUi(
                                type: "Full",
                                startValue: _bathroom!["Full"]!,
                                decreaseValue: () {
                                  _bathroom!["Full"] = _bathroom!["Full"]! - 1;
                                  if (_bathroom!["Full"]! < 0) {
                                    _bathroom!["Full"] = 0;
                                  }
                                },
                                increaseValue: () {
                                  _bathroom!["Full"] = _bathroom!["Full"]! + 1;
                                }),

                            //Hald Bathroom
                            AmenitiesUi(
                                type: "Hald",
                                startValue: _bathroom!["Half"]!,
                                decreaseValue: () {
                                  _bathroom!["Half"] = _bathroom!["Half"]! - 1;
                                  if (_bathroom!["Half"]! < 0) {
                                    _bathroom!["Half"] = 0;
                                  }
                                },
                                increaseValue: () {
                                  _bathroom!["Half"] = _bathroom!["Half"]! + 1;
                                }),
                          ],
                        ),
                      ),

                      //Extra amenities
                      Padding(
                        padding: EdgeInsets.only(top: 21.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Amenities , (coma separated)"),
                          style: TextStyle(fontSize: 25.0),
                          controller: _amenitiesTextEditingController,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "please enter a valide amenities";
                            }
                            return null;
                          },
                          maxLines: 3,
                          minLines: 1,
                        ),
                      ),

                      //photos
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Photo",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 25.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: _imagesList!.length + 1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 25,
                            crossAxisSpacing: 25,
                            childAspectRatio: 3 / 2,
                          ),
                          itemBuilder: (context, index) {
                            if (index == _imagesList!.length) {
                              return IconButton(
                                  onPressed: () {
                                    _selectImageFromGallery(-1);
                                  },
                                  icon: Icon(Icons.add));
                            }
                            return MaterialButton(
                              onPressed: () {},
                              child: Image(
                                image: _imagesList![index],
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
