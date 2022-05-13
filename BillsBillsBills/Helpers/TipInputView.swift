//
//  TipInputView.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-12.
//

import SwiftUI

struct TipInputView: View {
    
    @Binding var tipInput: String
    
    var body: some View {
      
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
    }
}

struct TipInputView_Previews: PreviewProvider {
    static var previews: some View {
        TipInputView(tipInput: .constant("100"))
    }
}
