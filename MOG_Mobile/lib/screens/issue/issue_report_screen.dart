import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class IssueReportScreen extends StatefulWidget {
  const IssueReportScreen({super.key});

  @override
  State<IssueReportScreen> createState() => _IssueReportScreenState();
}

class _IssueReportScreenState extends State<IssueReportScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String _selectedIssueType = '기타';

  Future<void> _takePicture() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _image = File(photo.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('사진 촬영'),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 사진 영역
                if (_image == null)
                  GestureDetector(
                    onTap: _takePicture,
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 48,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8),
                            Text(
                              '사진을 촬영하려면 탭하세요',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          _image!,
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: _takePicture,
                        child: const Text('다시 촬영하기'),
                      ),
                    ],
                  ),
                const SizedBox(height: 24),

                // 오류 유형 선택
                const Text(
                  '오류 유형을 선택하세요:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // 라디오 버튼 목록
                _buildRadioOption('네트워크 오류', '네트워크 오류'),
                _buildRadioOption('화면 오류', '화면 오류'),
                _buildRadioOption('기능 오류', '기능 오류'),
                _buildRadioOption('기타', '기타'),

                const SizedBox(height: 32),

                // 접수 버튼
                ElevatedButton(
                  onPressed:
                      _image == null
                          ? null
                          : () {
                            // 장애 접수 처리 로직
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('장애가 접수되었습니다.')),
                            );
                            Navigator.of(context).pop();
                          },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    disabledBackgroundColor: Colors.grey[300],
                  ),
                  child: const Text(
                    '장애 접수',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRadioOption(String title, String value) {
    return RadioListTile<String>(
      title: Text(title),
      value: value,
      groupValue: _selectedIssueType,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedIssueType = newValue;
          });
        }
      },
      activeColor: Colors.blue,
      contentPadding: EdgeInsets.zero,
    );
  }
}
