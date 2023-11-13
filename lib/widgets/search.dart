import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_app/colors.dart';

import '../screens/search_screen.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/images/google-logo.png",
            height: size.height * 0.12,
            width: size.width * 0.4,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: size.width > 768 ? size.width * 0.4 : size.width * 0.75,
          child: TextFormField(
            onFieldSubmitted: (query) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchScreen(
                    start: "0",
                    searchQuery: query,
                  ),
                ),
              );
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: searchColor),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/images/search-icon.svg",
                  colorFilter: const ColorFilter.mode(searchColor, BlendMode.srcIn),
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/images/mic-icon.svg",
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
