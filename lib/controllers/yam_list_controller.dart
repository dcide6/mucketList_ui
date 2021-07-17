import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mklistui/models/yam_list_model.dart';

class YamListController extends GetxController {
  var mylist = List<YamListModel>().obs;

  Future<List<YamListModel>> getAllYamList() async {
    String userToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzMzM4MndhdGVyQGdtYWlsLmNvbSIsInJvbGUiOiJVU0VSIiwidHlwZSI6ImFjY2VzcyIsImV4cCI6MTYyNjU0MDA3Mn0.jHsAE5wKsLODdwluJIrWSl99J4M5EaTNNXePvi6F4nE';
    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['x-auth-token'] = userToken;
    String url =
        'http://yam-stack.com/api/v1/yam?page=0&size=50&direction=DESC';
    var response = await dio.post(
      url,
      data: {"mode": 0},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var contentData = response.data["content"];
      for (var item in contentData) {
        mylist.add(YamListModel.fromJson(item));
      }
      return mylist;
    }
  }

  @override
  void onInit() {
    getAllYamList();
    super.onInit();
  }
}
