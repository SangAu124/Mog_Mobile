import 'package:flutter/material.dart';
import 'charger/station_selection_screen.dart';
import 'charger/charger_selection_screen.dart';
import 'charger/charger_detail_screen.dart';

class ChargerScreen extends StatefulWidget {
  const ChargerScreen({super.key});

  @override
  State<ChargerScreen> createState() => _ChargerScreenState();
}

class _ChargerScreenState extends State<ChargerScreen> {
  // 현재 화면 상태 (0: 충전소 선택, 1: 충전기 선택, 2: 충전기 상세 정보)
  int _currentStep = 0;

  // 선택된 충전소 및 충전기 정보
  String? _selectedStation;
  String? _selectedCharger;

  @override
  Widget build(BuildContext context) {
    return _buildCurrentScreen();
  }

  // 현재 단계에 따른 화면 표시
  Widget _buildCurrentScreen() {
    switch (_currentStep) {
      case 0:
        return StationSelectionScreen(
          onStationSelected: (station) {
            setState(() {
              _selectedStation = station;
              _currentStep = 1; // 다음 단계로 이동
            });
          },
        );
      case 1:
        return ChargerSelectionScreen(
          selectedStation: _selectedStation!,
          onChargerSelected: (charger) {
            setState(() {
              _selectedCharger = charger;
              _currentStep = 2; // 다음 단계로 이동
            });
          },
          onBackPressed: () {
            setState(() {
              _currentStep = 0; // 이전 단계로 이동
            });
          },
        );
      case 2:
        return ChargerDetailScreen(
          selectedStation: _selectedStation!,
          selectedCharger: _selectedCharger!,
          onBackPressed: () {
            setState(() {
              _currentStep = 1; // 이전 단계로 이동
            });
          },
        );
      default:
        return const Center(child: Text('오류가 발생했습니다.'));
    }
  }
}
