//
//  InstamurealApp.swift
//  Instamureal
//
//  Created by Jack Willshire on 12/4/22.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
     

    return true
  }
}
@main
struct InstamurealApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var sportVM = SportViewModel()
    @StateObject var storageVM = StorageManager()
    var body: some Scene {
        WindowGroup {
            LoginPage()
                .environmentObject(SportViewModel())
                .environmentObject(StorageManager())
        }
    }
}
