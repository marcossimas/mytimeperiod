//
//  TimePeriodDurationComparer.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 11/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//
 
import Foundation


// public sealed class TimePeriodDurationComparer : ITimePeriodComparer {
class TimePeriodDurationComparer<G: TimePeriodComparerProtocol>  {
    

    // ----------------------------------------------------------------------
    // public static ITimePeriodComparer Comparer = new TimePeriodDurationComparer();
    var comparer: G = TimePeriodDurationComparer() as! G
    
    
    
    // public static ITimePeriodComparer ReverseComparer = new TimePeriodReversComparer( new TimePeriodDurationComparer() );
    var reverseComparer: G = TimePeriodReverseComparer(baseComparer: TimePeriodDurationComparer() as! G) as! G

    
    
    
    
    // ----------------------------------------------------------------------
    /*public int Compare( ITimePeriod left, ITimePeriod right )
    {
        return left.Duration.CompareTo( right.Duration );
    } // Compare*/
    
    
    
    func compare(left: TimePeriodProtocol, right: TimePeriodProtocol) -> Int {
        
        //return left.duration.compareTo(right.duration)
        return 1
    }
    
    
    

} // class TimePeriodDurationComparer

