//
//  TimePeriodEndComparer.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 11/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//
 
import Foundation


// public sealed class TimePeriodEndComparer : ITimePeriodComparer {
class TimePeriodEndComparer<G: TimePeriodComparerProtocol>  {
    
    
    
    // ----------------------------------------------------------------------
    //public static ITimePeriodComparer Comparer = new TimePeriodEndComparer();
    var comparer: G = TimePeriodEndComparer() as! G
    
    
    
    // public static ITimePeriodComparer ReverseComparer = new TimePeriodReversComparer( new TimePeriodEndComparer() );
    var reverseComparer: G = TimePeriodReverseComparer(baseComparer: TimePeriodEndComparer() as! G) as! G
    
    
    
    
    // ----------------------------------------------------------------------
    /*public int Compare( ITimePeriod left, ITimePeriod right )
    {
        return left.End.CompareTo( right.End );
    } // Compare*/



    
    func compare(left: TimePeriodProtocol, right: TimePeriodProtocol) -> Int {
        
        //return left.End.CompareTo( right.End );
        return 1
        
    }
    
    
    

} // class TimePeriodEndComparer
