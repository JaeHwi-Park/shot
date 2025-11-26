import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class CompareResultPage extends StatelessWidget {
  final XFile leftImage;
  final XFile rightImage;

  const CompareResultPage({
    super.key,
    required this.leftImage,
    required this.rightImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비교 결과'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text('내 사진', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        FutureBuilder<Uint8List>(
                          future: leftImage.readAsBytes().then((b) => Uint8List.fromList(b)),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.memory(snapshot.data!, width: 140, height: 140, fit: BoxFit.cover),
                              );
                            }
                            return const SizedBox(width: 140, height: 140, child: CircularProgressIndicator());
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        const Text('원하는 사진', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        FutureBuilder<Uint8List>(
                          future: rightImage.readAsBytes().then((b) => Uint8List.fromList(b)),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.memory(snapshot.data!, width: 140, height: 140, fit: BoxFit.cover),
                              );
                            }
                            return const SizedBox(width: 140, height: 140, child: CircularProgressIndicator());
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Icon(
                Icons.check_circle_outline,
                size: 60,
                color: Colors.green,
              ),
              const SizedBox(height: 16),
              const Text(
                '비교 분석 완료',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '두 사진의 비교 분석 결과가 표시됩니다.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
