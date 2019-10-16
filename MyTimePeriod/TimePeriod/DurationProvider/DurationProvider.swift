//
//  DurationProvider.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 11/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation



// public class DurationProvider : IDurationProvider {
class DurationProvider: DurationProviderProtocol {
    
    

    /*// ----------------------------------------------------------------------
    public virtual TimeSpan GetDuration( DateTime start, DateTime end )
    {
        return end.Subtract( start );
    } // GetDuration*/
    
    
    
    func getDuration(start: Date, end: Date) -> TimeInterval {
        
        return end.timeIntervalSince(start)
        
    }
    
    

    
    
} // DurationProvider
