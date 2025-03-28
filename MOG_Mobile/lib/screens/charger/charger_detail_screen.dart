import 'package:flutter/material.dart';

class ChargerDetailScreen extends StatelessWidget {
  final String selectedStation;
  final String selectedCharger;
  final VoidCallback onBackPressed;

  const ChargerDetailScreen({
    super.key,
    required this.selectedStation,
    required this.selectedCharger,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onBackPressed,
          ),
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0, // 스크롤 시에도 elevation 효과 없음
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 충전기 기본 정보 섹션
              _buildBasicInfoSection(),
              const SizedBox(height: 30),

              // 구분선
              Divider(thickness: 15, color: Color(0xFFF2F4F6)),
              const SizedBox(height: 30),

              // 충전기 상태 섹션
              _buildChargerStatusSection(),
              const SizedBox(height: 30),

              // 구분선
              Divider(thickness: 15, color: Color(0xFFF2F4F6)),
              const SizedBox(height: 30),

              // 충전기 정보 섹션
              _buildChargerInfoSection(),
              const SizedBox(height: 30),

              // 구분선
              Divider(thickness: 15, color: Color(0xFFF2F4F6)),
              const SizedBox(height: 30),

              // 예방정비 정보 섹션
              _buildPreventiveMaintenanceSection(),
              const SizedBox(height: 30),

              // 구분선
              Divider(thickness: 15, color: Color(0xFFF2F4F6)),
              const SizedBox(height: 30),

              // FMEA 및 ROI 정보 섹션
              _buildFmeaRoiSection(),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // 충전기 기본 정보 섹션
  Widget _buildBasicInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$selectedStation, \n$selectedCharger 정보',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          // 충전기 정보
          _buildInfoRow('충전기 모델', 'MC-MS240-B-2DD'),
          _buildInfoRow('충전기 용량', '120 kW'),
          _buildInfoRow('충전기 ID', 'MTSANGAU'),
          _buildInfoRow('충전기 번호', '1'),
          _buildInfoRow('충전기 시리얼 번호', '000000'),
          _buildInfoRow('certKey', '1234123412341234'),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '충전기 상태',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '충전기 상태 업데이트: ${DateTime.now().toString().substring(0, 16)}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 충전기 상태
          _buildInfoRow('충전기 상태', '+955,000원', valueColor: Colors.blue),
          _buildInfoRow('충전기 상태', '1,750,000원'),
          _buildInfoRow('충전기 상태', '-795,000원', valueColor: Colors.red),
        ],
      ),
    );
  }

  // 충전기 정보 섹션
  Widget _buildChargerInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('충전기 정보', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // 충전기 정보
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildDataCard('충전 시간', '342hr', Icons.access_time),
              _buildDataCard('충전량', '86kWh', Icons.bolt),
              _buildDataCard('충전량', '50,000kWh', Icons.battery_charging_full),
              _buildDataCard('효율', '78.5%', Icons.pie_chart),
            ],
          ),
        ],
      ),
    );
  }

  // 예방정비 정보 섹션
  Widget _buildPreventiveMaintenanceSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('예방정비 정보', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // 예방정비 정보
          Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                _buildPreventiveMaintenanceItem('예방정비 항목1', 72, Colors.green),
                _buildPreventiveMaintenanceItem('예방정비 항목2', 77, Colors.green),
                _buildPreventiveMaintenanceItem('예방정비 항목3', 81, Colors.orange),
                _buildPreventiveMaintenanceItem('예방정비 항목4', 63, Colors.orange),
                _buildPreventiveMaintenanceItem('예방정비 항목5', 45, Colors.red),
                _buildPreventiveMaintenanceItem('예방정비 항목6', 91, Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // FMEA 및 ROI 정보 섹션
  Widget _buildFmeaRoiSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Row(
        children: [
          _buildCircleIndicator('FMEA', '3', '8', '6'),
          const SizedBox(width: 24),
          _buildROIIndicator('ROI (Return on Investment)', '30%'),
        ],
      ),
    );
  }

  // 충전기 정보
  Widget _buildInfoRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, color: valueColor),
          ),
        ],
      ),
    );
  }

  // 충전기 정보
  Widget _buildDataCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 16),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // 예방정비 정보
  Widget _buildPreventiveMaintenanceItem(
    String title,
    int percentage,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 12)),
              Text(
                '$percentage%',
                style: TextStyle(fontSize: 12, color: color),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ],
      ),
    );
  }

  // FMEA 정보
  Widget _buildCircleIndicator(
    String title,
    String severity,
    String occurrence,
    String detection,
  ) {
    return Expanded(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.check_circle, color: Colors.blue),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    _buildSmallIndicator('심각도', severity),
                    _buildSmallIndicator('발생 빈도', occurrence),
                    _buildSmallIndicator('검출 가능성', detection),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ROI 정보
  Widget _buildSmallIndicator(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  // ROI 정보
  Widget _buildROIIndicator(String title, String value) {
    return Expanded(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.trending_up, color: Colors.green),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
