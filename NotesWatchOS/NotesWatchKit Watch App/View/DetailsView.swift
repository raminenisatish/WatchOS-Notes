//
//  DetailsView.swift
//  NotesWatchKit Watch App
//
//  Created by Satish Babu on 14/02/24.
//

import SwiftUI

struct DetailsView: View {
    let note: Notes
    let index: Int
    let total: Int
    @State var showInformationView = false
    @State var showSettingsView = false

    var body: some View {
        VStack {
            // Header
            HeaderView()
            Spacer()
            // Body
            Text(note.text)
            // Footer
            Spacer()
            HStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        showSettingsView.toggle()
                    }
                Spacer()
                Text("\(index+1)/\(total)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        showInformationView.toggle()
                    }
            }
            .sheet(isPresented: $showInformationView) {
                InformationView()
            }
            .sheet(isPresented: $showSettingsView) {
                SettingsView()
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(note: Notes(id: UUID(), text: " "), index: 0, total: 0)
    }
}
