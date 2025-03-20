import 'package:flutter/material.dart';

class MenuModalWidget extends StatelessWidget {
  final String menuName;
  final int price;

  const MenuModalWidget({
    super.key,
    required this.menuName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🔹 동그란 아이콘
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue.shade100,
            child: const Icon(Icons.local_cafe, size: 50, color: Colors.brown),
          ),
          const SizedBox(height: 16),

          // 🔹 메뉴명 + 가격
          Text(menuName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('₩$price', style: const TextStyle(fontSize: 18, color: Colors.grey)),

          const SizedBox(height: 20),

          // 🔹 주문/선물 버튼 Row
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // 주문 로직
                  },
                  child: const Text('주문하기'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // 선물 로직
                  },
                  child: const Text('선물하기'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 🔹 닫기 버튼
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('닫기'),
          ),
        ],
      ),
    );
  }
}
