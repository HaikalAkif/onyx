import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../styles/color.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username = 'iKool';
  final String _email = 'haikalakif17@gmail.com';
  final String _userId = '100002973';
  String _imagePath = '';

  void _editProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 48.0,
                    backgroundColor: MyColors.white,
                    backgroundImage: _imagePath.isNotEmpty
                        ? FileImage(File(_imagePath))
                        : null,
                    child: _imagePath.isEmpty
                        ? const Text(
                            'HA',
                            style: TextStyle(
                              fontSize: 48.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _username = value;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  print('New Username: $_username');
                  print('New Image Path: $_imagePath');
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: MyColors.primary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 5.0,
              color: MyColors.second,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: _editProfile,
                      child: CircleAvatar(
                        radius: 48.0,
                        backgroundColor: MyColors.white,
                        backgroundImage: _imagePath.isNotEmpty
                            ? FileImage(File(_imagePath))
                            : null,
                        child: _imagePath.isEmpty
                            ? const Text(
                                'HA',
                                style: TextStyle(
                                  fontSize: 48.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _username,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            _email,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: MyColors.black,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            _userId,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: MyColors.black,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _editProfile,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: MyColors.primary,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text(
                                    'Edit Profile',
                                    style: TextStyle(fontSize: 12.0),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: MyColors.primary,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text(
                                    'Settings',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.second),
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'General',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: MyColors.white),
                  ),
                  const Divider(
                    color: MyColors.white,
                    thickness: 1.0,
                  ),
                  ListTile(
                    title: const Text(
                      'FAQ',
                      style: TextStyle(color: MyColors.white),
                    ),
                    onTap: () {},
                    trailing: const Icon(
                      Icons.arrow_forward,
                      color: MyColors.white,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Contact Us',
                      style: TextStyle(color: MyColors.white),
                    ),
                    onTap: () {},
                    trailing: const Icon(
                      Icons.arrow_forward,
                      color: MyColors.white,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Terms & Conditions',
                      style: TextStyle(color: MyColors.white),
                    ),
                    onTap: () {},
                    trailing: const Icon(
                      Icons.arrow_forward,
                      color: MyColors.white,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Privacy Policy',
                      style: TextStyle(color: MyColors.white),
                    ),
                    onTap: () {},
                    trailing: const Icon(
                      Icons.arrow_forward,
                      color: MyColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.second),
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'For More Values',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: MyColors.white),
                  ),
                  const Divider(
                    color: MyColors.white,
                    thickness: 1.0,
                  ),
                  ListTile(
                    title: const Text(
                      'My Rewards',
                      style: TextStyle(color: MyColors.white),
                    ),
                    onTap: () {},
                    trailing: const Icon(
                      Icons.arrow_forward,
                      color: MyColors.white,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Rewards Centre',
                      style: TextStyle(color: MyColors.white),
                    ),
                    onTap: () {},
                    trailing: const Icon(
                      Icons.arrow_forward,
                      color: MyColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'V 1.0.9A',
              style: TextStyle(color: MyColors.white),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Log Out'),
                      content: const Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                          },
                          child: const Text(
                            'Log Out',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: MyColors.white,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
