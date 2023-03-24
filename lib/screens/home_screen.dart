import 'package:flutter/material.dart';
import 'package:image_editor_tutorial/screens/edit_image_screen.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Pick Background Picture"),
        centerTitle: true,
        backgroundColor: Color(0xffE8E2E2),
        foregroundColor: Color(0xFF5D3891),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(splashColor: Color(0xFF5D3891),
              onTap: () async {
                
                XFile? file = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (file != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditImageScreen(
                        selectedImage: file.path,
                      ),
                    ),
                  );
                }
              },
              child: Container(
                
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: Color(0xffE8E2E2),
                    

                    // border: Border.all(color: Colors.grey)
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload_file,
                        size: 50,
                        color: Color(0xFF5D3891),
                      ),
                      SizedBox(height: 20,),
                      Text("Pick",style: TextStyle(fontSize:22,color: Color(0xFF5D3891),fontWeight: FontWeight.bold),)
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
