import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyB3h7_t9tNL4B_gWH1hATvVz7LsTP0aFaM")
    //GMSPlacesClient.provideAPIKey("AIzaSyB3h7_t9tNL4B_gWH1hATvVz7LsTP0aFaM")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
