//
//  BillsBillsBillsApp.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-06.
//

import SwiftUI

@main
struct BillsBillsBillsApp: App {
    var body: some Scene {
        WindowGroup {
            
            TabView{
            
            SplitBillView()
                    .tabItem {
                        Image(systemName: "square.fill.and.line.vertical.and.square.fill")
                    }
                
            ListHistoryView()
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle.portrait.fill")
                    }
                
                
            }
            
        }
        
    }
}
