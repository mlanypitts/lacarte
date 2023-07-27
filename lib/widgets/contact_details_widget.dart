import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/contact_details_model.dart';

class ContactDetailsWidget extends StatefulWidget {
  const ContactDetailsWidget({super.key});

  @override
  _ContactDetailsWidgetState createState() => _ContactDetailsWidgetState();
}

class _ContactDetailsWidgetState extends State<ContactDetailsWidget> {
  Data contactData = Data(
      name: "Hello World",
      phoneNumber: "+230 51234678",
      emailAddress: "helloworld@cuisto.com");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 360,
          height: 140,
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  width: 72,
                  height: 72,
                  child: const Center(
                    child:
                        Icon(Icons.person_pin, color: Colors.white70, size: 52),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contactData.name,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        contactData.phoneNumber,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        contactData.emailAddress,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 360,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              children: [
                SizedBox(
                  height: 32,
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white54,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26))),
                    onPressed: () async {
                      Uri message = Uri.parse('sms:+230 51234678');
                      if (await launchUrl(message)) {}
                    },
                    child: const Text(
                      'Ecrire',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 28),
                SizedBox(
                  height: 32,
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26))),
                    onPressed: () async {
                      Uri phoneNumber = Uri.parse('tel:+230 51234678');
                      if (await launchUrl(phoneNumber)) {}
                    },
                    child: const Text(
                      'Appeler',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
