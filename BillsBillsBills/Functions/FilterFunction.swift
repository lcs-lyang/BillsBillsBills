//
//  FilterFunction.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-11-03.
//

import Foundation

func filtered(by grandTotal: String, from list: [GrandTotal], input: Bool) -> [GrandTotal] {


    //Not filtering when there is no input
    if input == false {
        return list
    } else {


        print("Grand Total is: \(grandTotal)")
        print(list)
        
//        let totalRange = 0.0...10000000.0

        var filteredTotals: [GrandTotal] = []

        for totals in list {
            
            //As we iterate through the list of totals, we are checkcing what the user is searching for, is added to the filtered totals, if it corresponds to the grandtotal condition (vv) 
            if Double(grandTotal) == totals.grandTotal {
//            if totalRange.contains(totals.grandTotal) {
                filteredTotals.append(totals)
            }

        }


        //Return the list of filtered totals
        return filteredTotals
    }


}

//The issue was that we saved the grand total values
