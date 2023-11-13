import 'package:flutter/material.dart';
import 'package:google_app/widgets/search_tabs.dart';

import '../colors.dart';
import '../services/api_service.dart';
import '../widgets/search_footer.dart';
import '../widgets/search_header.dart';
import '../widgets/search_result_component.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Web header
            const SearchHeader(),
            // Tabs for news image etc
            const Padding(
              padding: EdgeInsets.only(left: 150.0),
              child: SearchTabs(),
            ),
            const Divider(
              height: 0,
              thickness: 1,
            ),
            // Search results
            FutureBuilder(
                future: ApiService().fetchData(queryTerm: 'Rivaan'),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 150, top: 12),
                        child: Text(
                          'About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']}) seconds',
                          style: const TextStyle(fontSize: 15, color: Color(0xFF70757a)),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?['items'].length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 150,
                                top: 10,
                              ),
                              child: SearchResultComponent(
                                link: snapshot.data?['items'][index]['formattedUrl'],
                                linkToGo: snapshot.data?['items'][index]['link'],
                                text: snapshot.data?['items'][index]['title'],
                                description: snapshot.data?['items'][index]['snippet'],
                              ),
                            );
                          }),
                    ],
                  );
                }),
            // Pagination buttons
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "< Prev",
                      style: TextStyle(fontSize: 15, color: blueColor),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Next >",
                      style: TextStyle(fontSize: 15, color: blueColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SearchFooter()
          ],
        ),
      ),
    );
  }
}
