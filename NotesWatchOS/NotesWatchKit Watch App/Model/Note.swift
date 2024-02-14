//
//  Note.swift
//  NotesWatchKit Watch App
//
//  Created by Satish Babu on 13/02/24.
//

import Foundation
struct Notes: Identifiable, Codable {
    let id: UUID
    let text: String
}
