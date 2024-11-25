//
//  ContentView.swift
//  Final project
//
//  Created by Keshawn B on 11/7/24.
//

import SwiftUI
import FirebaseDatabase

struct ContentView: View {
    
    
    var body: some View {
        Image("Lake")
            .resizable()
            .frame(width:700.0, height:700.0 )
            .overlay(
        VStack{
            Text("Welcome to Mindwave")
                .foregroundStyle(.white)
        }
        )
    }
}

#Preview {
    ContentView()
}
