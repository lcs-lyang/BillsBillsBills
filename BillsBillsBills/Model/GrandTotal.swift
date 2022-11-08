//
//  GrandTotal.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-05-12.
//

import Foundation

struct GrandTotal : Identifiable {
    let id = UUID()
    let totalInput: String
    let numberOfPeople: String
    let tipInput: String
    let taxInput: Double
    let totalCorrect: Bool
    let peopleCorrect: Bool
    let tipCorrect: Bool
    let taxCorrect: Bool
    let grandTotal: Double
}

let testGrandTotal = [
    GrandTotal(totalInput: "10", numberOfPeople: "2", tipInput: "5", taxInput: 10.0, totalCorrect: false, peopleCorrect: false, tipCorrect: false, taxCorrect: false, grandTotal: 100.0)
    
    ,
    
    
    GrandTotal(totalInput: "11", numberOfPeople: "3", tipInput: "6", taxInput: 11.0, totalCorrect: false, peopleCorrect: false, tipCorrect: false, taxCorrect: false, grandTotal: 110.0)
    ]
