import 'package:flutter/material.dart';

class RouteSearch extends StatelessWidget {
  const RouteSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.cyan[800]?.withOpacity(0.3),
            border: Border.all(
              color: Colors.cyan[800]?.withOpacity(0.5) ?? Colors.cyan,
              width: 2.5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          width: MediaQuery.of(context).size.width - 75,
          height: 220.0,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 5),
                    child: Icon(
                      color: Colors.black,
                      Icons.fmd_good_outlined,
                      size: 22.0,
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      width: 350,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                            labelText: 'From',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 14),
                    child: Icon(
                      Icons.lens_rounded,
                      size: 4,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 14),
                    child: Icon(
                      Icons.lens_rounded,
                      size: 4,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 14),
                    child: Icon(
                      Icons.lens_rounded,
                      size: 4,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.fmd_good_outlined,
                      color: Colors.black,
                      size: 22.0,
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      width: 350,
                      child: Padding(
                        padding: EdgeInsets.only(left: 18, right: 18),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                            labelText: 'To',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}