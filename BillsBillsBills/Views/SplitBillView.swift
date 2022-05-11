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
    @State var dateInput = ""
    
    @State var totalInput = ""
    
    @State var numberOFPeople = ""
    
    @State var tipInput = ""
    
    @State var taxInput = ""
    
    //MARK: COMPUTED PROPERTIES
    
    //Calculation
    //var calculation: Int{
    //    return tipInput/100
   // }
    
    
    var body: some View {
        
        VStack{
            HStack{
                
                VStack(alignment: .leading){
                    
                    DatePicker("Date:",
                               selection: .constant(Date()),
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
                                  text: $numberOFPeople,
                                  prompt: Text("..."))
                            .font(.title)
                          
                    }
                    
                    HStack{
                        Text("Tip:")
                            .font(.title)
                            .padding()
                        
                        TextField("",
                                  text: $tipInput,
                                  prompt: Text("..."))
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
                        //How to make the values bigger
                        .font(.title)
                            
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            
            Button(action: {
                // NOTE: Output will not be shown unless this app is run in the "full" simulator
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
