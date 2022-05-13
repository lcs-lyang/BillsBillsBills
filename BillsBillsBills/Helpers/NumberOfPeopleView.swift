//
//  NumberOfPeopleView.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-12.
//

import SwiftUI

struct NumberOfPeopleView: View {
    
    @Binding var numberOfPeople: String
    
    var body: some View {
        
        HStack{
            Text("# of people:")
                .font(.title)
                .padding()
            
            TextField("",
                      text: $numberOfPeople,
                      prompt: Text("..."))
                .font(.title)
            
        }
    }
}

struct NumberOfPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        NumberOfPeopleView(numberOfPeople: .constant("2"))
    }
}
