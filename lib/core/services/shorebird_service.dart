import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:flutter/foundation.dart';

class ShorebirdService {
  final ShorebirdUpdater _updater = ShorebirdUpdater();

  Future<void> checkForUpdates() async {
    // Shorebird only works on mobile (Android/iOS)
    if (kIsWeb) return;

    try {
      // Check for updates
      final status = await _updater.checkForUpdate();

      if (status == UpdateStatus.outdated) {
        // Download and install the update
        await _updater.update();
      }
    } catch (e) {
      debugPrint('Error checking for Shorebird updates: $e');
    }
  }

  Future<int?> getCurrentPatchNumber() async {
    if (kIsWeb) return null;
    try {
        final patch = await _updater.readCurrentPatch();
        return patch?.number;
    } catch (_) {
        return null;
    }
  }
}
