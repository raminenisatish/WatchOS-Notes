//
//  ContentView.swift
//  NotesWatchKit Watch App
//
//  Created by Satish Babu on 13/02/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    @State var notes = [Notes]()
    @State var text = ""
    @AppStorage("lineCount") var lineCount: Int = 1

    // MARK: - Functions
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
      //  dump(notes)
        do {
            // convert data array to encoder
            let data = try JSONEncoder().encode(notes)
            // create new url to save data in document directory
            let documentDir = getDocumentDirectory().appendingPathComponent("Notes")
            // write data to the new url
            try data.write(to: documentDir)
        } catch {
            print("error while saving data to document directory")
        }
    }
    
    func loadData() {
        do {
            // get document directy url
            let documentDir = getDocumentDirectory().appendingPathComponent("Notes")
            // get data from ul
            let data: Data = try Data(contentsOf: documentDir)
            // get notes from data
            notes = try JSONDecoder().decode([Notes].self, from: data)
        } catch {
            print("error while retriving data")
        }
    }
    
    func delete(offSet: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offSet)
            save()
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                /// TextField and plus button
                HStack {
                    TextField("Add new note", text: $text)
                    Button {
                        // action
                        guard text.isEmpty == false else { return }
                        let note = Notes(id: UUID(), text: text)
                        notes.append(note)
                        text = ""
                        save()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                    .fixedSize()
                }
                Spacer()
                /// Added note list
                if notes.count >= 1 {
                    List {
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(destination: DetailsView(note: notes[i], index: i, total: notes.count)) {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.yellow)
                                    Text(notes[i].text)
                                        .lineLimit(lineCount)
                                }
                            }
                        }
                        .onDelete(perform: delete(offSet:))
                    }
                } else {
                    Image(systemName: "plus")
                }
            }
        }
        .navigationTitle("Notes")
        .onAppear {
            loadData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
