import 'package:flutter/material.dart';

class StationSelectionScreen extends StatelessWidget {
  final Function(String) onStationSelected;

  const StationSelectionScreen({super.key, required this.onStationSelected});

  @override
  Widget build(BuildContext context) {
    // 샘플 충전소 목록
    final stations = ['김상금 차고지', '김상은 차고지', '김상동 차고지'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                '정보를 보고싶은\n충전소를 선택해주세요',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: stations.length,
                  itemBuilder: (context, index) {
                    final station = stations[index];
                    return _StationListItem(
                      title: station,
                      onTap: () => onStationSelected(station),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StationListItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _StationListItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
