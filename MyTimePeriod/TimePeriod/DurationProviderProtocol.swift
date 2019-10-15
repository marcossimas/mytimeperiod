//
//  DurationProviderProtocol.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 05/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation


// public interface IDurationProvider {
protocol DurationProviderProtocol {
    

    // ----------------------------------------------------------------------
    //TimeSpan GetDuration( DateTime start, DateTime end );
    func getDuration(start: Date, end: Date) -> TimeInterval
    

} // interface IDurationProvider
