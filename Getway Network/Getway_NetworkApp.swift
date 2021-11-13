//
//  Getway_NetworkApp.swift
//  Getway Network
//
//  Created by Rebin Aziz on 11/12/21.
//

import SwiftUI
import Firebase

@main
struct Getway_NetworkApp: App {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
