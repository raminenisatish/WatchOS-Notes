//
//  HeaderView.swift
//  NotesWatchKit Watch App
//
//  Created by Satish Babu on 14/02/24.
//

import SwiftUI
// MARK: - Reusable HeaderView
struct HeaderView: View {
    var title: String = ""
    var body: some View {
        VStack {
            if !title.isEmpty {
                Text(title)
            }
            HStack {
                Capsule()
                    .frame(height: 1)
                    .foregroundColor(.yellow)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView()
            HeaderView(title: "Credit")
        }
    }
}
