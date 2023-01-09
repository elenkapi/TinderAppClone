//
//  Date+Extensions.swift
//  Tinder
//
//  Created by Ellen_Kapii on 09.01.23.
//

import UIKit

extension Date {
    func interval(ofComponent comp: Calendar.Component, fromDate date: Date) -> Int {
        let currentCalendar = Calendar.current
        
        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0}
        
        return end - start
    }
    
    func calculatedAge(for date: Date) -> Int {
        let currentCalendar = Calendar.current
        let startYear = currentCalendar.dateComponents([.year], from: self)
        let endYear = currentCalendar.dateComponents([.year], from: date)
        guard let start = startYear.year else { return 0 }
        guard let end = endYear.year else { return 0 }
        
        return end - start
    }
}
