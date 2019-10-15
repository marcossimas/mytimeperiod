//
//  TimePeriodReverseComparer.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 11/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//
 
import Foundation


// public sealed class TimePeriodReversComparer : ITimePeriodComparer {
class TimePeriodReverseComparer<G: TimePeriodComparerProtocol>  {
    
    
    
    
    
    // ----------------------------------------------------------------------
    // members
    //private readonly ITimePeriodComparer baseComparer;
    private var localBaseComparer: G
    
    
    
    
    // ----------------------------------------------------------------------
    /*public TimePeriodReversComparer( ITimePeriodComparer baseComparer )
    {
        this.baseComparer = baseComparer;
    } // TimePeriodReversComparer*/


    init(baseComparer: G) {
        
        localBaseComparer = baseComparer
    }
    
    
    
    
    
    // ----------------------------------------------------------------------
    /*public ITimePeriodComparer BaseComparer
    {
        get { return baseComparer; }
    } // BaseComparer*/


    var baseComparer: G {
        
        get { return localBaseComparer }
    }
    
    
    
    
    
    
    // ----------------------------------------------------------------------
    /*public int Compare( ITimePeriod left, ITimePeriod right )
    {
        return -baseComparer.Compare( left, right );
    } // Compare*/


    func compare(left: TimePeriodProtocol, right: TimePeriodProtocol) -> Int {
        
        //return -localBaseComparer.Compare( left, right );
        return 1
        
    }
    
    

} // class TimePeriodReverseComparer






    
    
    
    
    
    
    
    

    






    







    







