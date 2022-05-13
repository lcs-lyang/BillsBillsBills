//
//  ListHistoryView.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-12.
//

import SwiftUI

struct ListHistoryView: View {
    
    @State var history: [GrandTotal] = []
    
    var body: some View {
        
        VStack{
        // Show results of prior questions attempted
        List(history) { currentGrandTotal in
            // Use a helper view to display each prior result
            HistoryView(history: currentGrandTotal)
            
        }
            
        }
        
        .navigationTitle("History")
    }
    
    struct ListHistoryView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView{
            ListHistoryView()
            }
        }
    }
}
