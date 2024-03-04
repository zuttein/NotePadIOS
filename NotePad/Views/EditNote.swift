//
//  EditNote.swift
//  NotePad
//
//  Created by Dennis.Nilsson on 2024-02-26.
//

import SwiftUI

struct EditNote: View {
    var entity: Note
        
    @ObservedObject var viewmodel: NoteViewModel
    @State var title: String
    @State var bodytext: String
    
    init(entity: Note, viewmodel: NoteViewModel) {
        self.entity = entity
        self.viewmodel = viewmodel
        _title = State(initialValue: entity.title ?? "")
        _bodytext = State(initialValue: entity.bodytext ?? "")
    }
    
    var body: some View {
        ZStack{
            Color.yellow.opacity(0.5)
                .ignoresSafeArea()
            VStack{
                TextField("Title", text: $title, axis: .vertical)
                    .padding()
                
                TextField("Note", text: $bodytext, axis: .vertical)
                    .padding()
                Spacer()
                
                
                Button("Update Note") {
                    if title.isEmpty || bodytext.isEmpty {
                        return
                    }
                    
                    
                    viewmodel.updateNote(entity: entity, newTitle: title, newBodytext: bodytext)
                    
                    
                }
                .foregroundColor(.black)
                .padding()
                .background(Color.yellow)
                .cornerRadius(20)
            }
        }
    }
       
}

