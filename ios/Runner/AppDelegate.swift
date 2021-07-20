import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool
  {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    
    let simpleMsgChannel = FlutterMethodChannel(name: "flutter.native/simple_msg",
                                              binaryMessenger: controller.binaryMessenger)
    simpleMsgChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread.
      guard call.method == "simpleMsgFromNative" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self?.simpleMsgFromNative(result: result)
    })

    let launchChannel = FlutterMethodChannel(name: "flutter.native/launchURL",
                                              binaryMessenger: controller.binaryMessenger)
    launchChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread.
      guard call.method == "launchBrowser" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self?.openWebBrowser(url: "https://flutter.io")
    })

    let batteryChannel = FlutterMethodChannel(name: "flutter.native/battery",
                                              binaryMessenger: controller.binaryMessenger)
    batteryChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread.
      guard call.method == "getBatteryLevel" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self?.receiveBatteryLevel(result: result)
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func simpleMsgFromNative(result: FlutterResult) {
      result("Hello From Native IOS Code");
  }

  private func openWebBrowser(url: String) {
    if let url = URL(string: url) //safely unwrap it
    {
      UIApplication.shared.openURL(url)
    }
  }

  private func receiveBatteryLevel(result: FlutterResult) {
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
    if device.batteryState == UIDevice.BatteryState.unknown {
      result(FlutterError(code: "UNAVAILABLE",
                          message: "Battery info unavailable",
                          details: nil))
    } else {
      result(Int(device.batteryLevel * 100))
    }
  }
}
