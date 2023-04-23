import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  void _launchPhone() async {
    const phoneNumber = 255687689731;
    final phoneUri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
  // Function to launch email client
  void _launchEmail() async {
    const emailAddress = 'mnengaally6@gmail.com';
    if (await launcher.canLaunchUrl(Uri.parse('mailto:$emailAddress'))) {
      await launcher.launchUrl(Uri.parse('mailto:$emailAddress'));
    } else {
      throw 'Could not launch $emailAddress';
    }
  }

  // Function to launch location in maps
  void _launchLocation() async {
    const location = 'Dit';
    final locationUrl = Uri.parse(
        'https://www.google.com/maps/place/DIT+(Dar+es+salaam+Institute+of+Technology)+Main+gate/@-6.8153183,39.2795179,21z/data=!4m9!1m2!2m1!1sgoogle+map!3m5!1s0x185c4bc3f001d7bd:0x5c01d4f0d0d1f4c1!8m2!3d-6.8153079!4d39.2795716!16s%2Fg%2F11h__vvht_=$location');
    if (await launcher.canLaunchUrl(locationUrl)) {
      await launcher.launchUrl(locationUrl);
    } else {
      throw 'Could not launch location';
    }
  }

  // Function to launch Instagram
  void _launchInstagram() async {
    const instagramUrl = 'https://www.instagram.com';
    if (await launcher.canLaunchUrl(instagramUrl as Uri)) {
      await launcher.launchUrl(instagramUrl as Uri);
    } else {
      throw 'Could not launch $instagramUrl';
    }
  }

  // Function to launch Facebook
  void _launchFacebook() async {
    const facebookUrl = 'https://www.facebook.com';
    if (await launcher.canLaunchUrl(facebookUrl as Uri)) {
      await launcher.launchUrl(facebookUrl as Uri);
    } else {
      throw 'Could not launch $facebookUrl';
    }
  }

  // Function to launch Discord
  void _launchDiscord() async {
    const discordUrl = 'https://www.discord.com';
    if (await launcher.canLaunchUrl(discordUrl as Uri)) {
      await launcher.launchUrl(discordUrl as Uri);
    } else {
      throw 'Could not launch $discordUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Phone button
            ElevatedButton.icon(
              onPressed: _launchPhone,
              icon: const Icon(Icons.phone),
              label: const Text('Call'),
            ),

            // Email button
            ElevatedButton.icon(
              onPressed: _launchEmail,
              icon: const Icon(Icons.email),
              label: const Text('Email'),
            ),

            // Location button
            ElevatedButton.icon(
              onPressed: _launchLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Location'),
            ),

            // Instagram button
            ElevatedButton.icon(
              onPressed: _launchInstagram,
              icon: const Icon(Icons.square),
              label: const Text('Instagram'),
            ),

            // Facebook button
            ElevatedButton.icon(
              onPressed: _launchFacebook,
              icon: const Icon(Icons.facebook),
              label: const Text('Facebook'),
            ),

            // Discord button
            ElevatedButton.icon(
              onPressed: _launchDiscord,
              icon: const Icon(Icons.discord),
              label: const Text('Discord'),
            ),
          ],
        ),
      ),
    );
  }
}
