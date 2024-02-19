//
//  GroceryAppApp.swift
//  GroceryApp
//
//  Created by Missbo on 19/02/2024.
//

import SwiftUI
import Firebase
@main
struct GroceryApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
