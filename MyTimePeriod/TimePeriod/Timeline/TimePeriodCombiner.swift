//
//  TimePeriodCombiner.swift
//  MyTimePeriod
//
//  Created by Marcos Simas on 16/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation


//public class TimePeriodCombiner<T> where T : ITimePeriod, new() {
class TimePeriodCombiner<T> where T: TimePeriodProtocol {
    
    
    // members
    //private readonly ITimePeriodMapper periodMapper;
    var localPeriodMapper: TimePeriodMapperProtocol
    
    
    
    
    
    // ----------------------------------------------------------------------
    /*public TimePeriodCombiner() :
        this( null )
    {
    } // TimePeriodCombiner*/
    
    
    init() {
        
    } // TimePeriodCombiner
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimePeriodCombiner( ITimePeriodMapper periodMapper )
    {
        this.periodMapper = periodMapper;
    } // TimePeriodCombiner*/
    
    
    init(periodMapper: TimePeriodMapperProtocol)
    {
        localPeriodMapper = periodMapper
        
    } // TimePeriodCombiner
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public ITimePeriodMapper PeriodMapper
    {
        get { return periodMapper; }
    } // PeriodMapper*/
    
    
    var periodMapper: TimePeriodMapperProtocol
    {
        get { return localPeriodMapper }
        
    } // PeriodMapper
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public virtual ITimePeriodCollection CombinePeriods( ITimePeriodContainer periods )
    {
        if ( periods == null )
        {
            throw new ArgumentNullException( "periods" );
        }
        TimeLine<T> timeLine = new TimeLine<T>( periods, periodMapper );
        return timeLine.CombinePeriods();
    } // CombinePeriods*/
    
    
    func combinePeriods(periods: TimePeriodContainerProtocol?) -> TimePeriodCollectionProtocol {
    
        if (periods == nil)
        {
            //throw new ArgumentNullException( "periods" );
        }
        let timeline: Timeline<T> = Timeline<T>(periods: periods, periodMapper: localPeriodMapper)
        return timeline.combinePeriods()
        
        
    } // CombinePeriods
    
    
    

    
    

} // class TimePeriodCombiner
