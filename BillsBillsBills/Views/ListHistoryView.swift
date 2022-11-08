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
    
    @State var filterTotal = ""
    
    @State var grandTotalInput = false
    
    @Binding var history: [GrandTotal]
    
    //MARK: COMPUTED PROPERTIES
    //using stored properties to calculate something
    
    var body: some View {
        NavigationView {
            
            VStack{
               
                HStack{
                    TextField("",
                              text: $filterTotal,
                              prompt: Text("..."))
                        .font(.title)
                    
                    Button(action: {
                        filterTotal = ""
                        grandTotalInput = false
                        print("Resetting")
                    }, label: {
                        Text("Reset")
                    })
                    
                }
               
                
                
                    List(filtered(by: grandTotal,
                                  from: history,
                                  input: grandTotalInput)) { totals in
                        HistoryView(totalInput: "", numberOfPeople: "", grandTotal: totals.grandTotal)
                        
                    }
                                  .padding()
//                                  .onChange(of: filterTotal) { newValue in
//
//                                      //the user has selected a hue, so start filtering
//                                      if newValue > 0 {
//                                          grandTotalInput = true
//                                      }
//
//                                      print("A selection has been made")
//
//                                  }
                    
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
