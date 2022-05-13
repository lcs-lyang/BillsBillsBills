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
    
    @State var history: [GrandTotal] = []
    
    //MARK: COMPUTED PROPERTIES
    //using stored properties to calculate something
    
    var body: some View {
        NavigationView {
            ScrollView{
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
                            
                            HStack{
                                
                                Text("Tax:")
                                    .font(.title)
                                    .padding()
                                
                                Picker(selection: $taxInput,
                                       label: Text("Picker Name"),
                                       content: {
                                    
                                    //tag = is what the value is actually going to be inputed
                                    Text("HST").tag(0.13)
                                    Text("PST").tag(0.07)
                                    Text("GST").tag(0.05)
                                    
                                })
                                    .pickerStyle(MenuPickerStyle())
                                //How to make the values bigger?
                                    .font(.title)
                                Spacer()
                            }
                            
                            Spacer()
                        }
                        
                        
                        Spacer()
                    }
                    
                    //Button 1
                    ButtonView(totalCorrect: $totalCorrect, peopleCorrect: $peopleCorrect, tipCorrect: $tipCorrect, taxCorrect: $taxCorrect, totalInput: totalInput, numberOfPeople: numberOfPeople, tipInput: tipInput, grandTotal: $grandTotal, taxInput: $taxInput, history: $history)
                    
                    Text("Your grand total is: $\(String(format: "%.2f", grandTotal))")
                        .bold()
                        .opacity(peopleCorrect && totalCorrect == false ? 0.0 : 1.0)
                    
                    // Show results of prior questions attempted
                    List(history) { currentGrandTotal in
                        // Use a helper view to display each prior result
                        HistoryView(history: currentGrandTotal)
                        
                        Spacer()
                        
                    }
                    
                    
                    
                }
            }
            .navigationTitle("Split the Bill!")
        }
    }
}

struct SplitBillView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SplitBillView()
        }
    }
}
