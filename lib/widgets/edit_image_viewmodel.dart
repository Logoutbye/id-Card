import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_editor_tutorial/models/text_info.dart';
import 'package:image_editor_tutorial/screens/edit_image_screen.dart';
import 'package:image_editor_tutorial/utils/utils.dart';
import 'package:image_editor_tutorial/widgets/default_button.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

abstract class EditImageViewModel extends State<EditImageScreen> {
  TextEditingController textNameEditingController = TextEditingController();
  TextEditingController textFatherNameEditingController =
      TextEditingController();
  TextEditingController textGenderEditingController = TextEditingController();
  TextEditingController textCountryOfStayEditingController =
      TextEditingController();
  TextEditingController textIdNoEditingController = TextEditingController();
  TextEditingController textDOBirthEditingController = TextEditingController();
  TextEditingController textDOIssueEditingController = TextEditingController();
  TextEditingController textDOExpiryEditingController = TextEditingController();

  TextEditingController creatorText = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();

  List<TextInfo> texts = [];
  int currentIndex = 0;

  saveToGallery(BuildContext context) {
    if (texts.isNotEmpty) {
      screenshotController.capture().then((Uint8List? image) {
        saveImage(image!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Image saved to gallery.'),
          ),
        );
      }).catchError((err) => print(err));
    }
  }

  saveImage(Uint8List bytes) async {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = "screenshot_$time";
    await requestPermission(Permission.storage);
    await ImageGallerySaver.saveImage(bytes, name: name);
  }

  removeText(BuildContext context) {
    setState(() {
      texts.removeAt(currentIndex);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Deleted',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  setCurrentIndex(BuildContext context, index) {
    setState(() {
      currentIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Selected For Styling',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  changeTextColor(Color color) {
    setState(() {
      texts[currentIndex].color = color;
    });
  }

  increaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize += 2;
    });
  }

  decreaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize -= 2;
    });
  }

  alignLeft() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.left;
    });
  }

  alignCenter() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.center;
    });
  }

  alignRight() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.right;
    });
  }

  boldText() {
    setState(() {
      if (texts[currentIndex].fontWeight == FontWeight.bold) {
        texts[currentIndex].fontWeight = FontWeight.normal;
      } else {
        texts[currentIndex].fontWeight = FontWeight.bold;
      }
    });
  }

  italicText() {
    setState(() {
      if (texts[currentIndex].fontStyle == FontStyle.italic) {
        texts[currentIndex].fontStyle = FontStyle.normal;
      } else {
        texts[currentIndex].fontStyle = FontStyle.italic;
      }
    });
  }

  addLinesToText() {
    setState(() {
      if (texts[currentIndex].text.contains('\n')) {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll('\n', ' ');
      } else {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll(' ', '\n');
      }
    });
  }

  addNameText(BuildContext context) {
    setState(() {
      texts.add(
        TextInfo(
          text: textNameEditingController.text,
          left: 105,
          top: 85,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 15,
          textAlign: TextAlign.left,
        ),
      );
      // Navigator.of(context).pop();
    });
  }
  addFatherNameText(BuildContext context) {
    setState(() {
      texts.add(
        TextInfo(
          text: textFatherNameEditingController.text,
          left: 105,
          top: 135,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 15,
          textAlign: TextAlign.left,
        ),
      );
      // Navigator.of(context).pop();
    });
  }
  addGenderText(BuildContext context) {
    setState(() {
      texts.add(
        TextInfo(
          text: textGenderEditingController.text,
          left: 105,
          top: 167,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          textAlign: TextAlign.left,
        ),
      );
      // Navigator.of(context).pop();
    });
  }  addCountryText(BuildContext context) {
    setState(() {
      texts.add(
        TextInfo(
          text: textCountryOfStayEditingController.text,
          left: 150,
          top: 167,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          textAlign: TextAlign.left,
        ),
      );
      // Navigator.of(context).pop();
    });
  }  addIdNoText(BuildContext context) {
    setState(() {
      texts.add(
        TextInfo(
          text: textIdNoEditingController.text,
          left: 104,
          top: 200,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          textAlign: TextAlign.left,
        ),
      );
      // Navigator.of(context).pop();
    });
  }  addDOBText(BuildContext context) {
    setState(() {
      texts.add(
        TextInfo(
          text: textDOBirthEditingController.text,
          left: 205,
          top: 200,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          textAlign: TextAlign.left,
        ),
      );
      // Navigator.of(context).pop();
    });
  }  addDOIText(BuildContext context) {
    setState(() {
      texts.add(
        TextInfo(
          text: textDOIssueEditingController.text,
           left: 104,
          top: 225,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          textAlign: TextAlign.left,
        ),
      );
      // Navigator.of(context).pop();
    });
  }  addDOEText(BuildContext context) {
    setState(() {
      texts.add(
        TextInfo(
          text: textDOExpiryEditingController.text,
          left: 205,
          top: 225,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          textAlign: TextAlign.left,
        ),
      );
      Navigator.of(context).pop();
    });
  }


  addNewDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Add New ',
        ),
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TextField(
                controller: textNameEditingController,
                // maxLines: 5,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.edit,
                  ),
                  filled: true,
                  hintText: 'Name',
                ),
              ),
              TextField(
                controller: textFatherNameEditingController,
                // maxLines: 5,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.edit,
                  ),
                  filled: true,
                  hintText: 'Father Name',
                ),
              ),
              TextField(
                controller: textGenderEditingController,
                // maxLines: 5,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.edit,
                  ),
                  filled: true,
                  hintText: 'Gender',
                ),
              ),
              TextField(
                controller: textCountryOfStayEditingController,
                // maxLines: 5,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.edit,
                  ),
                  filled: true,
                  hintText: 'Country of Stay',
                ),
              ),
              TextField(
                controller: textIdNoEditingController,
                // maxLines: 5,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.edit,
                  ),
                  filled: true,
                  hintText: 'Identitiy No',
                ),
              ),
              TextField(
                controller: textDOBirthEditingController,
                // maxLines: 5,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.edit,
                  ),
                  filled: true,
                  hintText: 'DOB',
                ),
              ),
              TextField(
                controller: textDOIssueEditingController,
                // maxLines: 5,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.edit,
                  ),
                  filled: true,
                  hintText: 'DOI',
                ),
              ),
              TextField(
                controller: textDOExpiryEditingController,
                // maxLines: 5,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.edit,
                  ),
                  filled: true,
                  hintText: 'DOE',
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          DefaultButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Back'),
            color: Color.fromARGB(255, 120, 119, 119),
            textColor: Colors.white,
          ),
          DefaultButton(
            onPressed: () => {
              addNameText(context),
              addFatherNameText(context),
              addGenderText(context),
              addCountryText(context),
              addIdNoText(context),
              addDOBText(context),
              addDOIText(context),
              addDOEText(context),
            },
            child: const Text('Add Text'),
            color: Colors.red,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
