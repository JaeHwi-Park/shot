import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class AnalysisScreen extends StatelessWidget {
  final XFile imageFile;
  const AnalysisScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('분석 결과'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<Uint8List>(
                future: imageFile.readAsBytes().then((bytes) => Uint8List.fromList(bytes)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: Image.memory(snapshot.data!, fit: BoxFit.contain),
                        ),
                        const SizedBox(height: 16),
                        const Text('이미지 분석 결과 예시 (더미)')
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return const Text('이미지 로드 실패');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
