# Regenerating screenshots

1. Boot a simulator: `xcrun simctl boot "iPhone 17 Pro"`
2. `flutter pub get`
3. Run the driver:
   ```sh
   flutter drive --driver test_driver/integration_test.dart \
     --target integration_test/screenshot_test.dart -d "iPhone 17 Pro"
   ```

## How it works

`integration_test/screenshot_test.dart` boots the app under `ProviderScope`,
walks the onboarding flow (welcome -> role select -> credential verification),
lands on the main tab shell, then visits Feed, Discover (+ opens a professional
profile), Messages (+ opens a chat thread), Notifications, and Profile - taking a
named screenshot after each `pumpAndSettle()`.

`test_driver/integration_test.dart` uses `integrationDriverExtended` with an
`onScreenshot` callback that writes each captured PNG to `screenshots/<name>.png`.

The Android demo GIF (`screenshots/demo-android.gif`) was captured as a sequence
of `adb exec-out screencap` frames (this emulator's `screenrecord` hits a known
Impeller/virtual-display freeze), assembled into a GIF with an ffmpeg palette
pass. The iOS demo GIF (`screenshots/demo.gif`) was captured with
`xcrun simctl io booted recordVideo` while the same integration test drove the
UI, then converted the same way.
