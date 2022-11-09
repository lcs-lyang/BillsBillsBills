//
//  ListHistoryView.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-12.
//

import SwiftUI

struct ListHistoryView: View {
    
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
        
    @State var grandTotalInput = false
    
    @State var grandTotalWanted = ""
    
    @Binding var history: [GrandTotal]
    
    //MARK: COMPUTED PROPERTIES
    //using stored properties to calculate something
    
    var body: some View {
        NavigationView {
            
            VStack{

                    HStack{
                        TextField("",
                                  text: $grandTotalWanted,
                                  prompt: Text("..."))
                            .font(.title)
                            .padding()
                        
                        
                        Button(action: {
                            
                            guard let grandTotalGiven = Double(grandTotalWanted) else {
                               
                                grandTotalInput = false
                                
                                return
                                
                            }
                            
                            grandTotal = grandTotalGiven - 0
                            
                        }, label: {
                            Text("Filter")
                        })
                        .padding()
                        
                        
                    }
                
                List(filtered(by: grandTotal,
                              from: history,
                              input: grandTotalInput)) { totals in
                    HistoryView(totalInput: totals.totalInput, numberOfPeople: totals.numberOfPeople, grandTotal: totals.grandTotal)
                        .padding()
                    
                    
                    }
                        
                Button(action: {
                    grandTotalWanted = ""
                    grandTotalInput = false

                    print("Resetting")
                }, label: {
                    Text("Reset")
                })
                .padding()
                
                    }
                                  
                                  .navigationTitle("History")
                                  
                                  Spacer()
                }
           
            }
            
            
        }
            
        
        
    
    
struct ListHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        LiveListHistoryView()
    }
}
    
    struct LiveListHistoryView: View {
        @State var historybills: [GrandTotal] = testGrandTotal

        var body: some View{
            SplitBillView(history: $historybills)
        }

    }

}
