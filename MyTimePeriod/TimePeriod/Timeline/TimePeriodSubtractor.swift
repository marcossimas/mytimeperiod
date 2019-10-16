//
//  TimePeriodSubtractor.swift
//  MyTimePeriod
//
//  Created by Marcos Simas on 16/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation



class TimePeriodSubtractor<T> where T: TimePeriodProtocol {
    
    
    
    
    
    // ----------------------------------------------------------------------
    // members
    //private readonly ITimePeriodMapper periodMapper;
    var localPeriodMapper: TimePeriodMapperProtocol?
    
    
    //private readonly TimePeriodCombiner<T> timePeriodCombiner;
    var timePeriodCombiner: TimePeriodCombiner<T>?
    
    
    
    //private readonly TimeGapCalculator<T> timeGapCalculator;
    var timeGapCalculator: TimeGapCalculator<T>?
    
    
    
    //private readonly TimePeriodIntersector<T> timePeriodIntersector;
    var timePeriodIntersector: TimePeriodIntersector<T>?
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimePeriodSubtractor() :
        this( null )
    {
    } // TimePeriodSubtractor*/
    
    
    
    init() {
        
        
        localPeriodMapper = nil
        timePeriodCombiner = nil
        timeGapCalculator = nil
        timePeriodIntersector = nil
        
        
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
        timePeriodCombiner = TimePeriodCombiner<T>(periodMapper: periodMapper)
        timeGapCalculator = TimeGapCalculator<T>(periodMapper: periodMapper)
        timePeriodIntersector = TimePeriodIntersector<T>(periodMapper: periodMapper)
        
    } // TimePeriodSubtractor
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public ITimePeriodMapper PeriodMapper
    {
        get { return periodMapper; }
    } // PeriodMapper*/
    
    
    var periodMapper: TimePeriodMapperProtocol {
    
        get { return localPeriodMapper! }
        
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
    
    
    func subtractPeriods(sourcePeriods: TimePeriodCollection?, subtractingPeriods: TimePeriodCollection?, combinePeriods: Bool  = true ) -> TimePeriodCollectionProtocol {
        
        var localSourcePeriods: TimePeriodCollection? = sourcePeriods
        
        var localSubtractingPeriods: TimePeriodCollection? = subtractingPeriods
            
        if (localSourcePeriods == nil)
        {
            //throw new ArgumentNullException( "sourcePeriods" );
        }
        if (localSubtractingPeriods == nil)
        {
            //throw new ArgumentNullException( "subtractingPeriods" );
        }

        if (localSourcePeriods!.count == 0)
        {
            return TimePeriodCollection()
        }

        if (localSubtractingPeriods!.count == 0 && !combinePeriods)
        {
            return TimePeriodCollection(timePeriods: localSourcePeriods!.periods)
        }

        // combined source periods
        localSourcePeriods = timePeriodCombiner!.combinePeriods(periods: localSourcePeriods!)

        // combined subtracting periods
        if (localSubtractingPeriods!.count == 0)
        {
            return TimePeriodCollection(timePeriods: localSourcePeriods!.periods)
        }
        localSubtractingPeriods = timePeriodCombiner!.combinePeriods(periods: localSubtractingPeriods!)

        // invert subtracting periods
        localSourcePeriods!.addAll(periods: timeGapCalculator!.getGaps(periods: localSubtractingPeriods, limits: TimeRange(start: localSourcePeriods!.start!, end: localSourcePeriods!.end!)).periods)

        return timePeriodIntersector!.intersectPeriods(periods: localSourcePeriods, combinePeriods: combinePeriods)
        
            
    } // SubtractPeriods
    
    

    
    
    
    

} // class TimePeriodSubtractor
