//
//  TimePeriodIntersector.swift
//  MyTimePeriod
//
//  Created by Marcos Simas on 16/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation




//public class TimePeriodIntersector<T> where T : ITimePeriod, new() {
class TimePeriodIntersector<T> where T: TimePeriodProtocol {
    
    
    
    // ----------------------------------------------------------------------
    // members
    //private readonly ITimePeriodMapper periodMapper;
    var localPeriodMapper: TimePeriodMapperProtocol?
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimePeriodIntersector() :
        this( null )
    {
    } // TimePeriodIntersector*/
    
    
    
    init() {
        
        localPeriodMapper = nil
        
    } // TimePeriodIntersector
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimePeriodIntersector( ITimePeriodMapper periodMapper )
    {
        this.periodMapper = periodMapper;
    } // TimePeriodIntersector*/
    
    
    init(periodMapper: TimePeriodMapperProtocol)
    {
        localPeriodMapper = periodMapper
        
    } // TimePeriodIntersector
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public ITimePeriodMapper PeriodMapper
    {
        get { return periodMapper; }
    } // PeriodMapper*/
    
    
    var periodMapper: TimePeriodMapperProtocol
    {
        
        get { return localPeriodMapper! }
        
    } // PeriodMapper
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public virtual ITimePeriodCollection IntersectPeriods( ITimePeriodContainer periods, bool combinePeriods = true )
    {
        if ( periods == null )
        {
            throw new ArgumentNullException( "periods" );
        }
        TimeLine<T> timeLine = new TimeLine<T>( periods, periodMapper );
        return timeLine.IntersectPeriods( combinePeriods );
    } // IntersectPeriods*/
    
    
    
    func intersectPeriods(periods: TimePeriodCollection?, combinePeriods: Bool  = true) -> TimePeriodCollectionProtocol {
    
        if (periods == nil)
        {
            //throw new ArgumentNullException( "periods" );
        }
        let timeline: Timeline<T> = Timeline<T>(periods: periods, periodMapper: periodMapper)
        return timeline.intersectPeriods(combinePeriods: combinePeriods)
        
    } // IntersectPeriods
    
    
    
    
    
    

    
    
    
    

} // class TimePeriodIntersector
