//
//  CBT_AddEntry.swift
//  Final project
//
//  Created by Keshawn B on 11/12/24.
//

import SwiftUI
import FirebaseDatabase

struct Physical_AddActivity: View {
    
    @State var users_note_entry = ""
    @State var users_PT_title_entry = ""
    @State var users_activity = ""
    
    var body: some View {
     
        VStack {
            Menu {
                           Button("Option 1", action: { users_activity = "Running"  })
                           Button("Option 2", action: { print("Option 2 selected") })
                           Button("Option 3", action: { print("Option 3 selected") })
                       } label: {
                           Label("Activity Type", systemImage: "arrowtriangle.down.fill")
                               .padding()
                               .background(Color.blue)
                               .foregroundColor(.white)
                               .cornerRadius(8)
            }

            TextField("Enter the title of your activity", text: $users_PT_title_entry)
                .font(.title)
                //.padding()
                .position(x: 200,y: 5)
                .foregroundStyle(Color.red)
            
            TextField("Enter Notes about your activity here", text: $users_note_entry, axis: .vertical)
                .padding()
                .position(x: 200,y: -100)
            
                Button(action: {saveJournalEntry(title: users_PT_title_entry, content: users_note_entry, activity: users_activity)}, label: {
                Text("Save entry")
                
            })
        }
        .padding()
        
    }
    
    func saveJournalEntry(title: String, content: String,activity: String) {
        let ref = Database.database().reference().child("users").child("Keshawn").child("journalEntries")
        
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
            "title": title,
            "content": content,
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
    Physical_AddActivity()
}
