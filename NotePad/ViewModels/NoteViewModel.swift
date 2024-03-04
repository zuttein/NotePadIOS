//
//  NoteViewModel.swift
//  NotePad
//
//  Created by Dennis.Nilsson on 2024-02-26.
//

import Foundation
import CoreData
class NoteViewModel: ObservableObject {
    
    @Published var notes: [Note] = []
    @Published var showAlert = false
    
    // Core Data container
    var container = Persistence.shared.container
    
    init(){
        self.fetchNotes()
    }
    
    // Hämtar anteckningar från Core Data
    func fetchNotes(){
        let request = NSFetchRequest<Note>(entityName: "Note")
      
        
        do{
            notes = try container.viewContext.fetch(request)
            print("fetch sucsess")
        } catch let error{
            print("error fetching: \(error)")
        }
        
        
    }
    
    func addNote(title: String, bodytext: String){
        
        //Om titelfältet är tomt så visa alert
        if title.isEmpty{
            showAlert = true
        }else{
            
            //Annars så skapa en note i CoreData
            
            let newNote = Note(context: container.viewContext)
            newNote.title = title
            newNote.bodytext = bodytext
            
            let currentDate = Date()
            newNote.timestamp = currentDate
            
            
            saveData()
        }
    
    }
    
    //Updaterar en note i CoreData
    func updateNote(entity: Note, newTitle: String, newBodytext: String){
        
        entity.title = newTitle
        entity.bodytext = newBodytext
        
        saveData()
    }
    
    // Tar bort en specifik anteckning från Core Data
    func deleteNote(indexSet: IndexSet){
        guard let index = indexSet.first else {return}
        let entity = notes[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    
    
    //Sparar ändringar i CoreData
    func saveData(){
        do {
           try container.viewContext.save()
        } catch let error{
            print("error saving data \(error)")
        }
        fetchNotes()
    }
    
    // Formaterar tidsstämpel
    func formattedTimestamp(_ timestamp: Date?) -> String {
        guard let timestamp = timestamp else {
            return "Unknown"
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: timestamp)
    }


    
}
