//
//  TimeGapCalculator.swift
//  MyTimePeriod
//
//  Created by Marcos Simas on 15/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation



//public class TimeGapCalculator<T> where T : ITimePeriod, new() {
class TimeGapCalculator<T> where T: TimePeriodProtocol {
    
    
    
    
    
    // members
    //private readonly ITimePeriodMapper periodMapper;
    var localPeriodMapper: TimePeriodMapperProtocol?
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeGapCalculator() :
        this( null )
    {
    } // TimeGapCalculator*/
    
    
    init() {
        
        self.localPeriodMapper = nil
        
    }
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeGapCalculator( ITimePeriodMapper periodMapper )
    {
        this.periodMapper = periodMapper;
    }*/
    
    
    
    init(periodMapper: TimePeriodMapperProtocol) {
    
        self.localPeriodMapper = periodMapper
        
    }
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public ITimePeriodMapper PeriodMapper
    {
        get { return periodMapper; }
    } // PeriodMapper*/
    
    
    
    var periodMapper: TimePeriodMapperProtocol {

        get { return localPeriodMapper! }
        
        
    } // PeriodMapper
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public virtual ITimePeriodCollection GetGaps( ITimePeriodContainer periods, ITimePeriod limits = null )
    {
        if ( periods == null )
        {
            throw new ArgumentNullException( "periods" );
        }
        TimeLine<T> timeLine = new TimeLine<T>( periods, limits, periodMapper );
        return timeLine.CalculateGaps();
    } // GetGaps*/
    
    
    
    func getGaps(periods: TimePeriodCollection? , limits: TimePeriodProtocol?  = nil) -> TimePeriodCollection {
    
        if (periods == nil)
        {
            //throw new ArgumentNullException( "periods" );
        }
        
        let timeline = Timeline<T>(periods: periods, limits: limits, periodMapper: periodMapper)
        
        return timeline.calculateGaps()
        
    } // GetGaps
    
    
    
    
    
    


    
    
    
    
    
    
    


} // class TimeGapCalculator
