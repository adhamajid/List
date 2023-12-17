//
//  ContentView.swift
//  List
//
//  Created by Adha Syah Majid on 12/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var animals: [String] = [
        "lion", "tiger", "panda", "crocodile"
    ]
    
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    @State var weapons: [String] = [
        "AK-47", "M-16", "Shootgun", "CZ BREN 2, 11 Barrel"
    ]
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("animal")) {
                    ForEach(animals, id: \.self){ hewan in
                        Text(hewan.capitalized)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
                
                
                Section(header: Text("Buah")) {
                    ForEach(fruits, id: \.self){ buah in
                        Text(buah.capitalized)
                    }
                }
                
                Section(header: Text("Weapons")) {
                    ForEach(weapons, id: \.self){ senjata in
                        Text(senjata)
                    }
                }
            }
            .navigationTitle("Dream List")
            .navigationBarItems(
                leading: EditButton(),
            trailing: Button("Add", action: {
                animals.append("Coconut")
            }))
        }
    }
    func delete(indexSet: IndexSet) {
        animals.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        animals.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    
}

#Preview {
    ContentView()
}
