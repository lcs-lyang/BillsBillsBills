//
//  SplitBillView.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-10.
//

import SwiftUI

struct SplitBillView: View {
    
    //MARK: STORED PROPERTIES
    
    //Types of input that the user is going to enter
    @State var dateInput = Date()
    
    @State var totalInput = ""
    
    @State var numberOfPeople = ""
    
    @State var tipInput = ""
    
    //Not a string, but rather a value. However we don't know the value yet so set it to zero.
    @State var taxInput = 0.0
    
    @State var totalCorrect: Bool = false
    
    @State var peopleCorrect: Bool = false
    
    @State var tipCorrect: Bool = false
    
    @State var taxCorrect: Bool = false
    
    @State var grandTotal = 0.0
    
    @Binding var history: [GrandTotal]
    
    //MARK: COMPUTED PROPERTIES
    //using stored properties to calculate something
    
    var body: some View {
        NavigationView {
            
            VStack{
                
                HStack{
                    
                    VStack{
                        
                        DatePicker("Date:",
                                   selection: $dateInput,
                                   displayedComponents: .date)
                        .font(.title)
                        .padding()
                        
                        TotalInputView(totalInput: $totalInput)
                        
                        NumberOfPeopleView(numberOfPeople: $numberOfPeople)
                        
                        TipInputView(tipInput: $tipInput)
                        
                        TaxInputView(taxInput: $taxInput)
                        
                    }
                    
                    Spacer()
                    
                }
                
                //Button 1
                ButtonView(totalCorrect: $totalCorrect, peopleCorrect: $peopleCorrect, tipCorrect: $tipCorrect, taxCorrect: $taxCorrect, totalInput: totalInput, numberOfPeople: numberOfPeople, tipInput: tipInput, grandTotal: $grandTotal, taxInput: $taxInput, history: $history)
                
                Text("Your grand total is: $\(String(format: "%.2f", grandTotal))")
                    .bold()
                    .opacity(peopleCorrect && totalCorrect && tipCorrect == true ? 0.0 : 1.0)
                    .padding()
                
                Spacer()
                
                
//                // Show results of prior questions attempted
//                List(history) { currentGrandTotal in
//                    // Use a helper view to display each prior result
//                    HistoryView(history: currentGrandTotal)
                }
                
            .navigationTitle("Split the Bill!")
            
            Spacer()
            
            }
            
        }
        
    }
    


struct SplitBillView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LiveSplitBillView()
        }
    }
    
    struct LiveSplitBillView: View {
        @State var historybills: [GrandTotal] = testGrandTotal
        
        var body: some View{
            SplitBillView(history: $historybills)
        }
        
    }
        
}
