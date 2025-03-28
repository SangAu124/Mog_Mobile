import 'package:flutter/material.dart';

class ChargerSelectionScreen extends StatelessWidget {
  final String selectedStation;
  final Function(String) onChargerSelected;
  final VoidCallback onBackPressed;

  const ChargerSelectionScreen({
    super.key,
    required this.selectedStation,
    required this.onChargerSelected,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    // 샘플 충전기 목록
    final chargers = ['1번 충전기', '2번 충전기', '3번 충전기'];

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
          scrolledUnderElevation: 0, // 샘플 충전기 목록 elevation 값 제거
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '정보를 보고싶은\n충전기를 선택해주세요',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    selectedStation,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: chargers.length,
                  itemBuilder: (context, index) {
                    final charger = chargers[index];
                    return _ChargerListItem(
                      title: charger,
                      onTap: () => onChargerSelected(charger),
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

class _ChargerListItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _ChargerListItem({required this.title, required this.onTap});

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
