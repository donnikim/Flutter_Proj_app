import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/product_view_model.dart';

class CategorySelectorWidget extends StatelessWidget {
  const CategorySelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductViewModel>(context);
    final categories = ['전체', '커피', '음료수', '스무디', '기타'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 8.0,
        ),
        child: Row(
          children: categories.map((cat) {
            final isSelected = cat == viewModel.selectedCategory;
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  viewModel.selectCategory(cat);
                },
                child: Text(cat),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
