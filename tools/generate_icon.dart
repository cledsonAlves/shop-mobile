import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Criar o ícone principal (1024x1024)
  await generateAppIcon();
  
  // Criar o ícone foreground para adaptive icon (432x432)
  await generateAdaptiveIconForeground();
  
  print('Ícones gerados com sucesso!');
  print('Execute: flutter pub run flutter_launcher_icons');
}

Future<void> generateAppIcon() async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final size = const Size(1024, 1024);
  
  // Background gradiente
  final gradientPaint = Paint()
    ..shader = const LinearGradient(
      colors: [Color(0xFFf06e42), Color(0xFFFF8A65)],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
  
  // Desenhar fundo com bordas arredondadas
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(230),
    ),
    gradientPaint,
  );
  
  // Desenhar ícone de sacola
  drawShoppingBagIcon(canvas, size);
  
  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  final bytes = byteData!.buffer.asUint8List();
  
  final file = File('assets/icon/app_icon.png');
  await file.writeAsBytes(bytes);
}

Future<void> generateAdaptiveIconForeground() async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final size = const Size(432, 432);
  
  // Apenas o ícone da sacola (sem fundo)
  drawShoppingBagIcon(canvas, size, scale: 0.42);
  
  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  final bytes = byteData!.buffer.asUint8List();
  
  final file = File('assets/icon/app_icon_foreground.png');
  await file.writeAsBytes(bytes);
}

void drawShoppingBagIcon(Canvas canvas, Size size, {double scale = 0.5}) {
  final paint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeWidth = 50 * scale
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;
  
  final fillPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;
  
  final center = Offset(size.width / 2, size.height / 2);
  final bagSize = size.width * scale;
  
  // Corpo da sacola
  final bagPath = Path();
  bagPath.moveTo(center.dx - bagSize * 0.35, center.dy - bagSize * 0.15);
  bagPath.lineTo(center.dx - bagSize * 0.3, center.dy + bagSize * 0.45);
  bagPath.quadraticBezierTo(
    center.dx - bagSize * 0.3,
    center.dy + bagSize * 0.5,
    center.dx - bagSize * 0.25,
    center.dy + bagSize * 0.5,
  );
  bagPath.lineTo(center.dx + bagSize * 0.25, center.dy + bagSize * 0.5);
  bagPath.quadraticBezierTo(
    center.dx + bagSize * 0.3,
    center.dy + bagSize * 0.5,
    center.dx + bagSize * 0.3,
    center.dy + bagSize * 0.45,
  );
  bagPath.lineTo(center.dx + bagSize * 0.35, center.dy - bagSize * 0.15);
  bagPath.close();
  
  canvas.drawPath(bagPath, paint);
  
  // Alças
  final handlePath = Path();
  handlePath.moveTo(center.dx - bagSize * 0.2, center.dy - bagSize * 0.15);
  handlePath.quadraticBezierTo(
    center.dx - bagSize * 0.2,
    center.dy - bagSize * 0.4,
    center.dx,
    center.dy - bagSize * 0.4,
  );
  handlePath.quadraticBezierTo(
    center.dx + bagSize * 0.2,
    center.dy - bagSize * 0.4,
    center.dx + bagSize * 0.2,
    center.dy - bagSize * 0.15,
  );
  
  canvas.drawPath(handlePath, paint);
}
