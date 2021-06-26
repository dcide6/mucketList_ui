import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mklistui/models/camera_state.dart';
import 'package:mklistui/models/gallery_state.dart';
import 'package:mklistui/widgets/my_gallery.dart';
import 'package:mklistui/widgets/take_photo.dart';

class CameraScreen extends StatefulWidget {
  final CameraState _cameraState = Get.put(CameraState());
  final GalleryState _galleryState = Get.put(GalleryState());

  @override
  _CameraScreenState createState() {
    _cameraState.getReadyToTakePhoto();
    _galleryState.initController();
    return _CameraScreenState();
  }
}

class _CameraScreenState extends State<CameraScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  String _title = "사진 첨부";

  @override
  void dispose() {
    _pageController.dispose();
    widget._galleryState.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          MyGallery(),
          TakePhoto(),
        ],
        onPageChanged: (index) {
          print('pageChanged = $index');
          setState(() {
            _currentIndex = index;
            switch (_currentIndex) {
              case 0:
                _title = "갤러리";
                break;
              case 1:
                _title = "촬영";
                break;
            }
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_button_checked),
            title: Text('갤러리'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_button_checked),
            title: Text('촬영'),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTabbed,
      ),
    );
  }

  void _onItemTabbed(index) {
    print(index);
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(_currentIndex,
          duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
    });
  }
}
