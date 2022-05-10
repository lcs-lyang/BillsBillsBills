//
//  ContentView.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack{
            
            VStack (alignment: .leading){
                
                DatePicker("Date:",
                           selection: .constant(Date()),
                           displayedComponents: .date)
                    .font(.largeTitle)
                    .padding()
                
                Text("Food:")
                    .font(.largeTitle)
                    .padding()
                
                Text("Drinks:")
                    .font(.largeTitle)
                    .padding()
                
                Text("Dessert:")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
            }
            Spacer()
        }
        .navigationTitle("Cost Estimation")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}
