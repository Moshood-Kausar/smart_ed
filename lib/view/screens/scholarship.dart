import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:smart_ed/core/models/scholarship_model.dart';
import 'package:smart_ed/utils/widget/appcolor.dart';
import 'package:smart_ed/utils/widget/webview.dart';
//import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class Scholarship extends StatefulWidget {
  final dynamic data;
  const Scholarship({super.key, this.data});

  @override
  State<Scholarship> createState() => _ScholarshipState();
}

class _ScholarshipState extends State<Scholarship> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        itemCount: widget.data.articles!.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AppWebView(
                    url: "${widget.data.articles![index].url}",
                    title: '${widget.data.articles![index].title}',
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.grey, width: 3.0),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                //border:Border(Border))
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     blurRadius: 12.0,
                //     offset: const Offset(4.0, 5.0),
                //   ),
                // ],
                // border: Border.all(color: Colors.red),
              ),
              child: Column(
                children: [
                  Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    // child: FancyShimmerImage(
                    //   imageUrl: '${widget.data.articles![index].urlToImage}',
                    //   boxFit: BoxFit.cover,
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.data.articles![index].title}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${widget.data.articles![index].description}",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 8),
                        FittedBox(
                          child: Text.rich(
                            TextSpan(
                              text: 'By',
                              children: [
                                TextSpan(
                                  text:
                                      ' ${widget.data.articles![index].author} •',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' ${widget.data.articles![index].source!.name} ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.red,
                                  ),
                                ),
                                TextSpan(
                                    text:
                                        '• ${widget.data.articles![index].publishedAt}'),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class OpenWebsite extends ChromeSafariBrowser {
  @override
  void onOpened() {
    debugPrint("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    debugPrint("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    debugPrint("ChromeSafari browser closed");
  }
}
