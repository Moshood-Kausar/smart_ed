import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:smart_ed/core/models/scholarship_model.dart';

class ApiCall {
  final String _nointernet = "No internet connection";
  final String _timeMsg = "Request timeout, connect to a better network";
  final String msg = "An error occured: ";
  static const String apiKey = "7c760c888117450f9ac628d1e86a7517";
  String scholarshipUrl =
      "https://newsapi.org/v2/everything?sortBy=relevancy&apiKey=7c760c888117450f9ac628d1e86a7517&searchIn=content&q=scholarship";

  Future<ScholarshipModel> scholarshipApi() async {
    try {
      final response = await http.get(Uri.parse(scholarshipUrl)).timeout(
            const Duration(seconds: 60),
          );
      if (response.statusCode == 200) {
        var convert = json.decode(response.body);
        if (convert.toString().isNotEmpty && response.statusCode == 200) {
          ScholarshipModel scholarshipModel =
              ScholarshipModel.fromJson(convert);

          return scholarshipModel;
        }
        return ScholarshipModel.fromJson(jsonDecode(response.body));
      } else {
        return ScholarshipModel(status: "Failed");
      }
    } on SocketException catch (_) {
      return ScholarshipModel(status: "Failed");
    } on TimeoutException catch (_) {
      return ScholarshipModel(status: "Failed");
    } catch (e) {
      return ScholarshipModel(
        status: "Failed",
      );
    }
  }
}
