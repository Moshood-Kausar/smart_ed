import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_ed/utils/approutes.dart';
import 'package:smart_ed/utils/texts.dart';
import 'package:smart_ed/widget/appcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  _sendingMails() async {
    var url = Uri.parse("mailto:kausarmoshood@gmail.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: ValueListenableBuilder<Box>(
              valueListenable: Hive.box(infobox).listenable(),
              builder: (context, box, widget) {
                String fname = box.get('fullname', defaultValue: 'null');
                String uname = box.get('username', defaultValue: 'null');
                String email = box.get('email', defaultValue: 'null');
                var initials = fname.split(' ');
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(
                          color: AppColor.primary,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${initials[0][0]}${initials[1][0]}',
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 36,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(uname),
                    Text(fname),
                    Text(
                      email,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 10),
                    ListTile(
                      onTap: () {
                        //Navigator.pushNamed(context, '/testmap');
                      },
                      leading: CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColor.lightblue,
                          child: Icon(
                            Icons.lock,
                            size: 18,
                            color: AppColor.primary,
                          )),
                      title: const Text(
                        'Reset Password',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined,
                          size: 18, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      onTap: _sendingMails,
                      leading: CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColor.lightblue,
                        child: Icon(
                          Icons.call,
                          size: 18,
                          color: AppColor.primary,
                        ),
                      ),
                      title: const Text(
                        'Help and Complaints',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, faqRoute);
                      },
                      leading: CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColor.lightblue,
                        child: Icon(
                          Icons.message,
                          size: 18,
                          color: AppColor.primary,
                        ),
                      ),
                      title: const Text(
                        'FAQs',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 50),
                    ListTile(
                      enabled: true,
                      selected: true,
                      selectedTileColor: const Color(0xffffF1F1),
                      title: const Text(
                        'Log Out',
                        style: TextStyle(
                          color: Color(0xffDA1E28),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.logout,
                        color: Color(0xffDA1E28),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text(
                                'Are you sure you want to Log out?',
                                style: TextStyle(fontSize: 12),
                              ),
                              backgroundColor: const Color(0xffEDF5FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('No',
                                      style: TextStyle(
                                        color: AppColor.primary,
                                      )),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    var box = Hive.box(infobox);

                                    box.clear().then((value) {
                                      Navigator.pushReplacementNamed(
                                          context, loginRoute);
                                    });
                                  },
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(
                                      color: Color(0xffDA1E28),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
