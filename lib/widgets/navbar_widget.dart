import 'package:flutter/material.dart';
import 'package:restaurant_assignment/widgets/contact_details_widget.dart';
import 'package:restaurant_assignment/widgets/reviews_widget.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text(
              "Additional Information",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text('Contact Details'),
            onTap: () {
              showDialog(
                barrierDismissible: true,
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Colors.white,
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: const ContactDetailsWidget(),
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.reviews),
            title: const Text('Reviews'),
            onTap: () {
              showDialog(
                barrierDismissible: true,
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Colors.white,
                    child: Container(
                      height: 426,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: const ReviewsWidget(),
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: const Text('PDF Menu'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
