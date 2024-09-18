//
//  Students_Who_SitApp.swift
//  Students Who Sit
//
//  Created by Mert Bildirici on 9/17/24.
//

import SwiftUI
import Firebase

@main
struct BabysittingAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HomeViewModel())
        }
    }
}

