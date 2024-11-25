//
//  Final_projectApp.swift
//  Final project
//
//  Created by Keshawn B on 10/29/24.
//

import SwiftUI
import Firebase


@main
struct Final_projectApp: App {
    @State private var showFirstFile = true
    init(){
        
        FirebaseConfiguration.shared.setLoggerLevel(.debug)
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            if showFirstFile {
                ContentView()
                    .onAppear {
                        // Schedule the change after 15 seconds
                        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                            showFirstFile = false
                            }
                        }
                } else {
                    Home()
                }
        }
    }
    
}
