//
//  Home.swift
//  Final project
//
//  Created by Keshawn B on 11/18/24.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b, a: Double
        switch hex.count {
        case 6: // RGB (6 characters)
            r = Double((int >> 16) & 0xFF) / 255.0
            g = Double((int >> 8) & 0xFF) / 255.0
            b = Double(int & 0xFF) / 255.0
            a = 1.0
        case 8: // ARGB (8 characters)
            a = Double((int >> 24) & 0xFF) / 255.0
            r = Double((int >> 16) & 0xFF) / 255.0
            g = Double((int >> 8) & 0xFF) / 255.0
            b = Double(int & 0xFF) / 255.0
        default:
            r = 1.0
            g = 1.0
            b = 1.0
            a = 1.0
        }
        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}

struct Home: View {
    
   
    @State private var color: Color = .blue
    @State private var date = Date.now
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    @State private var days: [Date] = []
    
    var body: some View {
        
        NavigationStack {
        VStack{
            VStack(spacing: 10.0){
                Text("This weeks")
                    .font(.system(size: 60))
                    
                Text("overview")
                    .font(.system(size: 60))
                    
            }
            VStack {
                HStack {
                    ForEach(daysOfWeek.indices, id: \.self) { index in
                        Text(daysOfWeek[index])
                            .fontWeight(.black)
                            .frame(maxWidth: .infinity)
                    }
                }
                LazyVGrid(columns: columns) {
                    ForEach(days, id: \.self) { day in
                        if day.monthInt != date.monthInt {
                            Text("")
                        } else {
                            Text(day.formatted(.dateTime.day()))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .background(
                                    Circle()
                                        .foregroundStyle(
                                            Date.now.startOfDay == day.startOfDay
                                            ? .red.opacity(0.3)
                                            :  .blue.opacity(0.3)
                                        )
                                )
                        }
                    }
                }
            }
            .padding()
            .onAppear {
                days = date.calendarDisplayDays
            }
            .onChange(of: date) {
                days = date.calendarDisplayDays
            }
            
            Text("MindWave Tools")
                .font(.title)
            
           
                NavigationLink(destination: CBT_Journal()){
                    RoundedRectangle(cornerRadius: 10) // Rounded corners
                        .fill(Color(hex: "639BFF")).opacity(0.9)
                        .frame(width: 250, height: 50)
                        .overlay(
                            Text("CBT Journal")
                                .foregroundColor(.white)
                                .font(.headline)
                        )
                }
            NavigationLink(destination: Mindfulness_Meditation()){
                RoundedRectangle(cornerRadius: 10) // Rounded corners
                    .fill(Color(hex: "639BFF"))
                    .frame(width: 250, height: 50)
                    .overlay(
                        Text("Mindfulness Meditation/Breathing Exercises")
                            .foregroundColor(.white)
                            .font(.headline)
                    )
            }
            NavigationLink(destination: Physical()){
                RoundedRectangle(cornerRadius: 10) // Rounded corners
                    .fill(Color(hex: "639BFF")).opacity(0.9)
                    .frame(width: 250, height: 50)
                    .overlay(
                        Text("Physical Activity")
                            .foregroundColor(.white)
                            .font(.headline)
                    )
            }
            }
        }
    }
    
}

#Preview {
    Home()
}
