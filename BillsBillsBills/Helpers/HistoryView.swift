//
//  HistoryView.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-12.
//

import SwiftUI

struct HistoryView: View {
    
     var totalInput: String
     var numberOfPeople: String
     var grandTotal: Double
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Your total is: $\(totalInput)")
                Text("The bill was split between \(numberOfPeople)")
                Text("The total per person is: \(grandTotal.formatted(.number.precision(.fractionLength(2))))")
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {

        HistoryView(totalInput: "10", numberOfPeople: "10", grandTotal: 300)
        }
    }

