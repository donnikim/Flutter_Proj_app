import 'package:flutter/material.dart';

class BottomNavWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    
    // 바텀 네비게이션에 Theme를 랩핑해서 효과제거 
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent
      ), 
      child: BottomNavigationBar(
        
        type: BottomNavigationBarType.fixed, //라벨 항상 표시 + 에니메이션 제거
        enableFeedback: false, // 터치 효과음, 진동 제거
        
        backgroundColor: Colors.white,//하단의 3개 색지정 없으면 메인화면에서 안보임 꼭 지정해주어야 함!! 
        selectedItemColor: Colors.blueAccent,//하단의 3개 색지정 없으면 메인화면에서 안보임 꼭 지정해주어야 함!!
        unselectedItemColor: Colors.grey,//하단의 3개 색지정 없으면 메인화면에서 안보임 꼭 지정해주어야 함!!
        
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '메인'),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: '선불카드'),
          BottomNavigationBarItem(icon: Icon(Icons.local_cafe), label: '커피오더'),
          BottomNavigationBarItem(icon: Icon(Icons.redeem), label: '선물하기'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: '더보기'),
        ],
      ),
    );
  }
}
