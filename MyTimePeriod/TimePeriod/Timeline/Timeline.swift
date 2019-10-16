//
//  Timeline.swift
//  DateTools
//
//  Created by Grayson Webster on 8/17/16.
//  Copyright © 2016 Grayson Webster. All rights reserved.
//

import Foundation


//public class TimeLine<T> : ITimeLine where T : ITimePeriod, new() {
class Timeline<T>: TimelineProtocol where T : TimePeriodProtocol {
    
    
    
    // members
    //private readonly ITimeRange limits;
    var localLimits: TimeRangeProtocol?
    
    //private readonly ITimePeriodContainer periods;
    var localPeriods: TimePeriodContainerProtocol?
    
    //private readonly ITimePeriodMapper periodMapper;
    var localPeriodMapper: TimePeriodMapperProtocol?
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeLine( ITimePeriodContainer periods, ITimePeriodMapper periodMapper = null ) :
        this( periods, null, periodMapper )
    {
    } // TimeLine*/
    
    
    init(periods: TimePeriodContainerProtocol, periodMapper: TimePeriodMapperProtocol? = nil) {
        
        localPeriods = periods
        localLimits = nil
        localPeriodMapper = periodMapper!
        
    } // TimeLine
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeLine( ITimePeriodContainer periods, ITimePeriod limits = null, ITimePeriodMapper periodMapper = null )
    {
        if ( periods == null )
        {
            throw new ArgumentNullException( "periods" );
        }

        this.limits = limits != null ? new TimeRange( limits ) : new TimeRange( periods );
        this.periods = periods;
        this.periodMapper = periodMapper;
    } // TimeLine*/
    
    
    
    init(periods: TimePeriodContainerProtocol?, limits: TimePeriodProtocol? = nil, periodMapper: TimePeriodMapperProtocol? = nil) {
        
        if (periods == nil)
        {
            //throw new ArgumentNullException( "periods" );
        }

        localLimits = limits != nil ? TimeRange(copy: limits) : TimeRange(copy: periods)
        localPeriods = periods!
        localPeriodMapper = periodMapper!
        
    } // TimeLine
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public ITimePeriodContainer Periods
    {
        get { return periods; }
    } // Periods*/
    
    
    var periods: TimePeriodContainerProtocol? {
    
        get { return localPeriods! }
        
    } // Periods
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public ITimePeriod Limits
    {
        get { return limits; }
    } // Limits*/
    
    
    var limits: TimePeriodProtocol? {
    
        get { return localLimits }
        
    } // Limits
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public ITimePeriodMapper PeriodMapper
    {
        get { return periodMapper; }
    } // PeriodMapper*/
    
    
    
    var periodMapper: TimePeriodMapperProtocol? {
    
        get { return localPeriodMapper! }
        
    } // PeriodMapper
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*private bool HasNonMomentPeriods
    {
        get
        {
            foreach (ITimePeriod period in periods)
            {
                if (!period.IsMoment)
                {
                    return true;
                }
            }
            return false;
        }
    } // HasNonEmptyPeriods*/
    
    
    
    var hasNonMomentPeriods: Bool {
    
        get
        {
            for period in periods {
            
                if (!period.isMoment)
                {
                    return true
                }
            }
            return false
        }
        
    } // HasNonEmptyPeriods
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public bool HasOverlaps()
    {
        return GetTimeLineMoments().HasOverlaps();
    } // HasOverlaps*/
    
    
    
    func hasOverlaps() -> Bool {
    
        return getTimelineMoments().hasOverlaps()
    
    } // HasOverlaps
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public bool HasGaps()
    {
        return GetTimeLineMoments().HasGaps();
    } // HasGaps*/
    
    
    
    func hasGaps() -> Bool {
    
        return getTimelineMoments().hasGaps()
        
    } // HasGaps
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public ITimePeriodCollection CombinePeriods()
    {
        if ( periods.Count == 0 || ( periods.Count > 1 && !HasNonMomentPeriods ) )
        {
            return new TimePeriodCollection();
        }

        ITimeLineMomentCollection timeLineMoments = GetTimeLineMoments();
        return timeLineMoments.Count == 0 ? new TimePeriodCollection { new TimeRange( periods ) } : CombinePeriods( timeLineMoments );
    } // CombinePeriods*/
    
    
    func combinePeriods() -> TimePeriodCollectionProtocol {
    
        if (periods.count == 0 || (periods.count > 1 && !hasNonMomentPeriods))
        {
            return TimePeriodCollection()
        }

        var timelineMoments: TimelineMomentCollectionProtocol = getTimelineMoments()
        return timelineMoments.count == 0 ? TimePeriodCollection(TimeRange(copy: periods)) : combinePeriods(timelineMoments)
    
    } // CombinePeriods
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public ITimePeriodCollection IntersectPeriods( bool combinePeriods = true )
    {
        if ( periods.Count == 0 || ( periods.Count > 1 && !HasNonMomentPeriods ) )
        {
            return new TimePeriodCollection();
        }

        ITimeLineMomentCollection timeLineMoments = GetTimeLineMoments();
        if ( timeLineMoments.Count == 0 )
        {
            return new TimePeriodCollection();
        }

        return combinePeriods ? IntersectCombinedPeriods( timeLineMoments ) : IntersectPeriods( timeLineMoments );
    } // IntersectPeriods*/
    
    
    
    func intersectPeriods(combinePeriods: Bool  = true ) -> TimePeriodCollectionProtocol {
    
        if (periods.count == 0 || (periods.count > 1 && !hasNonMomentPeriods))
        {
            return TimePeriodCollection()
        }

        var timelineMoments: TimelineMomentCollectionProtocol = getTimelineMoments()
        if (timelineMoments.count == 0)
        {
            return TimePeriodCollection()
        }

        return combinePeriods ? intersectCombinedPeriods(timelineMoments) : intersectPeriods(timelineMoments)
        
    } // IntersectPeriods
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public ITimePeriodCollection CalculateGaps()
    {
        // exclude periods
        TimePeriodCollection gapPeriods = new TimePeriodCollection();
        foreach ( ITimePeriod period in periods )
        {
            if ( limits.IntersectsWith( period ) )
            {
                gapPeriods.Add( new TimeRange( period ) );
            }
        }

        ITimeLineMomentCollection timeLineMoments = GetTimeLineMoments( gapPeriods );
        if ( timeLineMoments.Count == 0 )
        {
            return new TimePeriodCollection { limits };
        }

        T range = new T();
        range.Setup( MapPeriodStart( limits.Start ), MapPeriodEnd( limits.End ) );
        return CalculateGaps( range, timeLineMoments );
    } // CalculateGaps*/
    
    
    func calculateGaps() -> TimePeriodCollectionProtocol {
    
        // exclude periods
        var gapPeriods: TimePeriodCollection = TimePeriodCollection()
        for period in periods {
        
            if (limits.intersectsWith(period))
            {
                gapPeriods.append(TimeRange(copy: period))
            }
        }

            var timelineMoments: TimelineMomentCollectionProtocol = getTimelineMoments(gapPeriods)
        if (timelineMoments.count == 0)
        {
            return TimePeriodCollection(limits)
        }

        var range: T = T()
        range.setup(mapPeriodStart(limits.start), mapPeriodEnd(limits.end))
        return calculateGaps(range, timelineMoments)
            
    } // CalculateGaps
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*private ITimeLineMomentCollection GetTimeLineMoments()
    {
        return GetTimeLineMoments( periods );
    } // GetTimeLineMoments*/
        
    func getTimelineMoments() -> TimelineMomentCollectionProtocol {
    
        return getTimelineMoments(periods)
        
    } // GetTimelineMoments
    
        
        
        
        
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*private ITimeLineMomentCollection GetTimeLineMoments( ICollection<ITimePeriod> momentPeriods )
    {
        TimeLineMomentCollection timeLineMoments = new TimeLineMomentCollection();

        if ( momentPeriods.Count == 0 )
        {
            return timeLineMoments;
        }

        // setup gap set with all start/end points
        ITimePeriodCollection intersections = new TimePeriodCollection();
        foreach ( ITimePeriod momentPeriod in momentPeriods )
        {
            if ( momentPeriod.IsMoment )
            {
                continue;
            }

            // calculate the intersection between the periods
            ITimeRange intersection = limits.GetIntersection( momentPeriod );
            if ( intersection == null || intersection.IsMoment )
            {
                continue;
            }

            if ( periodMapper != null )
            {
                intersection = new TimeRange( MapPeriodStart( intersection.Start ), MapPeriodEnd( intersection.End ) );
            }

            intersections.Add( intersection );
        }

        timeLineMoments.AddAll( intersections );
        return timeLineMoments;
    } // GetTimeLineMoments*/
    
    
        
    func getTimelineMoments(momentPeriods: Collection<TimePeriodProtocol>) -> TimelineMomentCollectionProtocol {
    
        var timelineMoments: TimelineMomentCollection = TimelineMomentCollection()

        if (momentPeriods.count == 0)
        {
            return timelineMoments
        }

        // setup gap set with all start/end points
        var intersections: TimePeriodCollectionProtocol = TimePeriodCollection()
        for momentPeriod in momentPeriods {
        
            if (momentPeriod.isMoment)
            {
                continue
            }

            // calculate the intersection between the periods
            var intersection: TimeRangeProtocol  = limits.getIntersection(momentPeriod)
            if (intersection == nil || intersection.isMoment)
            {
                continue
            }

            if (periodMapper != nil)
            {
                intersection = TmeRange(mapPeriodStart(intersection.start), mapPeriodEnd(intersection.end))
            }

            intersections.append(intersection)
        }

        timelineMoments.addAll(periods: intersections)
            
        return timelineMoments
            
    } // GetTimelineMoments
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*private static ITimePeriodCollection CombinePeriods( ITimeLineMomentCollection timeLineMoments )
    {
        TimePeriodCollection periods = new TimePeriodCollection();
        if ( timeLineMoments.IsEmpty )
        {
            return periods;
        }

        // search for periods
        int itemIndex = 0;
        while ( itemIndex < timeLineMoments.Count )
        {
            ITimeLineMoment periodStart = timeLineMoments[ itemIndex ];
            int startCount = periodStart.StartCount;
            if ( startCount == 0 )
            {
                throw new InvalidOperationException();
            }

            // search next period end
            // use balancing to handle overlapping periods
            int balance = startCount;
            ITimeLineMoment periodEnd = null;
            while ( itemIndex < timeLineMoments.Count - 1 && balance > 0 )
            {
                itemIndex++;
                periodEnd = timeLineMoments[ itemIndex ];
                balance += periodEnd.BalanceCount;
            }

            if ( periodEnd == null )
            {
                throw new InvalidOperationException();
            }

            if ( periodEnd.StartCount > 0 ) // touching
            {
                itemIndex++;
                continue;
            }

            // found a period
            if ( itemIndex < timeLineMoments.Count )
            {
                T period = new T();
                period.Setup( periodStart.Moment, periodEnd.Moment );
                periods.Add( period );
            }

            itemIndex++;
        }

        return periods;
    } // CombinePeriods*/
        
        
    
    func combinePeriods(timelineMoments: TimelineMomentCollectionProtocol) -> TimePeriodCollectionProtocol {
        
        var periods: TimePeriodCollection = TimePeriodCollection()
        if (timelineMoments.isEmpty)
        {
            return periods
        }

        // search for periods
        var itemIndex: Int = 0
        while (itemIndex < timelineMoments.count)
        {
            var periodStart: TimelineMomentProtocol = timelineMoments[itemIndex]
            var startCount: Int = periodStart.startCount
            if (startCount == 0)
            {
                //throw new InvalidOperationException();
            }

            // search next period end
            // use balancing to handle overlapping periods
            var balance: Int = startCount
            var periodEnd: TimelineMomentProtocol = nil
            while (itemIndex < timelineMoments.count - 1 && balance > 0)
            {
                itemIndex += 1
                periodEnd = timelineMoments[itemIndex]
                balance += periodEnd.balanceCount
            }

            if (periodEnd == nil)
            {
                //throw new InvalidOperationException();
            }

            if (periodEnd.startCount > 0) // touching
            {
                itemIndex += 1
                continue
            }

            // found a period
            if (itemIndex < timelineMoments.count)
            {
                var period: T = T()
                period.setup(periodStart.moment, periodEnd.moment)
                periods.add(period)
            }

            itemIndex += 1
        }

        return periods
    } // CombinePeriods
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*private static ITimePeriodCollection IntersectCombinedPeriods( ITimeLineMomentCollection timeLineMoments )
    {
        TimePeriodCollection periods = new TimePeriodCollection();
        if ( timeLineMoments.IsEmpty )
        {
            return periods;
        }

        // search for periods
        int intersectionStart = -1;
        int balance = 0;
        for ( int i = 0; i < timeLineMoments.Count; i++ )
        {
            ITimeLineMoment moment = timeLineMoments[ i ];

            int startCount = moment.StartCount;
            int endCount = moment.EndCount;
            balance += startCount;
            balance -= endCount;

            // intersection is starting by a period start
            if ( startCount > 0 && balance > 1 && intersectionStart < 0 )
            {
                intersectionStart = i;
                continue;
            }

            // intersection is starting by a period end
            if ( endCount <= 0 || balance > 1 || intersectionStart < 0 )
            {
                continue;
            }

            T period = new T();
            period.Setup( timeLineMoments[ intersectionStart ].Moment, moment.Moment );
            periods.Add( period );
            intersectionStart = -1;
        }

        return periods;
    } // IntersectCombinedPeriods*/
        
    
        
    func intersectCombinedPeriods(timelineMoments: TimelineMomentCollectionProtocol  ) -> TimePeriodCollectionProtocol {
    
        var periods: TimePeriodCollection = TimePeriodCollection()
        if (timelineMoments.isEmpty)
        {
            return periods
        }

        // search for periods
        var intersectionStart: Int = -1
        var balance: Int = 0
            
        for i in 0..<timelineMoments.count {
        
            var moment: TimelineMomentProtocol = timelineMoments[i]

            var startCount: Int = moment.startCount
            var endCount: Int = moment.endCount
            balance += startCount
            balance -= endCount

            // intersection is starting by a period start
            if (startCount > 0 && balance > 1 && intersectionStart < 0)
            {
                intersectionStart = i
                continue
            }

            // intersection is starting by a period end
            if (endCount <= 0 || balance > 1 || intersectionStart < 0)
            {
                continue
            }

            var period: T = T()
            period.setup(timelineMoments[intersectionStart].moment, moment.moment)
            periods.add(period)
            intersectionStart = -1
        }

        return periods
            
    } // IntersectCombinedPeriods
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*private static ITimePeriodCollection IntersectPeriods( ITimeLineMomentCollection timeLineMoments )
    {
        TimePeriodCollection periods = new TimePeriodCollection();
        if ( timeLineMoments.IsEmpty )
        {
            return periods;
        }

        // search for periods
        int intersectionStart = -1;
        int balance = 0;
        for ( int i = 0; i < timeLineMoments.Count; i++ )
        {
            ITimeLineMoment moment = timeLineMoments[ i ];

            balance += moment.BalanceCount;

            // intersection is starting by a period start
            if ( balance > 1 && intersectionStart < 0 )
            {
                intersectionStart = i;
                continue;
            }

            // intersection is starting by a period end
            if ( intersectionStart < 0 )
            {
                continue;
            }

            T period = new T();
            period.Setup( timeLineMoments[ intersectionStart ].Moment, moment.Moment );
            periods.Add( period );
            intersectionStart = balance > 1 ? i : -1;
        }

        return periods;
    } // IntersectCombinedPeriods*/
        
        
    
    func intersectPeriods(timeLineMoments: TimelineMomentCollectionProtocol) -> TimePeriodCollectionProtocol {
    
        var periods: TimePeriodCollection = TimePeriodCollection()
        if (timelineMoments.isEmpty)
        {
            return periods
        }

        // search for periods
        var intersectionStart: Int = -1
        var balance: Int = 0
        for i in 0..<timelineMoments.count {
        
            var moment: TimelineMomentProtocol = timelineMoments[i]

            balance += moment.balanceCount

            // intersection is starting by a period start
            if (balance > 1 && intersectionStart < 0)
            {
                intersectionStart = i
                continue
            }

            // intersection is starting by a period end
            if (intersectionStart < 0)
            {
                continue
            }

            var period: T = T()
            period.setup(timelineMoments[intersectionStart].moment, moment.moment)
            periods.add(period)
            intersectionStart = balance > 1 ? i : -1
        }

        return periods
            
    } // IntersectCombinedPeriods
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*private static ITimePeriodCollection CalculateGaps( ITimePeriod range, ITimeLineMomentCollection timeLineMoments )
    {
        TimePeriodCollection gaps = new TimePeriodCollection();
        if ( timeLineMoments.IsEmpty )
        {
            return gaps;
        }

        // range leading gap
        ITimeLineMoment periodStart = timeLineMoments.Min;
        if ( periodStart != null && range.Start < periodStart.Moment )
        {
            T startingGap = new T();
            startingGap.Setup( range.Start, periodStart.Moment );
            gaps.Add( startingGap );
        }

        // search for gaps
        int itemIndex = 0;
        while ( itemIndex < timeLineMoments.Count )
        {
            ITimeLineMoment moment = timeLineMoments[ itemIndex ];
            int startCount = moment.StartCount;
            if ( startCount == 0 )
            {
                throw new InvalidOperationException();
            }

            // search next gap start
            // use balancing to handle overlapping periods
            int balance = startCount;
            ITimeLineMoment gapStart = null;
            while ( itemIndex < timeLineMoments.Count - 1 && balance > 0 )
            {
                itemIndex++;
                gapStart = timeLineMoments[ itemIndex ];
                balance += gapStart.BalanceCount;
            }

            if ( gapStart == null )
            {
                throw new InvalidOperationException();
            }

            if ( gapStart.StartCount > 0 ) // touching
            {
                itemIndex++;
                continue;
            }

            // found a gap
            if ( itemIndex < timeLineMoments.Count - 1 )
            {
                T gap = new T();
                gap.Setup( gapStart.Moment, timeLineMoments[ itemIndex + 1 ].Moment );
                gaps.Add( gap );
            }

            itemIndex++;
        }

        // range closing gap
        ITimeLineMoment periodEnd = timeLineMoments.Max;
        if ( periodEnd != null && range.End > periodEnd.Moment )
        {
            T endingGap = new T();
            endingGap.Setup( periodEnd.Moment, range.End );
            gaps.Add( endingGap );
        }

        return gaps;
    } // CalculateGaps*/
        
        
    
    func calculateGaps(range: TimePeriodProtocol , timelineMoments: TimelineMomentCollectionProtocol) -> TimePeriodCollectionProtocol {
    
        var gaps: TimePeriodCollection = TimePeriodCollection()
        if (timelineMoments.isEmpty)
        {
            return gaps
        }

        // range leading gap
        var periodStart: TimelineMomentProtocol = timelineMoments.min
        if (periodStart != null && range.start < periodStart.moment)
        {
            var startingGap: T = T()
            startingGap.setup(range.start, periodStart.moment)
            gaps.add(startingGap)
        }

        // search for gaps
        var itemIndex: Int = 0
        while (itemIndex < timelineMoments.count)
        {
            var moment: TimelineMomentProtocol = timelineMoments[itemIndex]
            var startCount: Int = moment.startCount
            if (startCount == 0)
            {
                //throw new InvalidOperationException()
            }

            // search next gap start
            // use balancing to handle overlapping periods
            var balance: Int = startCount
            var gapStart: TimelineMomentProtocol = nil
            while (itemIndex < timelineMoments.count - 1 && balance > 0)
            {
                itemIndex += 1
                gapStart = timelineMoments[itemIndex]
                balance += gapStart.balanceCount
            }

            if (gapStart == nil)
            {
                //throw new InvalidOperationException()
            }

            if (gapStart.startCount > 0) // touching
            {
                itemIndex += 1
                continue
            }

            // found a gap
            if (itemIndex < timelineMoments.count - 1)
            {
                var gap: T = T()
                gap.setup(gapStart.moment, timelineMoments[itemIndex + 1].moment)
                gaps.add(gap)
            }

            itemIndex += 1
        }

        // range closing gap
        var periodEnd: TimelineMomentProtocol = timelineMoments.max
        if (periodEnd != nil && range.end > periodEnd.moment)
        {
            var endingGap: T = T()
            endingGap.setup(periodEnd.moment, range.end)
            gaps.add(endingGap)
        }

        return gaps
        
    } // CalculateGaps
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*private DateTime MapPeriodStart( DateTime start )
    {
        return periodMapper != null ? periodMapper.UnmapStart( start ) : start;
    } // MapPeriodStart*/
        
        
    func mapPeriodStart(start: Date) -> Date {
    
        return periodMapper != nil ? periodMapper.unmapStart(start) : start
        
    } // MapPeriodStart
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*private DateTime MapPeriodEnd( DateTime end )
    {
        return periodMapper != null ? periodMapper.UnmapEnd( end ) : end;
    } // MapPeriodEnd*/
        
        
    func mapPeriodEnd(end: Date) -> Date {
    
        return periodMapper != nil ? periodMapper.unmapEnd(end) : end
        
    } // MapPeriodEnd
    
    
    
    
    
    
    
    
    
    

} // class Timeline
