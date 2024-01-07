import 'package:buzz_me/components/route_search.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
                 child: Text(
                'Enter route details',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 26,
                    fontFamily: 'Roboto-Medium',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: RouteSearch(),
                ),
              ),
            ],
          ),
      ),
    );
  }
}