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
    
    @State var taxInput = ""
    
    @State var totalCorrect = false
    
    @State var peopleCorrect = false
    
    let HST = 0.13
    
    let PST = 0.07
    
    let GST = 0.05
    
    @State var subTotal = 0.0
    
    //MARK: COMPUTED PROPERTIES
    //using stored properties to calculate something
   
    var body: some View {
        
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
                        
                        subTotal = totalGiven / peopleGiven
                        
                        
                    }, label: {
                        Text("Calculate Subtotal")
                            .font(.title2)
                    })
                        .buttonStyle(.bordered)
                        .padding()
                    
                    Text("Your subtotal is: $\(subTotal)")
                    
                    Divider()
                    
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
                            
                            Text("HST").tag(0)
                            Text("PST").tag(1)
                            Text("GST").tag(2)
                            
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
            
            Button(action: {
                print("Button was pressed")
            }, label: {
                Text("Calculate Total")
                    .font(.title)
            })
                .buttonStyle(.bordered)
            
            Text("Your total is:")
                .font(.title)
                .bold()
            
            Spacer()
            
        }
        .navigationTitle("Split the Bill!")
    }
    
}

struct SplitBillView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SplitBillView()
        }
    }
}
