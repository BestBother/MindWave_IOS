//
//  Mindfulness_Meditation.swift
//  Final project
//
//  Created by Keshawn B on 10/29/24.
//

import SwiftUI

struct Mindfulness_Meditation: View {
    var body: some View {
        NavigationStack {
            VStack{
                VStack(alignment: .leading){
                    
                    HStack(){
                        Spacer()
                        Text("Mindfulness Meditation/Breathing Exercises")
                            .font(.largeTitle)
                        Spacer()
                    }
                   
                }
                .padding(.bottom)
                .frame(height: 100.0)
                Color.blue
                    .overlay(
                VStack{
                    
                    NavigationLink(destination: CBT_AddEntry()) {
                        RoundedRectangle(cornerRadius: 10) // Rounded corners
                            .fill(Color.white).opacity(0.8)
                            .frame(width: 370, height: 100)
                            .overlay(
                        Text("Self compassion meditation")
                        )
                    }
                    NavigationLink(destination: CBT_AddEntry()) {
                        RoundedRectangle(cornerRadius: 10) // Rounded corners
                            .fill(Color.white).opacity(0.8)
                            .frame(width: 370, height: 100)
                            .overlay(
                        Text("Gratitude meditation")
                        )
                    }
                    NavigationLink(destination: CBT_AddEntry()) {
                        RoundedRectangle(cornerRadius: 10) // Rounded corners
                            .fill(Color.white).opacity(0.8)
                            .frame(width: 370, height: 100)
                            .overlay(
                        Text("Enotional resilience meditation")
                        )
                    }
                    NavigationLink(destination: CBT_AddEntry()) {
                        RoundedRectangle(cornerRadius: 10) // Rounded corners
                            .fill(Color.white).opacity(0.8)
                            .frame(width: 370, height: 100)
                            .overlay(
                        Text("15 mintues of white noise")
                        )
                    }
                    NavigationLink(destination: CBT_AddEntry()) {
                        RoundedRectangle(cornerRadius: 10) // Rounded corners
                            .fill(Color.white).opacity(0.8)
                            .frame(width: 370, height: 100)
                            .overlay(
                        Text("Stress relief breathing")
                        )
                    }
                    
                }
        )
                    .foregroundStyle(Color.black)
                .frame(height: 575.0)
                VStack{
                   
                    HStack{
                        Image(systemName: "plus.circle")
                        Text("Add Meditation exercises")
                    }
                }
                .frame(height: 50.0)
                
                
            }
        }
    }
}

#Preview {
    Mindfulness_Meditation()
}
