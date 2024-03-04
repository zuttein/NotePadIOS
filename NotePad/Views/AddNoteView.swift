//
//  AddNoteView.swift
//  NotePad
//
//  Created by Dennis.Nilsson on 2024-02-27.
//

import SwiftUI

struct AddNoteView: View {
    @ObservedObject var viewModel: NoteViewModel
        @State private var title: String = ""
        @State private var bodytext: String = ""

    var body: some View {
        ZStack{
            Color.yellow.opacity(0.5)
                .ignoresSafeArea()
            VStack {
                TextField("Title", text: $title, axis: .vertical)
                    .padding()
                
                TextField("Note", text: $bodytext, axis: .vertical)
                    .padding()
                Spacer()
                Button("Add Note") {
                    viewModel.addNote(title: title, bodytext: bodytext)
                    title = ""
                    bodytext = ""
                }
                .alert(isPresented: $viewModel.showAlert) {
                              Alert(
                                  title: Text("Error"),
                                  message: Text("You need to create a title for the note"),
                                  dismissButton: .default(Text("OK"))
                              )
                          }
                .padding()
                .foregroundColor(.black)
                .background(Color.yellow)
                .cornerRadius(20)
                
            }
            .padding()
            .navigationBarTitle("Add Note")
            
        }
    }
       


    }
#Preview {
    AddNoteView(viewModel: NoteViewModel())
}
