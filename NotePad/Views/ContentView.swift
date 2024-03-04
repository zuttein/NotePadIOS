//
//  ContentView.swift
//  NotePad
//
//  Created by Dennis.Nilsson on 2024-02-26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = NoteViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                        
                List{
                    ForEach(viewModel.notes){ entity in
                        
                        VStack{
                            NavigationLink{
                                EditNote(entity: entity, viewmodel: viewModel)
                            }label:{
                                Text(entity.title ?? "no name")
                                    .padding()
                                    .font(.headline)
                                    
                                Text(viewModel.formattedTimestamp(entity.timestamp))
                                    .font(.subheadline)
                                    .padding()
                                    
                                    
                            }
                            
                            
                        
                        }
                        .listRowBackground(Color.yellow)
                        
                    }
                    .onDelete(perform: { indexSet in
                        viewModel.deleteNote(indexSet: indexSet)
                    })
                }
                
                HStack {
                    NavigationLink(destination: AddNoteView(viewModel: viewModel)) {
                        Image(systemName: "plus")
                            .padding()
                            .foregroundColor(.yellow)
                            .background(Color.black)
                            .cornerRadius(20)
                            .font(.system(size: 30))
                        
                            
                            
                    }
                    .padding(.trailing, 300 )
                    
                }
                
                
               
                
            }
            .padding()
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.large)
            .background(Color.yellow.opacity(0.5))
            .scrollContentBackground(.hidden)
        }
        
    }

}

#Preview {
    ContentView()
}
