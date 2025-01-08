import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio / Riverpod example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            CommonAPIRequestButton(),
            StreamAPIRequestButton(),
            BookingAPIRequestButton(),
          ],
        ),
      ),
    );
  }
}

class CommonAPIRequestButton extends StatelessWidget {
  const CommonAPIRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pushNamed('/common-api-request'),
      child: const Text('Common API request'),
    );
  }
}

class StreamAPIRequestButton extends StatelessWidget {
  const StreamAPIRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pushNamed('/stream-api-request'),
      child: const Text('Stream API request'),
    );
  }
}

class BookingAPIRequestButton extends StatelessWidget {
  const BookingAPIRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pushNamed('/booking-api-request'),
      child: const Text('Booking API request'),
    );
  }
}
