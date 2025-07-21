import Flutter
import UIKit
import GoogleMaps

GMSServices.provideAPIKey("AIzaSyDUg14J38ZZ7U8MljzQHKrCvRhcmf_WLbs")


@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
