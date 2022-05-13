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
                Text("Your total is: \(history.totalInput)")
                Text("The bill was split between \(history.numberOfPeople)")
                Text("The tip was \(history.tipInput) and the tax was \(history.taxInput)")
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
