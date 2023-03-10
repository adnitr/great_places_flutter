import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/image_input.dart';
import '../widget/location_input.dart';
import '../providers/great_places.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  static const routeName = '/add-place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  var _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add a new place")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ImageInput(_selectImage),
                  SizedBox(
                    height: 15,
                  ),
                  LocationInput()
                ],
              ),
            ),
          )),
          ElevatedButton.icon(
            onPressed: _savePlace,
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            label: Text(
              'Add Place',
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: Theme.of(context).accentColor),
          )
        ],
      ),
    );
  }
}
