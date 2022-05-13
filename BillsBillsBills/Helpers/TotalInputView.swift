//
//  TotalInputView.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-12.
//

import SwiftUI

struct TotalInputView: View {
    
    @Binding var totalInput: String
    
    var body: some View {
       
        HStack{
            Text("Total: $")
                .font(.title)
                .padding()
            TextField("",
                      text: $totalInput,
                      prompt: Text("..."))
                .font(.title)
            
        }
        
    }
}

struct TotalInputView_Previews: PreviewProvider {
    static var previews: some View {
        TotalInputView(totalInput: .constant("100"))
    }
}
