//
//  SortType.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 05/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation



enum SortType {
    

    /// - start: sort by start date
    /// - end: sort by end date
    /// - duration: sort by duration
    /// - custom: sort using custom function
    case start(_: SortDirection)
    case end(_: SortDirection)
    case duration(_: SortDirection)
    case custom(_: ((TimePeriodProtocol, TimePeriodProtocol) -> Bool))
    
    
    
} // SortType
