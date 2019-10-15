//
//  TimePeriodComparerProtocol.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 11/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

 
import Foundation




// public interface ITimePeriodComparer : IComparer<ITimePeriod> {
protocol TimePeriodComparerProtocol {
    
    func compare(left: TimePeriodProtocol, right: TimePeriodProtocol) -> Int
    
    
    
    
} // TimePeriodComparerProtocol
