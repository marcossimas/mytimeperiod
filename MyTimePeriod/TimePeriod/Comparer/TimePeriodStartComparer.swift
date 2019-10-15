//
//  TimePeriodStartComparer.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 11/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//
 
import Foundation


// public sealed class TimePeriodStartComparer : ITimePeriodComparer {
class TimePeriodStartComparer<G: TimePeriodComparerProtocol>  {
    
    
    
    // ----------------------------------------------------------------------
    //public static ITimePeriodComparer Comparer = new TimePeriodStartComparer();
    var comparer: G = TimePeriodStartComparer() as! G
    
    
    
    
    // public static ITimePeriodComparer ReverseComparer = new TimePeriodReversComparer( new TimePeriodStartComparer() );
    var reverseComparer: G = TimePeriodReverseComparer(baseComparer: TimePeriodStartComparer() as! G) as! G
    
    
    
    
    // ----------------------------------------------------------------------
    /*public int Compare( ITimePeriod left, ITimePeriod right )
    {
        return left.Start.CompareTo( right.Start );
    } // Compare*/



    
    func compare(left: TimePeriodProtocol, right: TimePeriodProtocol) -> Int {
        
        //return left.Start.CompareTo( right.Start );
        return 1
        
    }
    
    
    

} // class TimePeriodStartComparer
