import 'package:flutter/material.dart';
import 'package:smart_ed/core/models/scholarship_model.dart';
import 'package:smart_ed/core/services/base_api.dart';

class BlogService extends ChangeNotifier {
  bool isLoading = false;
  List<Articles>? articles;

  startloading() {
    isLoading = true;
    notifyListeners();
  }

  stoploading() {
    isLoading = false;
    notifyListeners();
  }

  scholarshipApi(BuildContext context) {
    startloading();
    String sort = 'relevancy', query = 'scholarship';
    String apikey = '7c760c888117450f9ac628d1e86a7517';

    getRequest(
      url: 'https://newsapi.org/v2/',
      baseUrl:
          'https://newsapi.org/v2/everything?sortBy=$sort&apiKey=$apikey&searchIn=content&q=$query',
      onResponse: (response) {
        ScholarshipModel data = ScholarshipModel.fromJson(response.data);
        stoploading();
        if (data.status!.isNotEmpty) {
          articles = data.articles;
          notifyListeners();
        } else {
          articles = [];
          notifyListeners();
        }
      },
      onError: (resp, {error}) {
        stoploading();
        // show snackbar or toast
      },
    );
  }
}
