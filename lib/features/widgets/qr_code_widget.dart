import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRWidget extends StatefulWidget {
  ScanQRWidget({super.key, required this.onQRViewCreated});
  Function(QRViewController) onQRViewCreated;
  @override
  State<StatefulWidget> createState() => _ScanQRWidgetState();
}

class _ScanQRWidgetState extends State<ScanQRWidget> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;

  @override
  Widget build(BuildContext context) {
    return _buildQrView(context);
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = 270.h;

    return QRView(
      key: qrKey,
      onQRViewCreated: widget.onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          overlayColor: const Color(0xff197B8D),
          borderLength: 50,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, true),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
