//
//  SettingsView.swift
//  NotesWatchKit Watch App
//
//  Created by Satish Babu on 14/02/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    @State var sliderValue = 1.0
    var body: some View {
        VStack {
            HeaderView(title: "Settings")
            Spacer()
            Text("Number of lines: \(lineCount)")
            Slider(value: Binding(get: {
                self.sliderValue
            }, set: { newValue in
                self.sliderValue = newValue
                lineCount = Int(newValue)
            }), in: 0...4, step: 1)
        }
        .onAppear{
            getSliderValue()
        }
    }
    func getSliderValue() {
        self.sliderValue = Double(lineCount)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
