import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ed/core/services/apis/course_api.dart';
import 'package:smart_ed/utils/approutes.dart';
import 'package:smart_ed/widget/appcolor.dart';

class Quiz extends StatefulWidget {
  final dynamic coursecode;
  const Quiz({super.key, this.coursecode});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List selection = [];
  String? question, id;
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseService>(
      builder: (context, snap, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Let\'s practice together',
              style: TextStyle(fontSize: 18),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 86,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                  'You scored ${selection.length}/${snap.quiz[0]['questions'].length}'),
                              const SizedBox(height: 12),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, dashboardRoute);
                                },
                                child: const Text('Go Home'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                  // log('selection: $selection');
                  // selection.clear();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (snap.isLoading && snap.quiz.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snap.quiz.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/empty.png'),
                                const Text('No quiz found'),
                              ],
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: snap.quiz[0]['questions'].length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var data = snap.quiz[0]['questions'];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index]['question_text']),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: snap
                                    .quiz[0]['questions'][index]['answers']
                                    .length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index2) {
                                  var data = snap.quiz[0]['questions'][index]
                                      ['answers'][index2];
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: RadioListTile(
                                          activeColor: AppColor.primary,
                                          title: Text(snap.quiz[0]['questions']
                                                  [index]['answers'][index2]
                                              ['answer_text']),
                                          value: snap.quiz[0]['questions']
                                                  [index]['answers'][index2]
                                              ['answer_text'],
                                          groupValue: question,
                                          onChanged: (value) {
                                            setState(() {
                                              question = value.toString();
                                              id = data['id'];
                                              if (data['is_correct']) {
                                                selection
                                                    .add(data['is_correct']);
                                              }
                                            });
                                          },
                                        ),
                                      ), // data['is_correct'] &&
                                      if (id == data['id'])
                                        data['is_correct'] && id == data['id']
                                            ? Text(
                                                data['is_correct']
                                                    ? "Correct"
                                                    : "Wrong",
                                                style: const TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 14,
                                                ),
                                              )
                                            : Text(
                                                data['is_correct']
                                                    ? "Correct"
                                                    : "Wrong",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                ),
                                              ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CourseService>().quizlist(context, widget.coursecode);
    });
  }
}
