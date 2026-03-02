import Flutter
import UIKit
import FBSDKCoreKit
import AppTrackingTransparency
import AdSupport

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    ApplicationDelegate.shared.application(
      application,
      didFinishLaunchingWithOptions: launchOptions
    )
    GeneratedPluginRegistrant.register(with: self)
    
    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.qris.app/att_status", binaryMessenger: controller.binaryMessenger)
    
    channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "getATTStatus" {
        if #available(iOS 14, *) {
          let status = ATTrackingManager.trackingAuthorizationStatus
          var statusString = "unknown"
          switch status {
          case .notDetermined:
            statusString = "notDetermined"
          case .restricted:
            statusString = "restricted"
          case .denied:
            statusString = "denied"
          case .authorized:
            statusString = "authorized"
          @unknown default:
            statusString = "unknown"
          }
          result(statusString)
        } else {
          result("notAvailable")
        }
      } else if call.method == "requestATT" {
        if #available(iOS 14, *) {
          ATTrackingManager.requestTrackingAuthorization { status in
            var statusString = "unknown"
            switch status {
            case .notDetermined:
              statusString = "notDetermined"
            case .restricted:
              statusString = "restricted"
            case .denied:
              statusString = "denied"
            case .authorized:
              statusString = "authorized"
            @unknown default:
              statusString = "unknown"
            }
            result(statusString)
          }
        } else {
          result("notAvailable")
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func applicationDidBecomeActive(_ application: UIApplication) {
    AppEvents.shared.activateApp()
    super.applicationDidBecomeActive(application)
  }

  override func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
  ) -> Bool {
    let handled = ApplicationDelegate.shared.application(
      app,
      open: url,
      options: options
    )
    return handled || super.application(app, open: url, options: options)
  }
}
