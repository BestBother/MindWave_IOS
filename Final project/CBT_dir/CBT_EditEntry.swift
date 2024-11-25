//
//  CBT_EditEntry.swift
//  Final project
//
//  Created by Keshawn B on 11/12/24.
//

import SwiftUI
import FirebaseDatabase

struct CBT_EditEntry: View {
    @ObservedObject var viewModel: JournalViewModel
    let userID: String // The user ID is passed in as a constant
    @State var entry: JournalEntry // @State allows local editing of the entry properties
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Title", text: $entry.title) // Bound to mutable entry.title
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom)

            TextEditor(text: $entry.content) // Bound to mutable entry.content
                .border(Color.gray, width: 0.5)
                .padding(.bottom)

            Button(action: saveChanges) {
                Text("Save Changes")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .navigationTitle("Edit Entry")
    }

    func saveChanges() {
        let ref = Database.database().reference()
            .child("users").child(userID)
            .child("journalEntries")
            .child(entry.datePath)
            .child(entry.id)

        let updatedData: [String: Any] = [
            "title": entry.title,
            "content": entry.content,
            "timestamp": entry.timestamp
        ]

        ref.updateChildValues(updatedData) { error, _ in
            if let error = error {
                print("Error updating entry: \(error.localizedDescription)")
            } else {
                print("Entry updated successfully!")
                viewModel.fetchJournalEntries(forUser: userID)
                dismiss()
            }
        }
    }
}

