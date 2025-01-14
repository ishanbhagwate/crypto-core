import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({super.key});

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Animate(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Color(0xffbf8964),
                    width: 2.5,
                    style: BorderStyle.solid,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/profile_1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ' John ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  // Text(
                  //   'johndoe@gmail.com',
                  //   style: GoogleFonts.montserrat(
                  //     fontSize: 15,
                  //     color: Colors.white70,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
                ],
              ),
              // Spacer(),
              // InkWell(
              //   onTap: () {},
              //   splashColor: Colors.white10,
              //   borderRadius: BorderRadius.circular(100),
              //   child: Material(
              //     color: Colors.transparent,
              //     child: SizedBox(
              //       height: 40,
              //       width: 40,
              //       child: Stack(
              //         alignment: Alignment.center,
              //         children: [
              //           Positioned(
              //             right: 8,
              //             top: 8,
              //             child: Container(
              //               width: 6,
              //               height: 6,
              //               decoration: BoxDecoration(
              //                 color: Color(0xffbf8964),
              //                 borderRadius: BorderRadius.circular(100),
              //               ),
              //             ),
              //           ),
              //           Icon(
              //             Icons.notifications_none_rounded,
              //             color: Colors.white70,
              //             size: 30,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      )
          .slideY(
            duration: 500.ms,
            begin: -1,
            curve: Curves.easeInOutCubic,
          )
          .fadeIn(
            duration: 400.ms,
          ),
    );
  }
}
