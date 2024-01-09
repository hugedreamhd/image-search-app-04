import 'package:flutter/material.dart';
import 'package:image_search_app_04/data/model/image_item.dart';
import 'package:image_search_app_04/data/repository/image_item_repository.dart';
import 'package:image_search_app_04/ui/widget/image_item_widget.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextEditingController = TextEditingController();

  final repository = PixabayImageItemRepository();

  List<ImageItem> imageItems = [];
  bool isLoading = true;

  Future<void> searchImage(String query) async {
    setState(() async {
      isLoading = true;
    });

    imageItems = await repository.getImageItems(query);

    setState(() async {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: searchTextEditingController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 3,
                    color: Color(0xFF4FB6b2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 3,
                    color: Color(0xFF4FB6b2),
                  ),
                ),
                hintText: '입력하세요',
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Color(0xFF4FB6b2),
                  ),
                  onPressed: () {
                    searchImage(searchTextEditingController.text);
                  },
                ),
              ),
            ),
            SizedBox(height: 24),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: GridView.builder(
                      itemCount: imageItems.length,
                      itemBuilder: (context, index) {
                        final imageItem = imageItems[index];
                        return ImageItemWidget(
                          imageItem: imageItem,
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 32,
                        mainAxisSpacing: 32,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
