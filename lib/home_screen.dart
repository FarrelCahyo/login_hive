// import 'package:books/app/constants/constants.dart';
// import 'package:books/presentation/screens/books_list.dart';
// import 'package:books/presentation/screens/search_screen.dart';
// import 'package:books/presentation/widgets/books/adventure_books.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../widgets/books/anime_books.dart';
// import '../widgets/headline.dart';
// import '../widgets/books/horror.dart';
// import '../widgets/books/novel.dart';

// import '../widgets/books/popular_books.dart';

import 'package:flutter/cupertino.dart';
import 'login_screen.dart';

// Tulisan NOTE itu aslinya code kalian, sesuaikan ya

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final TextEditingController searchController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences logindata;
  late String username;

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async{
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: height / 2,
              child: Stack(
                children: [
                  Container(
                    height: height / 2.5,
                    //height: constraints.maxHeight * 0.8,
                    //width: width,
                    //margin: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      // NOTE: color: AppColors.lightBlue,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                      ),
                    ),
                    child: SafeArea(
                      minimum: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text("Book Store",
                              style: Theme.of(context).textTheme.headline1),
                          const Spacer(),
                          InkWell(
                            onTap: ()
                            //NOTE: nanti hapus karena ini cuma untuk test logout
                            {
                              logindata.setBool('login', true);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginPage()));
                            },
                            // NOTE: HAPUS NULL DAN HILANGIN KOMEN BAWAH INI
                            // {
                            //   showSearch(
                            //       context: context,
                            //       delegate: CustomSearchDelegate());
                            // },
                            child: Container(
                              padding: EdgeInsets.all(12),
                              height: 50,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    width: 1,
                                    color: Colors.black
                                  // NOTE: color: AppColors.black
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Search for Books"),
                                  Icon(Icons.search),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Most Popular',
                                  style: Theme.of(context).textTheme.headline2),
                              InkWell(
                                onTap: () => null,
                                // NOTE: HAPUS NULL DAN HILANGIN KOMEN BAWAH INI
                                // {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //               BookList(name: "Fiction")));
                                // },
                                child: Text(
                                  "See All",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              )
                            ],
                          ),
                          const Spacer(
                            flex: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 5.3,
                      //height: constraints.maxHeight * 0.38,
                      margin: const EdgeInsets.only(left: 16),
                      // NOTE: child: const PopularBooks(),
                    ),
                  ),
                ],
              ),
            ),
            /* NOTE
            Headline(
              category: "Anime",
              showAll: "Anime",
            ),
            SizedBox(
              //color: Colors.grey.shade100,
              height: MediaQuery.of(context).size.height / 3.4,
              child: const AnimeBooks(),
            ),
            Headline(
              category: "Action & Adventure",
              showAll: "Action & Adventure",
            ),
            SizedBox(
              //color: Colors.yellow,
              height: MediaQuery.of(context).size.height / 3.4,
              child: const AdevntureBooks(),
            ),
            Headline(
              category: "Novel",
              showAll: "Novel",
            ),
            SizedBox(
              //color: Colors.yellow,
              height: MediaQuery.of(context).size.height / 3.4,
              child: const NovelBooks(),
            ),
            Headline(
              category: "Horror",
              showAll: "Horror",
            ),
            SizedBox(
              //color: Colors.yellow,
              height: MediaQuery.of(context).size.height / 3.4,
              child: const HorrorBooks(),
            ),
            NOTE */
          ],
        ),
      ),
    );
  }
}
