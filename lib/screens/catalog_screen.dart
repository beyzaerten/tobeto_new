import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/catalog/catalog_bloc.dart';
import 'package:tobeto_new/blocs/catalog/catalog_event.dart';
import 'package:tobeto_new/blocs/catalog/catalog_state.dart';
import 'package:tobeto_new/blocs/education/education_state.dart';
import 'package:tobeto_new/widgets/catalog_widget/catalog_videos.dart';
import 'package:tobeto_new/widgets/footer.dart';
import 'package:tobeto_new/widgets/tobeto_drawer.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  // bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  void search() {
    print("Ara : $_searchController");
  }

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AspectRatio(
          aspectRatio: 18 / 2,
          child: isDarkMode
              ? Image.asset(
                  "lib/assets/tobeto-logo-dark.png",
                  alignment: Alignment.centerLeft,
                )
              : Image.asset(
                  "lib/assets/tobeto.png",
                  alignment: Alignment.centerLeft,
                ),
        ),
      ),
      endDrawer: TobetoDrawer(),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(children: [
            Container(
              // height: phoneHeight / 3,
              width: phoneWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/edu.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Öğrenmeye başla",
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: phoneWidth / 9,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: phoneHeight / 40,
                    ),
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Eğitim arayın...",
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(10),
                        suffixIcon: IconButton(
                            onPressed: () {
                              search();
                            },
                            icon: Icon(Icons.search)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: phoneHeight / 25,
            ),
            BlocBuilder<CatalogBloc, CatalogState>(builder: (context, state) {
              print("katalog $state");
              if (state is CatalogInitial) {
                print("katalog2 $state");

                context.read<CatalogBloc>().add(FetchCatalogRequested());
              }
              if (state is EducationLoading) {
                print("katalog3 $state");
              }
              if (state is CatalogLoaded) {
                return ListView.builder(
                    shrinkWrap:
                        true, // Bu satırı ekleyerek ListView'ı sarmalayabiliriz.
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.catalogInfo.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CatalogVideos(
                            catalogCard: state.catalogInfo[index],
                          ),
                        ));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
            SizedBox(
              height: phoneHeight / 20,
            ),
            Footer()
          ]),
        ),
      ),
    );
  }
}
