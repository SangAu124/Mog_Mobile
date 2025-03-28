import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_screen.dart';
import 'dashboard_screen.dart';
import 'monitoring_screen.dart';
import 'charger_screen.dart';
import 'station_screen.dart';
import 'simple_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // 각 탭에 해당하는 화면 위젯
  static final List<Widget> _widgetOptions = <Widget>[
    // 대시보드 화면
    const DashboardScreen(),
    // 모니터링 화면
    const MonitoringScreen(),
    // 충전기 화면
    const ChargerScreen(),
    // 충전소 화면
    const StationScreen(),
    // 간편장애접수 화면
    const SimpleScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false, // 기본 뒤로가기 버튼 제거
        titleSpacing: 0, // 제목과 뒤로가기 버튼 사이의 간격 제거
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0, // 스크롤 시 elevation 제거
        elevation: 0, // 그림자 제거
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28.0,
          ), // 양쪽 가장자리에서 28px 떨어지게 수정
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 왼쪽 MOG 로고
              SvgPicture.asset('assets/images/mog_logo.svg', height: 30),
              // 오른쪽 햄버거 메뉴 아이콘
              GestureDetector(
                onTap: () {
                  // 메뉴 열기 구현
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                child: SvgPicture.asset(
                  'assets/images/quill_hamburger.svg',
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: const [SizedBox()], // endDrawer 우측에 빈공간 추가
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            // 헤더 부분
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF1E4889)),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/mog_logo.svg',
                  height: 40,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            // 빈 공간
            const Spacer(),
            // 로그아웃 버튼
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFF1E4889)),
              title: const Text('로그아웃'),
              onTap: () {
                // 로그아웃 구현
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
            ),
            // 회원탈퇴 버튼
            ListTile(
              leading: const Icon(Icons.person_remove, color: Colors.red),
              title: const Text('회원탈퇴', style: TextStyle(color: Colors.red)),
              onTap: () {
                // 회원탈퇴 구현
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('회원탈퇴'),
                      content: const Text('정말 회원탈퇴 하시겠습니까?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('취소'),
                        ),
                        TextButton(
                          onPressed: () {
                            // 회원탈퇴 구현
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text(
                            '탈퇴',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/material-symbols_dashboard-outline-rounded.svg',
              height: 24,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 0 ? const Color(0xFF1E4889) : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/material-symbols_dashboard-rounded.svg',
              height: 24,
              colorFilter: const ColorFilter.mode(
                Color(0xFF1E4889),
                BlendMode.srcIn,
              ),
            ),
            label: '대시보드',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/material-symbols_monitor-outline.svg',
              height: 24,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 1 ? const Color(0xFF1E4889) : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/material-symbols_monitor.svg',
              height: 24,
              colorFilter: const ColorFilter.mode(
                Color(0xFF1E4889),
                BlendMode.srcIn,
              ),
            ),
            label: '이력조회',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/ic_outline-ev-station.svg',
              height: 24,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 2 ? const Color(0xFF1E4889) : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/ic_baseline-ev-station.svg',
              height: 24,
              colorFilter: const ColorFilter.mode(
                Color(0xFF1E4889),
                BlendMode.srcIn,
              ),
            ),
            label: '충전기 관리',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/mage_map-marker.svg',
              height: 24,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 3 ? const Color(0xFF1E4889) : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/mage_map-marker-fill.svg',
              height: 24,
              colorFilter: const ColorFilter.mode(
                Color(0xFF1E4889),
                BlendMode.srcIn,
              ),
            ),
            label: '충전소 관리',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.report_problem_outlined,
              size: 24,
              color:
                  _selectedIndex == 4 ? const Color(0xFF1E4889) : Colors.grey,
            ),
            activeIcon: Icon(
              Icons.report_problem,
              size: 24,
              color: const Color(0xFF1E4889),
            ),
            label: '장애접수',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF1E4889),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
