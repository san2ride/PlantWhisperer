//
//  Date+Ext.swift
//  Plant Whisperer
//
//  Created by Jason Sanchez on 4/2/25.
//

import Foundation

extension Date {
    func daysAgo(_ days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -days, to: self) ?? self
    }
}
