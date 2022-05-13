//
//  HistoryView.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-12.
//

import SwiftUI

struct HistoryView: View {
    
    let history: GrandTotal
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Your total is: $\(history.totalInput)")
                Text("The bill was split between \(history.numberOfPeople)")
                Text("The total per person is: $\(String(format: "%.2f", history.grandTotal))")
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        List{
        HistoryView(history: testGrandTotal)
        }
    }
}
