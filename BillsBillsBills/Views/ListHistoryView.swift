//
//  ListHistoryView.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-12.
//

import SwiftUI

struct ListHistoryView: View {
    
    //MARK: STORED PROPERTIES
    
    @State var grandTotalInput = false
    
    @State var grandTotalWanted = ""
    
    @Binding var history: [GrandTotal]
    
    //MARK: COMPUTED PROPERTIES
    
//    @State var grandTotal = 0.0
    
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
                       grandTotalInput = true
                        print("Filtering")
                    }, label: {
                        Text("Filter")
                    })
                    
                }
                        
                
                List(filtered(by: grandTotalWanted,
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
