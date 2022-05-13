//
//  TaxInputView.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-12.
//

import SwiftUI

struct TaxInputView: View {
    
    @Binding var taxInput: Double
    
    var body: some View {
        
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
    }
}

struct TaxInputView_Previews: PreviewProvider {
    static var previews: some View {
        TaxInputView(taxInput: .constant(0.05))
    }
}
