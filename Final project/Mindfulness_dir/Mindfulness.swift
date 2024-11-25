//
//  Mindfulness.swift
//  Final project
//
//  Created by Keshawn B on 10/29/24.
//

import SwiftUI

struct Mindfulness_test: View {
    var body: some View {
        
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/){
            Mindfulness_Breathing()
                .tabItem { Text("Tab") }.tag(1)
            
            Mindfulness_Meditation()
                .tabItem { Text("Tab") }.tag(2)
        }
            
            
    }
}

#Preview {
    Mindfulness_test()
}
