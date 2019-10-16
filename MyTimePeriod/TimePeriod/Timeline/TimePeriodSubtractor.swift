//
//  TimePeriodSubtractor.swift
//  MyTimePeriod
//
//  Created by Marcos Simas on 16/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation



public class TimePeriodSubtractor<T> where T : ITimePeriod {
    
    
    
    
    
    // ----------------------------------------------------------------------
    // members
    //private readonly ITimePeriodMapper periodMapper;
    var localPeriodMapper: TimePeriodMapperProtocol
    
    
    //private readonly TimePeriodCombiner<T> timePeriodCombiner;
    var timePeriodCombiner: TimePeriodCombiner<T>
    
    
    
    //private readonly TimeGapCalculator<T> timeGapCalculator;
    var timeGapCalculator: TimeGapCalculator<T>
    
    
    
    //private readonly TimePeriodIntersector<T> timePeriodIntersector;
    var timePeriodIntersector: TimePeriodIntersector<T>
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimePeriodSubtractor() :
        this( null )
    {
    } // TimePeriodSubtractor*/
    
    
    
    init() {
        
    } // TimePeriodSubtractor
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimePeriodSubtractor( ITimePeriodMapper periodMapper )
    {
        this.periodMapper = periodMapper;
        timePeriodCombiner = new TimePeriodCombiner<T>( periodMapper );
        timeGapCalculator = new TimeGapCalculator<T>( periodMapper );
        timePeriodIntersector = new TimePeriodIntersector<T>( periodMapper );
    } // TimePeriodSubtractor*/
    
    
    
    init(periodMapper: TimePeriodMapperProtocol)
    {
        
        localPeriodMapper = periodMapper
        timePeriodCombiner = TimePeriodCombiner<T>(periodMapper)
        timeGapCalculator = TimeGapCalculator<T>(periodMapper)
        timePeriodIntersector = TimePeriodIntersector<T>(periodMapper)
        
    } // TimePeriodSubtractor
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public ITimePeriodMapper PeriodMapper
    {
        get { return periodMapper; }
    } // PeriodMapper*/
    
    
    var periodMapper: TimePeriodMapperProtocol {
    
        get { return localPeriodMapper }
        
    } // PeriodMapper
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual ITimePeriodCollection SubtractPeriods( ITimePeriodContainer sourcePeriods, ITimePeriodCollection subtractingPeriods,
        bool combinePeriods = true )
    {
        if ( sourcePeriods == null )
        {
            throw new ArgumentNullException( "sourcePeriods" );
        }
        if ( subtractingPeriods == null )
        {
            throw new ArgumentNullException( "subtractingPeriods" );
        }

        if ( sourcePeriods.Count == 0 )
        {
            return new TimePeriodCollection();
        }

        if ( subtractingPeriods.Count == 0 && !combinePeriods )
        {
            return new TimePeriodCollection( sourcePeriods );
        }

        // combined source periods
        sourcePeriods = timePeriodCombiner.CombinePeriods( sourcePeriods );

        // combined subtracting periods
        if ( subtractingPeriods.Count == 0 )
        {
            return new TimePeriodCollection( sourcePeriods );
        }
        subtractingPeriods = timePeriodCombiner.CombinePeriods( subtractingPeriods );

        // invert subtracting periods
        sourcePeriods.AddAll( timeGapCalculator.GetGaps( subtractingPeriods, new TimeRange( sourcePeriods.Start, sourcePeriods.End ) ) );

        return timePeriodIntersector.IntersectPeriods( sourcePeriods, combinePeriods );
    } // SubtractPeriods*/
    
    
    func subtractPeriods(sourcePeriods: TimePeriodContainerProtocol, subtractingPeriods: TimePeriodCollectionProtocol, combinePeriods: Bool  = true ) -> TimePeriodCollectionProtocol {
            
        if (sourcePeriods == nil)
        {
            //throw new ArgumentNullException( "sourcePeriods" );
        }
        if (subtractingPeriods == nil)
        {
            //throw new ArgumentNullException( "subtractingPeriods" );
        }

        if (sourcePeriods.Count == 0)
        {
            return TimePeriodCollection()
        }

        if (subtractingPeriods.count == 0 && !combinePeriods)
        {
            return TimePeriodCollection(sourcePeriods)
        }

        // combined source periods
        sourcePeriods = timePeriodCombiner.combinePeriods(sourcePeriods)

        // combined subtracting periods
        if (subtractingPeriods.count == 0)
        {
            return TimePeriodCollection(sourcePeriods)
        }
        subtractingPeriods = timePeriodCombiner.combinePeriods(subtractingPeriods)

        // invert subtracting periods
        sourcePeriods.addAll(timeGapCalculator.getGaps(subtractingPeriods, TimeRange(sourcePeriods.start, sourcePeriods.end)))

        return timePeriodIntersector.intersectPeriods(sourcePeriods, combinePeriods)
        
            
    } // SubtractPeriods
    
    

    
    
    
    

} // class TimePeriodSubtractor
