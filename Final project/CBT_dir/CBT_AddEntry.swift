//
//  CBT_AddEntry.swift
//  Final project
//
//  Created by Keshawn B on 11/12/24.
//

import SwiftUI
import FirebaseDatabase

struct CBT_AddEntry: View {
    
    @State var users_entry = ""
    @State var users_title_entry = ""
    
    var currentDateString: String {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM d, yyyy" // Example: "Monday, November 18, 2024"
            return formatter.string(from: date)
        }
    
    var body: some View {
        
        VStack {
            
            TextField("Enter the title of your entry", text: $users_title_entry)
                .font(.title)
                .padding()
                .position(x: 200,y: 5)
            
            VStack{
                TextField("Enter your entry here", text: $users_entry, axis: .vertical)
                    .padding()
                    .position(x: 200,y: -100)
                Button(action: {saveJournalEntry(title: users_title_entry, content: users_entry)}, label: {
                    Text("Save entry")
                        .frame(width: 275.0, height: 50.0)
                            .cornerRadius(10)
                            .background(.gray.opacity(0.5))
                        
                    
                })
                
            }
        }
        .padding()
        
    }
    
    func saveJournalEntry(title: String, content: String) {
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
    CBT_AddEntry()
}
