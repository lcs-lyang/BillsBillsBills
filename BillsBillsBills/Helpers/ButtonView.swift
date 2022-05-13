//
//  ButtonView.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-12.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var totalCorrect: Bool
    @Binding var peopleCorrect: Bool
    @Binding var tipCorrect: Bool
    @Binding var taxCorrect: Bool
    let totalInput: String
    let numberOfPeople: String
    let tipInput: String
    @Binding var grandTotal: Double
    @Binding var taxInput: Double
    @Binding var history: [GrandTotal]
    
    var body: some View {
        
        Button(action: {
            //guard statement to convert the string to integer
            //remember, prices have decimals, therefore it's a Double
            
            guard let totalGiven = Double(totalInput) else {
                // not a number
                totalCorrect = false
                
                saveResult()
                
                return
            }
            
            guard let peopleGiven = Double(numberOfPeople) else {
                // not a number
                peopleCorrect = false
                
                saveResult()
                
                return
            }
            
            guard let tipGiven = Double(tipInput) else {
                // not a number
                tipCorrect = false
                
                saveResult()
                
                return
            }
//            print("total given is: \(totalGiven)")
//            print("people given is: \(peopleGiven)")
//            print("tax input is: \(taxInput)")
//            print("tipGiven is: \(tipGiven)")
//            print("grandTotal is: \(grandTotal)")
            
            grandTotal = ((totalGiven * taxInput)/2) + (totalGiven/peopleGiven) + ((totalGiven/peopleGiven)*(tipGiven/100))
            
            
            saveResult()
            
        }, label: {
            Text("Calculate Grand total")
                .font(.title2)
        })
            .buttonStyle(.bordered)
            .padding()
    }
    
    // MARK: Functions
    
    // Save the result of a question that has been answered
    /// - Tag: mm_adding_to_list
    func saveResult() {
        
        // Create a result to save based on current question state
        let newGrandTotal = GrandTotal(totalInput: totalInput, numberOfPeople: numberOfPeople, tipInput: tipInput, taxInput: taxInput, totalCorrect: totalCorrect, peopleCorrect: peopleCorrect, tipCorrect: tipCorrect, taxCorrect: taxCorrect, grandTotal: grandTotal)
        
        // Insert most recent result in the first position in list
        // This ensures newer results at top of list; older at bottom
        history.insert(newGrandTotal, at: 0)
        
    }
    
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(totalCorrect: .constant(false), peopleCorrect: .constant(false), tipCorrect: .constant(false), taxCorrect: .constant(false), totalInput: "100", numberOfPeople: "2", tipInput: "100", grandTotal: .constant(100.0), taxInput: .constant(0.05), history: .constant([]))
    }
}
