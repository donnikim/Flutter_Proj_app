import 'package:app_kiosk/widgets/bottom_nav_widget.dart';
import 'package:app_kiosk/widgets/cart_fab_widget.dart';
import 'package:app_kiosk/widgets/main_drawer_widget.dart';
import 'package:app_kiosk/widgets/menu_dialog_widget.dart';
import 'package:app_kiosk/widgets/menu_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/product_view_model.dart';
import '../widgets/product_item_widget.dart';
import 'product_detail_screen.dart';
import '../widgets/category_selector_widget.dart'; // 카테고리 버튼 위젯 import

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    /*
      context.watch<T>() => 값 가져오기 +값 변경 시 자동 rebuild
      context.read<T>() => 값 가져오기만 하고, 변경 감지 안함
      context.select<T>() => 특정 필드만 감지해서 성능 최적화
    */

    //현재 productViewMode 감지해서 변경 시 자동 리빌드
    final viewModel = context.watch<ProductViewModel>();

    // 필터링된 상품만 사용
    final products = viewModel.filteredProducts;
    return Scaffold(
      appBar: AppBar(title: const Text('Donni')),
      // Appbar 왼쪽 상단에 메뉴
      drawer: const MainDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CategorySelectorWidget(), // 카테고리 버튼 추가
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: products.length,
                itemBuilder:
                    (_, index) => ProductItemWidget(
                      product: products[index],
                      onTap: () {
                        // onTap 지정한 widget 어디든지 누르면 이벤트 동작
                        /*
                        1. 화면이 이동됨
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                              (_) => ProductDetailScreen(
                                productId: products[index].id,
                            ),
                          ),
                        ); */
                        /*
                        2. 밑에서 올라오는 모달창
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder:
                              (_) => MenuModalWidget(
                                menuName: products[index].name,
                                price: products[index].price,
                              ),
                        );
                        */
                        // 3.가운데에서 뜨는 알림창
                        showDialog(
                          context: context, 
                          builder: (_)=>MenuDialogWidget(
                            menuName: products[index].name, 
                            price: products[index].price,
                            product: products[index],
                          ),
                        );
                      },
                    ),
              ),
            ),
          ],
        ),
      ),
      // 여기 추가! 우측 하단 장바구니 버튼
      floatingActionButton: const CartFabWidget(),
      // 하단 네비게이션 버튼
      bottomNavigationBar: BottomNavWidget(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
