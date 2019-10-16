//
//  TimePeriodCalc.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 11/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation




// internal static class TimePeriodCalc {
class TimePeriodCalc {


    /*// ----------------------------------------------------------------------
    public static bool HasInside( ITimePeriod period, DateTime test )
    {
        return test >= period.Start && test <= period.End;
    } // HasInside*/
    
    
    
    static func hasInside(period: TimePeriodProtocol, test: Date) -> Bool {
        
        return test >= period.start && test <= period.end
        
    }
    
    






    /*// ----------------------------------------------------------------------
    public static bool HasInside( ITimePeriod period, ITimePeriod test )
    {
        return HasInside( period, test.Start ) && HasInside( period, test.End );
    } // HasInside*/



    
    static func hasInside(period: TimePeriodProtocol, test: TimePeriodProtocol) -> Bool {
        
        return hasInside(period: period, test: test.start ) && hasInside(period: period, test: test.end)
        
    }
    
    
    
    
    



    /*// ----------------------------------------------------------------------
    public static bool IntersectsWith( ITimePeriod period, ITimePeriod test )
    {
        return
            HasInside( period, test.Start ) ||
            HasInside( period, test.End ) ||
            ( test.Start < period.Start && test.End > period.End );
    } // IntersectsWith*/



    
    static func intersectsWith(period: TimePeriodProtocol, test: TimePeriodProtocol) -> Bool {
        
        return hasInside(period: period, test: test.start ) || hasInside(period: period, test: test.end ) || ( test.start < period.start && test.end > period.end )
        
    }
    
    
    
    
    



    /*// ----------------------------------------------------------------------
    public static bool OverlapsWith( ITimePeriod period, ITimePeriod test )
    {
        PeriodRelation relation = GetRelation( period, test );
        return
            relation != PeriodRelation.After &&
            relation != PeriodRelation.StartTouching &&
            relation != PeriodRelation.EndTouching &&
            relation != PeriodRelation.Before;
    } // OverlapsWith*/



    
    static func overlapsWith(period: TimePeriodProtocol, test: TimePeriodProtocol) -> Bool {
        
        let relation: PeriodRelation = getRelation(period: period, test: test)
        return
            relation != PeriodRelation.after &&
            relation != PeriodRelation.startTouching &&
            relation != PeriodRelation.endTouching &&
            relation != PeriodRelation.before
        
    }
    
    
    
    
    
    
    
    


/*
    // ----------------------------------------------------------------------
    public static PeriodRelation GetRelation( ITimePeriod period, ITimePeriod test )
    {
        if ( test.End < period.Start )
        {
            return PeriodRelation.After;
        }
        if ( test.Start > period.End )
        {
            return PeriodRelation.Before;
        }
        if ( test.Start == period.Start && test.End == period.End )
        {
            return PeriodRelation.ExactMatch;
        }
        if ( test.End == period.Start )
        {
            return PeriodRelation.StartTouching;
        }
        if ( test.Start == period.End )
        {
            return PeriodRelation.EndTouching;
        }
        if ( HasInside( period, test ) )
        {
            if ( test.Start == period.Start )
            {
                return PeriodRelation.EnclosingStartTouching;
            }
            return test.End == period.End ? PeriodRelation.EnclosingEndTouching : PeriodRelation.Enclosing;
        }
        bool periodContainsMyStart = HasInside( test, period.Start );
        bool periodContainsMyEnd = HasInside( test, period.End );
        if ( periodContainsMyStart && periodContainsMyEnd )
        {
            if ( test.Start == period.Start )
            {
                return PeriodRelation.InsideStartTouching;
            }
            return test.End == period.End ? PeriodRelation.InsideEndTouching : PeriodRelation.Inside;
        }
        if ( periodContainsMyStart )
        {
            return PeriodRelation.StartInside;
        }
        if ( periodContainsMyEnd )
        {
            return PeriodRelation.EndInside;
        }
        throw new InvalidOperationException( "invalid period relation of '" + period + "' and '" + test + "'" );
    } // GetRelation*/
    
    
    
    
    
    
    static func getRelation(period: TimePeriodProtocol, test: TimePeriodProtocol) -> PeriodRelation {
        
        
        
        if (test.end < period.start)
        {
            return PeriodRelation.after
        }
        
        
        
        
        if (test.start > period.end)
        {
            return PeriodRelation.before
        }
        
        
        
        
        if (test.start == period.start && test.end == period.end)
        {
            return PeriodRelation.exactMatch
        }
        
        
        
        
        if (test.end == period.start)
        {
            return PeriodRelation.startTouching
        }
        
        
        
        
        if (test.start == period.end)
        {
            return PeriodRelation.endTouching
        }
        
        
        
        
        if (hasInside(period: period, test: test))
        {
            if (test.start == period.start)
            {
                return PeriodRelation.enclosingStartTouching
            }
            return test.end == period.end ? PeriodRelation.enclosingEndTouching : PeriodRelation.enclosing
        }
        
        
        
        
        
        let periodContainsMyStart: Bool = hasInside(period: test, test: period.start)
        let periodContainsMyEnd: Bool = hasInside(period: test, test: period.end)
        
        
        if ( periodContainsMyStart && periodContainsMyEnd )
        {
            if (test.start == period.start)
            {
                return PeriodRelation.insideStartTouching
            }
            return test.end == period.end ? PeriodRelation.insideEndTouching : PeriodRelation.inside
        }
        
        
        
        
        
        if (periodContainsMyStart)
        {
            return PeriodRelation.startInside
        }
        
        
        
        
        
        if (periodContainsMyEnd)
        {
            return PeriodRelation.endInside
        }
        
        //throw new InvalidOperationException( "invalid period relation of '" + period + "' and '" + test + "'" )
        
        
        return PeriodRelation.none
        
        
        
    }
    
    
    
    





} // TimePeriodCalc
