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
            
            TabView {
                CostEstimationView()
                    .tabItem {
                        Image(systemName: "square.grid.3x3.square")
                    }
                
                SplitBillView()
                    .tabItem {
                        Image(systemName: "square.and.line.vertical.and.square")
                    }
                
            }
        }
    }
}
