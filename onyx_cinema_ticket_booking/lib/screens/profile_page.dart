import 'package:flutter/material.dart';
import '../styles/color.dart';
import 'registration_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: const Text('My Profile'),
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
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundColor: MyColors.white,
                      child: Text(
                        'HA',
                        style: TextStyle(
                            fontSize: 48.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Haikal Akif',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4.0),
                          const Text(
                            'haikalakif17@gmail.com',
                            style: TextStyle(
                                fontSize: 14.0, color: MyColors.black),
                          ),
                          const SizedBox(height: 4.0),
                          const Text(
                            '100002973',
                            style: TextStyle(
                                fontSize: 14.0, color: MyColors.black),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.primary,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('Edit Profile',
                                    style: TextStyle(fontSize: 12.0)),
                              ),
                              const SizedBox(width: 16.0),
                              ElevatedButton(
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
              'V 1.0.1A',
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
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPage()),
                            );
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
