import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:smart_ed/core/services/apis/auth_api.dart';
import 'package:smart_ed/core/services/apis/blog_api.dart';
import 'package:smart_ed/core/services/apis/course_api.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AuthService()),
  ChangeNotifierProvider(create: (_) => BlogService()),
  ChangeNotifierProvider(create: (_) => CourseService()),
];
