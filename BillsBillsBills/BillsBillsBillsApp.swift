//
//  BillsBillsBillsApp.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-06.
//

import SwiftUI

@main
struct BillsBillsBillsApp: App {
    
    @State private var history: [GrandTotal] = []
    
    
    var body: some Scene {
        WindowGroup {
            
            TabView{
            
                SplitBillView(history: $history)
                    .tabItem {
                        Image(systemName: "square.fill.and.line.vertical.and.square.fill")
                    }
                
                ListHistoryView(history: $history)
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle.portrait.fill")
                    }
                
                
            }
            
        }
        
    }
}
