//
//  Physical.swift
//  Final project
//
//  Created by Keshawn B on 10/29/24.
//

import SwiftUI
import FirebaseDatabase

struct Physical: View {
    @State private var progress: Double = 0.0 // Progress value from 0.0 to 1.0
    @State var users_activity = ""
    var body: some View {
        NavigationStack{
            VStack {
                Text("Current step count for today")
                    .font(.largeTitle)
                ZStack {
                    // Background circle
                    Circle()
                        .stroke(lineWidth: 20)
                        .opacity(0.3)
                        .foregroundColor(.blue)
                        .frame(width: 200.0)
                    
                    // Progress circle
                    Circle()
                        .trim(from: 0.0, to: progress) // Trim controls how much of the circle is drawn
                        .stroke(
                            style: StrokeStyle(
                                lineWidth: 20,
                                lineCap: .round
                            )
                        )
                        .foregroundColor(.blue)
                        .rotationEffect(.degrees(-90)) // Start at the top
                        .animation(.easeInOut(duration: 1.0), value: progress)
                        .frame(width: 200.0)
                    
                    // Text showing the percentage
                    Text("\(Int(progress))/10000")
                        .font(.largeTitle)
                        .bold()
                }
                .padding(40)
                
                Menu {
                               Button("Running", action: { saveActivity(activity: "Running")})
                               Button("Cycling", action: { print("Option 2 selected") })
                               Button("Lifting", action: { print("Option 3 selected") })
                           } label: {
                               Label("Activity Type", systemImage: "arrowtriangle.down.fill")
                                   .padding()
                                   .background(Color.blue)
                                   .foregroundColor(.white)
                                   .cornerRadius(8)
                }

            }
            Text("")
                .font(.largeTitle)
        }
    }
    
    func saveActivity(activity: String) {
        let ref = Database.database().reference().child("users").child("Keshawn").child("activities")
        
        // Get the current year, month, and day
        let date = Date()
        let calendar = Calendar.current
        let year = String(calendar.component(.year, from: date))
        let month = String(format: "%02d", calendar.component(.month, from: date))
        let day = String(format: "%02d", calendar.component(.day, from: date))
        
        // Create a unique ID for each entry using childByAutoId
        let entryRef = ref.child(year).child(month).child(day).childByAutoId()
        
        // Entry data
        let data: [String: Any] = [
            "activity": activity,
            "timestamp": date.timeIntervalSince1970
        ]
        
        // Save the entry
        entryRef.setValue(data) { error, _ in
            if let error = error {
                print("Error saving journal entry: \(error.localizedDescription)")
            } else {
                print("Journal entry saved successfully!")
            }
        }
    }
}
#Preview {
    Physical()
}
