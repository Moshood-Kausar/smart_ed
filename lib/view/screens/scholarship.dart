import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ed/core/services/apis/blog_api.dart';
import 'package:smart_ed/widget/appcolor.dart';
import 'package:smart_ed/widget/webview.dart';

class Scholarship extends StatefulWidget {
  const Scholarship({super.key});

  @override
  State<Scholarship> createState() => _ScholarshipState();
}

class _ScholarshipState extends State<Scholarship> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<BlogService>().scholarshipApi(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<BlogService>(
        builder: (context, snap, child) {
          if (snap.isLoading && snap.articles == null) {
            return const CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: snap.articles!.length,
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
                        url: "${snap.articles![index].url}",
                        title: '${snap.articles![index].title}',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
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
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        // child: FancyShimmerImage(
                        //   imageUrl: '${snap.articles![index].urlToImage}',
                        //   boxFit: BoxFit.cover,
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snap.articles![index].title}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${snap.articles![index].description}",
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
                                          ' ${snap.articles![index].author} •',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          ' ${snap.articles![index].source!.name} ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.red,
                                      ),
                                    ),
                                    TextSpan(
                                        text:
                                            '• ${snap.articles![index].publishedAt}'),
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
          );
        },
      ),
    );
  }
}
