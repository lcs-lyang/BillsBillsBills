//
//  FilterFunction.swift
//  BillsBillsBills
//
//  Created by Lillian Yang on 2022-11-03.
//

import Foundation

func filtered(by grandTotal: Double, from list: [GrandTotal], input: Bool) -> [GrandTotal] {


    //Not filtering when there is no input
    if input == false {
        return list
    } else {


        print("Grand Total is: \(grandTotal)")
        print(list)

        let totalRange = 0.0...10000000.0

        var filteredTotals: [GrandTotal] = []

        for totals in list {

            //Look for a total in the desired range
            if totalRange.contains(totals.grandTotal) {
                filteredTotals.append(totals)
            }

        }


        //Return the list of filtered totals
        return filteredTotals
    }


}
