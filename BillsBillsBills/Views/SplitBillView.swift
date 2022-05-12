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
    
    @State var totalCorrect = false
    
    @State var peopleCorrect = false
    
    @State var tipCorrect = false
    
    @State var taxCorrect = false
    
    @State var grandTotal = 0.0
    
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
                        
                        HStack{
                            Text("Total: $")
                                .font(.title)
                                .padding()
                            TextField("",
                                      text: $totalInput,
                                      prompt: Text("..."))
                                .font(.title)
                            
                        }
                        
                        HStack{
                            Text("# of people:")
                                .font(.title)
                                .padding()
                            
                            TextField("",
                                      text: $numberOfPeople,
                                      prompt: Text("..."))
                                .font(.title)
                            
                        }
                        
                        HStack{
                            Text("Tip:")
                                .font(.title)
                                .padding()
                            
                            TextField("",
                                      text: $tipInput ,
                                      prompt: Text("..."))
                                .font(.title)
                            Text("%")
                                .font(.title)
                        }
                        
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
                Button(action: {
                    //guard statement to convert the string to integer
                    //remember, prices have decimalas, therefore it's a Double
                    
                    guard let totalGiven = Double(totalInput) else {
                        // not a number
                        totalCorrect = false
                        return
                    }
                    
                    guard let peopleGiven = Double(numberOfPeople) else {
                        // not a number
                        peopleCorrect = false
                        return
                    }
                    
                    guard let tipGiven = Double(tipInput) else {
                        // not a number
                        tipCorrect = false
                        return
                    }
                    print("total given is: \(totalGiven)")
                    print("people given is: \(peopleGiven)")
                    print("tax input is: \(taxInput)")
                    print("tipGiven is: \(tipGiven)")
                    print("grandTotal is: \(grandTotal)")
                    
                    grandTotal = ((totalGiven * taxInput)/2) + (totalGiven/peopleGiven) + ((totalGiven/peopleGiven)*(tipGiven/100))
                    
                    
                }, label: {
                    Text("Calculate Grand total")
                        .font(.title2)
                })
                    .buttonStyle(.bordered)
                    .padding()
                
                Text("Your grand total is: $\(String(format: "%.2f", grandTotal))")
                    .bold()
                    .opacity(peopleCorrect && totalCorrect == false ? 0.0 : 1.0)
                
                Spacer()
                
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
