//
//  InformationView.swift
//  NotesWatchKit Watch App
//
//  Created by Satish Babu on 14/02/24.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        VStack {
            Image(systemName: "person")
                .imageScale(.large)
            HeaderView(title: "Credits")
            Spacer()
            Text("Satish Ramineni")
                .font(.headline)
            Text("Developer")
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
