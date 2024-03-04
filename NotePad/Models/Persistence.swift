//
//  Persistence.swift
//  NotePad
//
//  Created by Dennis.Nilsson on 2024-02-26.
//

import Foundation
import CoreData

struct Persistence{
    static let shared = Persistence()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "NoteModel")
        
        container.loadPersistentStores{ (description, error) in
            
            if let error = error {
                print("Error loading core data: \(error)")
            } else {
                print("Success!")
            }
            
        }
    }
}
