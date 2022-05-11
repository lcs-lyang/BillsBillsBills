//
//  SplitBillView.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-10.
//

import SwiftUI

struct SplitBillView: View {
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
                                  text: .constant(""),
                                  prompt: Text("Input total..."))
                            .font(.title)
                          
                    }
                    
                    HStack{
                        Text("# of people:")
                            .font(.title)
                            .padding()
                        
                        TextField("",
                                  text: .constant(""),
                                  prompt: Text("Input total..."))
                            .font(.title)
                          
                    }
                    
                    HStack{
                        Text("Tip:")
                            .font(.title)
                            .padding()
                        
                        TextField("",
                                  text: .constant(""),
                                  prompt: Text("Input total..."))
                            .font(.title)
                            
                    }
                    
                    HStack{
                        
                        Text("Tax:")
                            .font(.title)
                            .padding()
                        
                        Picker(selection: .constant(""),
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
