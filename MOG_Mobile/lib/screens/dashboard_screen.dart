import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색 #ffffff로 설정
      body: ListView(
        children: [
          const SizedBox(height: 16),
          // 대시보드 제목
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
              '대시보드',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),

          // 장애 정보 섹션
          _buildIssueSection(),

          // 구분선 - 좌측 여백 28px 추가
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Divider(thickness: 1, color: Color(0xFFE9EBEE)),
          ),

          const SizedBox(height: 30),

          // 현재 충전기 상태 섹션
          _buildChargerStatusSection(),

          const SizedBox(height: 30),

          // 구분선
          const Divider(thickness: 15, color: Color(0xFFF2F4F6)),

          // 관련 통계 섹션
          _buildStatisticsSection(),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // 장애 정보 섹션
  Widget _buildIssueSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 장애 정보 항목들
          _buildInfoItem('금일 장애 접수', '4건'),
          const SizedBox(height: 16),
          _buildInfoItem('현재 처리중인 장애', '6건'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // 충전기 상태 섹션
  Widget _buildChargerStatusSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '현재 충전기 상태',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // 충전기 상태 항목들
          _buildChargerStatusItem(
            icon: Icons.ev_station,
            label: '총 충전기 수',
            count: '496 대',
            backgroundColor: const Color(0xFF7A8CA1),
            iconColor: const Color(0xFFF5F5F5),
          ),
          const SizedBox(height: 16),
          _buildChargerStatusItem(
            icon: Icons.hourglass_empty,
            label: '충전 대기중',
            count: '465 대',
            backgroundColor: const Color(0xFFDCE5F7),
            iconColor: const Color(0xFF2C61D1),
          ),
          const SizedBox(height: 16),
          _buildChargerStatusItem(
            icon: Icons.bolt,
            label: '충전중',
            count: '31 대',
            backgroundColor: const Color(0xFFD4F8E2),
            iconColor: const Color(0xFF31D36C),
          ),
        ],
      ),
    );
  }

  // 통계 섹션
  Widget _buildStatisticsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '관련 통계',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // 통계 항목들
              _buildStatisticsItem(
                icon: Icons.speed,
                label: '평균 가동률',
                value: '78.5%',
                backgroundColor: const Color(0xFFE8EEF4),
                iconColor: const Color(0xFF5C7599),
              ),
              const SizedBox(height: 16),
              _buildStatisticsItem(
                icon: Icons.eco,
                label: '탄소 절감량',
                value: '42.8',
                subValue: 'tons CO2',
                backgroundColor: const Color(0xFFE6F7EC),
                iconColor: const Color(0xFF4CAF50),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 정보 항목 위젯 (장애 정보용)
  Widget _buildInfoItem(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // 충전기 상태 항목 위젯
  Widget _buildChargerStatusItem({
    required IconData icon,
    required String label,
    required String count,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return Row(
      children: [
        // 아이콘 원형 배경
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(width: 16),
        // 텍스트 정보
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
        // 수치를 사각형 안에 표시
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            count,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: iconColor,
            ),
          ),
        ),
      ],
    );
  }

  // 통계 항목 위젯
  Widget _buildStatisticsItem({
    required IconData icon,
    required String label,
    required String value,
    String? subValue,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return Row(
      children: [
        // 아이콘 원형 배경
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(width: 16),
        // 텍스트 정보
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
        // 수치
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            if (subValue != null)
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  subValue,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
