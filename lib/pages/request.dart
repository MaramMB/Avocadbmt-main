import 'dart:convert';
import 'package:http/http.dart' as http;
// const String loginlink="http://192.168.1.114/Avocadbmt-main/Avocadbmt-main/login.php";
class Crud {
  getRequest(String url) async {
    try {
        var resposce = await http.get(Uri.parse(url));
        if (resposce.statusCode == 200 ) {
          var responsebody = jsonDecode(resposce.body);
          return responsebody;
        } else {
          print("Error ${resposce.statusCode}");
        }
    }
    catch (e) {
          print("Error Catch $e");
    }
  }
  postRequest(String url,Map data) async {
    try {
        var resposce = await http.post(Uri.parse(url),body :data);
        if (resposce.statusCode == 200 ) {
          var responsebody = jsonDecode(resposce.body);
          return responsebody;
        } else {
          print("Error ${resposce.statusCode}");
        }
    }
    catch (e) {
          print("Error Catch $e");
    }
  }
}
