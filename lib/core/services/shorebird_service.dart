import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:flutter/foundation.dart';

class ShorebirdService {
  final ShorebirdCodePush _shorebirdCodePush = ShorebirdCodePush();

  Future<void> checkForUpdates() async {
    // Shorebird only works on mobile (Android/iOS)
    if (kIsWeb) return;

    try {
      // Check if the current patch is available
      final isUpdateAvailable = await _shorebirdCodePush.isNewPatchAvailableForDownload();

      if (isUpdateAvailable) {
        await _shorebirdCodePush.downloadUpdateIfAvailable();
      }
    } catch (e) {
      debugPrint('Error checking for Shorebird updates: $e');
    }
  }

  Future<int?> getCurrentPatchNumber() async {
    if (kIsWeb) return null;
    return await _shorebirdCodePush.currentPatchNumber();
  }
}
