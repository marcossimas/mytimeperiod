//
//  TimePeriodCollection.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 14/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//


import Foundation


//public class TimePeriodCollection : ITimePeriodCollection {
//class TimePeriodCollection: TimePeriodCollectionProtocol {
class TimePeriodCollection: TimePeriodCollectionProtocol, Sequence, Equatable {
    
    
    // MARK: - Public Properties

    //private readonly List<ITimePeriod> periods = new List<ITimePeriod>();
    var periods: [TimePeriodProtocol] = []
    
    
    // ----------------------------------------------------------------------
    /*public DateTime Start
    {
        get
        {
            DateTime? start = GetStart();
            return start.HasValue ? start.Value : TimeSpec.MinPeriodDate;
        }
        set
        {
            if ( Count == 0 )
            {
                return;
            }
            Move( value - Start );
        }
    } // Start*/

    
    var start: Date? {
        
        get
        {
            
            let localStart: Date? = getStart()
            return localStart != nil ? localStart! : TimeSpec.minPeriodDate
            
        }
        set(value)
        {
            
            if (count == 0)
            {
                return
            }
            move(delta: value!.timeIntervalSince(start!))
        }
        
    }
    
    
    // ----------------------------------------------------------------------
    /*public DateTime End
    {
        get
        {
            DateTime? end = GetEnd();
            return end.HasValue ? end.Value : TimeSpec.MaxPeriodDate;
        }
        set
        {
            if ( Count == 0 )
            {
                return;
            }
            Move( value - End );
        }
    } // End*/

    
    var end: Date? {
        
        get
        {
            let localEnd: Date? = getEnd()
            return localEnd != nil ? localEnd! : TimeSpec.maxPeriodDate
        }
        set(value)
        {
            if (count == 0)
            {
                return
            }
            move(delta: value!.timeIntervalSince(end!))
        }
        
    }
    
    
    // ----------------------------------------------------------------------
    /*public TimeSpan Duration
    {
        get
        {
            TimeSpan? duration = GetDuration();
            return duration.HasValue ? duration.Value : TimeSpec.MaxPeriodDuration;
        }
    } // Duration*/
    
    
    var duration: TimeInterval? {
        
        get
        {
            let localDuration: TimeInterval? = getDuration()
            
            return localDuration != nil ? localDuration! : TimeSpec.maxPeriodDuration
        }
        
    }
    
    
    // ----------------------------------------------------------------------
    /*public int Count
    {
        get { return periods.Count; }
    } // Count*/
    
    
    var count: Int {
        
        get { return periods.count }
        
    }
    
    
    // ----------------------------------------------------------------------
    /*public bool IsReadOnly
    {
        get { return false; }
    } // IsReadOnly*/
    
    
    var isReadOnly: Bool {
        
        get { return false }
        
    }
    
    
/*
    // ----------------------------------------------------------------------
    /*public ITimePeriod this[ int index ]
    {
        get { return periods[ index ]; }
        set { periods[ index ] = value; }
    } // this[]*/
    
    
    subscript(index: Int) -> TimePeriodProtocol {
    
        get { return periods[index] }
        set(value) { periods[index] = value }
    
    }
*/
    

    // ----------------------------------------------------------------------
    /*public bool IsAnytime
    {
        get { return !HasStart && !HasEnd; }
    } // IsAnytime*/
    
    
    var isAnytime: Bool {
        
        get { return !hasStart && !hasEnd }
        
    }
    

    // ----------------------------------------------------------------------
    /*public bool IsMoment
    {
        get { return Duration == TimeSpan.Zero; }
    } // IsMoment*/
    
    
    var isMoment: Bool {
        
        //get { return start.equals(end) }
        
        get { return (duration == TimeSpec.minPeriodDuration) }
        
    }
    

    // ----------------------------------------------------------------------
    /*public bool HasStart
    {
        get { return Start != TimeSpec.MinPeriodDate; }
    } // HasStart*/
    
    
    var hasStart: Bool {
        
        get { return start != TimeSpec.minPeriodDate }
        
    }
    

    // ----------------------------------------------------------------------
    /*public bool HasEnd
    {
        get { return End != TimeSpec.MaxPeriodDate; }
    } // HasEnd*/
    
    
    
    var hasEnd: Bool {
        
        get { return end != TimeSpec.maxPeriodDate }
        
    }
    

    // ----------------------------------------------------------------------
    /*public virtual TimeSpan TotalDuration
    {
        get
        {
            TimeSpan duration = TimeSpan.Zero;
            foreach ( ITimePeriod timePeriod in periods )
            {
                duration = duration.Add( timePeriod.Duration );
            }
            return duration;
        }
    } // GetTotalDuration*/
    
    
    var totalDuration: TimeInterval {
        
        get
        {
            var tDuration: TimeInterval = TimeSpec.minPeriodDuration
            
            for timePeriod in periods {
                
                tDuration = tDuration + timePeriod.duration!
                
            }
            
            return tDuration
        }
        
    }
    
    
/*
    // ----------------------------------------------------------------------
    public string DurationDescription
    {
        get { return TimeFormatter.Instance.GetDuration( Duration, DurationFormatType.Detailed ); }
    } // DurationDescription
    
    
    
    var durationDescription: String {
        
        get { return TimeFormatter.Instance.getDuration(duration, DurationFormatType.detailed) }
        
    }
*/
    
    
    
    
    // MARK: - Private Properties
    
    /// The earliest beginning date of a `TimePeriod` in the group.
    /// `nil` if any `TimePeriod` in group has a nil beginning date (indefinite).
    //public internal(set) var localStart: Date?
    private var localStart: Date?
    

    /// The latest end date of a `TimePeriod` in the group.
    /// `nil` if any `TimePeriod` in group has a nil end date (indefinite).
    //public internal(set) var localEnd: Date?
    private var localEnd: Date?
    
    
    
    // MARK: - Initializers
    
    /*public TimePeriodCollection()
    {
    } // TimePeriodCollection*/
    
    init () {
        
    }

    
    // ----------------------------------------------------------------------
    /*public TimePeriodCollection( IEnumerable<ITimePeriod> timePeriods ) :
        this()
    {
        if ( timePeriods == null )
        {
            throw new ArgumentNullException( "timePeriods" );
        }
        AddAll( timePeriods );
    } // TimePeriodCollection*/
    
    
    init (timePeriods: [TimePeriodProtocol]) {
        
        if (timePeriods.count == 0)
        {
            //throw new ArgumentNullException( "timePeriods" );
        }
        
        addAll(periods: timePeriods)
        
    }
    
    
    
    
    // MARK: - Main Functions
    
    // ----------------------------------------------------------------------
    /*public virtual bool HasInsidePeriods( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }

        foreach ( ITimePeriod period in periods )
        {
            if ( test.HasInside( period ) )
            {
                return true;
            }
        }

        return false;
    } // HasInsidePeriods*/
    
    
    // True if collection has any period inside the given test period
    func hasInsidePeriods(test: TimePeriodProtocol?) -> Bool {
    
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }

        for period in periods {

            if (test!.hasInside(test: period))
            {
                return true
            }
            
        }

        return false
    } // HasInsidePeriods
    

    // ----------------------------------------------------------------------
    /*public virtual ITimePeriodCollection InsidePeriods( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }

        TimePeriodCollection insidePeriods = new TimePeriodCollection();

        foreach ( ITimePeriod period in periods )
        {
            if ( test.HasInside( period ) )
            {
                insidePeriods.Add( period );
            }
        }

        return insidePeriods;
    } // InsidePeriods*/
    
    
    // Return the periods of the collection which are inside the given test period
    func insidePeriods(test: TimePeriodProtocol?) -> TimePeriodCollection {
        
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }

        let insidePeriods = TimePeriodCollection()

        for period in periods {
        
            if (test!.hasInside(test: period))
            {
                insidePeriods.add(item: period)
            }
        }

        return insidePeriods
    } // InsidePeriods
    

    // ----------------------------------------------------------------------
    /*public virtual bool HasOverlaps()
    {
        bool hasOverlaps = false;
        if ( Count == 2 )
        {
            hasOverlaps = this[ 0 ].OverlapsWith( this[ 1 ] );
        }
        else if ( Count > 2 )
        {
            hasOverlaps = new TimeLineMomentCollection( this ).HasOverlaps();
        }

        return hasOverlaps;
    } // HasOverlaps*/
    
    
    // True if collection have periods that share any sub-period.
    func hasOverlaps() -> Bool {
    
        var hasOverlaps: Bool = false
        if (count == 2)
        {
            hasOverlaps = self[0].overlapsWith(test: self[1])
        }
        else if (count > 2)
        {
            hasOverlaps = TimelineMomentCollection(periods: self.periods).hasOverlaps()
        }

        return hasOverlaps
    } // HasOverlaps
    

    // ----------------------------------------------------------------------
    /*public virtual bool HasGaps()
    {
        bool hasGaps = false;
        if ( Count > 1 )
        {
            hasGaps = new TimeLineMomentCollection( this ).HasGaps();
        }

        return hasGaps;
    } // HasGaps*/
    
    
    // True if collection has a period of time between periods not contained by any period.
    func hasGaps() -> Bool {
        
        var hasGaps: Bool = false
        if (count > 1)
        {
            hasGaps = TimelineMomentCollection(periods: self.periods).hasGaps()
        }

        return hasGaps
        
    }
    

    // ----------------------------------------------------------------------
    /*public virtual bool HasOverlapPeriods( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }

        foreach ( ITimePeriod period in periods )
        {
            if ( test.OverlapsWith( period ) )
            {
                return true;
            }
        }

        return false;
    } // HasOverlapPeriods*/
    
    
    //True if collection has any period that share any sub-period with the given test period.
    func hasOverlapPeriods(test: TimePeriodProtocol?) -> Bool {
    
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }

        for period in periods {
        
            if (test!.overlapsWith(test: period))
            {
                return true
            }
        }

        return false
    } // HasOverlapPeriods
    

    // ----------------------------------------------------------------------
    /*public virtual ITimePeriodCollection OverlapPeriods( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }

        TimePeriodCollection overlapPeriods = new TimePeriodCollection();

        foreach ( ITimePeriod period in periods )
        {
            if ( test.OverlapsWith( period ) )
            {
                overlapPeriods.Add( period );
            }
        }

        return overlapPeriods;
    } // OverlapPeriods*/
    
    
    // Return the periods of the collection which overlaps the given test period
    func overlapPeriods(test: TimePeriodProtocol?) -> TimePeriodCollection {
    
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }

        let overlapPeriods: TimePeriodCollection = TimePeriodCollection()

        for period in periods {
        
            if (test!.overlapsWith(test: period))
            {
                overlapPeriods.add(item: period)
            }
        }

        return overlapPeriods
    } // OverlapPeriods
    

    // ----------------------------------------------------------------------
    /*public virtual bool HasIntersectionPeriods( DateTime test )
    {
        foreach ( ITimePeriod period in periods )
        {
            if ( period.HasInside( test ) )
            {
                return true;
            }
        }

        return false;
    } // HasIntersectionPeriods*/
        
        
        
    // True if given test date intersects any period in the collection
    func hasIntersectionPeriods(test: Date) -> Bool {

        for period in periods {
    
            if (period.hasInside(test: test))
            {
                return true
            }
        }

        return false
        
    } // HasIntersectionPeriods
    

    // ----------------------------------------------------------------------
    /*public virtual ITimePeriodCollection IntersectionPeriods( DateTime test )
    {
        TimePeriodCollection intersectionPeriods = new TimePeriodCollection();

        foreach ( ITimePeriod period in periods )
        {
            if ( period.HasInside( test ) )
            {
                intersectionPeriods.Add( period );
            }
        }

        return intersectionPeriods;
    } // IntersectionPeriods*/
        
        
    // Return the periods of the collection which are intersected by the given test date
    func intersectionPeriods(test: Date) -> TimePeriodCollection {

        let intersectionPeriods: TimePeriodCollection = TimePeriodCollection()

        for period in periods {
        
            if (period.hasInside(test: test))
            {
                intersectionPeriods.add(item: period)
            }
        }

    return intersectionPeriods
    } // IntersectionPeriods


    // ----------------------------------------------------------------------
    /*public virtual bool HasIntersectionPeriods( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }

        foreach ( ITimePeriod period in periods )
        {
            if ( period.IntersectsWith( test ) )
            {
                return true;
            }
        }

        return false;
    } // HasIntersectionPeriods*/
        
        
    // True if given test period intersects any period in the collection
    func hasIntersectionPeriods(test: TimePeriodProtocol?) -> Bool {
    
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }

            for period in periods {
        
            if (period.intersectsWith(test: test))
            {
                return true
            }
        }

        return false
    } // HasIntersectionPeriods



    // ----------------------------------------------------------------------
    /*public virtual ITimePeriodCollection IntersectionPeriods( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }

        TimePeriodCollection intersectionPeriods = new TimePeriodCollection();

        foreach ( ITimePeriod period in periods )
        {
            if ( test.IntersectsWith( period ) )
            {
                intersectionPeriods.Add( period );
            }
        }

        return intersectionPeriods;
    } // IntersectionPeriods*/
        
        
    // Return the periods of the collection which are intersected by the given test period
    func intersectionPeriods(test: TimePeriodProtocol?) -> TimePeriodCollection {
    
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }

        let intersectionPeriods: TimePeriodCollection = TimePeriodCollection()

        for period in periods {
        
            if (test!.intersectsWith(test: period))
            {
                intersectionPeriods.add(item: period)
            }
        }

        return intersectionPeriods
    } // IntersectionPeriods
    

    // ----------------------------------------------------------------------
    /*public virtual ITimePeriodCollection RelationPeriods( ITimePeriod test, PeriodRelation relation )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }

        TimePeriodCollection relationPeriods = new TimePeriodCollection();

        foreach ( ITimePeriod period in periods )
        {
            if ( test.GetRelation( period ) == relation )
            {
                relationPeriods.Add( period );
            }
        }

        return relationPeriods;
    } // RelationPeriods*/
    
        
    // Return the periods of the collection which have a given relationship to the given test period
    func relationPeriods(test: TimePeriodProtocol?, relation: PeriodRelation) -> TimePeriodCollection {
    
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }

        let relationPeriods: TimePeriodCollection = TimePeriodCollection()

        for period in periods {
        
            if (test!.getRelation(test: period) == relation)
            {
                relationPeriods.add(item: period)
            }
        }

        return relationPeriods
    } // RelationPeriods


    // ----------------------------------------------------------------------
    /*public virtual void Add( ITimePeriod item )
    {
        if ( item == null )
        {
            throw new ArgumentNullException( "item" );
        }
        periods.Add( item );
    } // Add*/
        
        
        
    // Adds a new period to the collection
    func add(item: TimePeriodProtocol?) -> () {
    
        if (item == nil)
        {
            //throw new ArgumentNullException( "item" );
        }
        
        periods.append(item!)
        
    } // Add


    // ----------------------------------------------------------------------
    /*public bool ContainsPeriod( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }

        foreach ( ITimePeriod period in periods )
        {
            if ( period.IsSamePeriod( test ) )
            {
                return true;
            }
        }
        return false;
    } // ContainsPeriod*/
    
    
    // True if collection has any period with the same start/end of the given period
    // ----------------------------------------------------------------------
    func containsPeriod(test: TimePeriodProtocol?) -> Bool {
    
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }

        for period in periods {
        
            if (period.isSamePeriod(test: test))
            {
                return true
            }
        }
        return false
    } // ContainsPeriod
    
    
    // True if the given period has the same start/end of the collection boundaries.
    func isSamePeriod(test: TimePeriodProtocol?) -> Bool {
    
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }
        return start == test!.start && end == test!.end
    } // IsSamePeriod


    // ----------------------------------------------------------------------
    /*public virtual bool HasInside( DateTime test )
    {
        return TimePeriodCalc.HasInside( this, test );
    } // HasInside*/
        
        
        
    
    // True if the given date is inside collection start/end boundaries
    func hasInside(test: Date) -> Bool {
    
        return TimePeriodCalc.hasInside(period: self, test: test)
        
    } // HasInside


    // ----------------------------------------------------------------------
    /*public virtual bool HasInside( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }
        return TimePeriodCalc.HasInside( this, test );
    } // HasInside*/
    
        
    
    // True if the given period is inside collection start/end boundaries
    func hasInside(test: TimePeriodProtocol?) -> Bool {
    
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }
        return TimePeriodCalc.hasInside(period: self, test: test!)
        
    } // HasInside

    
    // ----------------------------------------------------------------------
    /*public virtual bool IntersectsWith( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }
        return TimePeriodCalc.IntersectsWith( this, test );
    } // IntersectsWith*/
        
        
    // True if the given period intersects with collection total period
    func intersectsWith(test: TimePeriodProtocol?) -> Bool {
    
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }
        return TimePeriodCalc.intersectsWith(period: self, test: test!)
    } // IntersectsWith


    // ----------------------------------------------------------------------
    /*public virtual bool OverlapsWith( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }
        return TimePeriodCalc.OverlapsWith( this, test );
    } // OverlapsWith*/
    
    
    // True if the given test period share any sub-period with the collection total period.
    func overlapsWith(test: TimePeriodProtocol?) -> Bool {
    
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }
        return TimePeriodCalc.overlapsWith(period: self, test: test!)
    } // OverlapsWith


    // ----------------------------------------------------------------------
    /*public virtual PeriodRelation GetRelation( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }
        return TimePeriodCalc.GetRelation( this, test );
    } // GetRelation*/
    
        
    // Returns the relationship between thw given period and collection total period.
    func getRelation(test: TimePeriodProtocol?) -> PeriodRelation {
    
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }
            return TimePeriodCalc.getRelation(period: self, test: test!)
    } // GetRelation
    
    
    
    
    // MARK: - Helper Functions
    
    private func sortFuncDuration(_ type: SortDirection) -> ((TimePeriodProtocol, TimePeriodProtocol) -> Bool) {
        switch type {
        case .ascending:     return { $0.duration! < $1.duration! }
        case .descending:     return { $0.duration! > $1.duration! }
        }
    }

    private func sortFunc(byStart start: Bool = true, type: SortDirection) -> ((TimePeriodProtocol, TimePeriodProtocol) -> Bool) {
        return {
            let date0 = (start ? $0.start : $0.end)
            let date1 = (start ? $1.start : $1.end)
            if date0 == nil && date1 == nil {
                return false
            } else if date0 == nil {
                return true
            } else if date1 == nil {
                return false
            } else {
                return (type == .ascending ? date1! > date0! : date0! > date1!)
            }
        }
    }
    
    
    internal static func hasSameElements(array1: [TimePeriodProtocol], _ array2: [TimePeriodProtocol]) -> Bool {
        guard array1.count == array2.count else {
            return false // No need to sorting if they already have different counts
        }

        let compArray1: [TimePeriodProtocol] = array1.sorted { (period1: TimePeriodProtocol, period2: TimePeriodProtocol) -> Bool in
            if period1.start == nil && period2.start == nil {
                return false
            } else if period1.start == nil {
                return true
            } else if period2.start == nil {
                return false
            } else {
                return period2.start! < period1.start!
            }
        }
        let compArray2: [TimePeriodProtocol] = array2.sorted { (period1: TimePeriodProtocol, period2: TimePeriodProtocol) -> Bool in
            if period1.start == nil && period2.start == nil {
                return false
            } else if period1.start == nil {
                return true
            } else if period2.start == nil {
                return false
            } else {
                return period2.start! < period1.start!
            }
        }
        for x in 0..<compArray1.count {
            if !compArray1[x].equals(compArray2[x]) {
                return false
            }
        }
        return true
    }
    

    // ----------------------------------------------------------------------
    /*public virtual TimeSpan GetDuration( IDurationProvider provider )
    {
        if ( provider == null )
        {
            throw new ArgumentNullException( "provider" );
        }
        return provider.GetDuration( Start, End );
    } // GetDuration*/
    
    
    
    func getDuration(provider: DurationProviderProtocol?) -> TimeInterval {
        
        if (provider == nil) {
            
            //throw new ArgumentNullException( "provider" )
            
        }
        
        return provider!.getDuration(start: start!, end: end!)
        
    } // GetDuration
    

    // ----------------------------------------------------------------------
    /*public virtual TimeSpan GetTotalDuration( IDurationProvider provider )
    {
        if ( provider == null )
        {
            throw new ArgumentNullException( "provider" );
        }

        TimeSpan duration = TimeSpan.Zero;
        foreach ( ITimePeriod timePeriod in periods )
        {
            duration = duration.Add( timePeriod.GetDuration( provider ) );
        }
        return duration;
    } // GetTotalDuration*/
    
    
    
    func getTotalDuration(provider: DurationProviderProtocol?) -> TimeInterval {
        
        if (provider == nil)
        {
            //throw new ArgumentNullException( "provider" );
        }

        var localDuration: TimeInterval = TimeSpec.minPeriodDuration
        
        for timePeriod in periods {
            
            localDuration = localDuration + timePeriod.getDuration(provider: provider)
        }
        return localDuration
        
    } // getTotalDuration
    

    // ----------------------------------------------------------------------
    /*public virtual void Setup( DateTime newStart, DateTime newEnd )
    {
        throw new InvalidOperationException();
    } // Setup*/
    
    
    func setup(newStart: Date, newEnd: Date) -> () {
        
        //throw new InvalidOperationException();
        
    } // setup
    
/*
    // ----------------------------------------------------------------------
    /*IEnumerator IEnumerable.GetEnumerator()
    {
        return GetEnumerator();
    } // IEnumerable.GetEnumerator*/
    
    
    func getEnumerator() -> [] {
        
        return getEnumerator()
        
    }
*/
    
    
/*
    // ----------------------------------------------------------------------
    /*public IEnumerator<ITimePeriod> GetEnumerator()
    {
        return periods.GetEnumerator();
    } // GetEnumerator*/
    
    
    
    func getEnumerator() -> [TimePeriodProtocol] {
        
        return periods.getEnumerator()
        
    }
*/

    // ----------------------------------------------------------------------
    /*public virtual void Move( TimeSpan delta )
    {
        if ( delta == TimeSpan.Zero )
        {
            return;
        }

        foreach ( ITimePeriod timePeriod in periods )
        {
            DateTime start = timePeriod.Start + delta;
            timePeriod.Setup( start, start.Add( timePeriod.Duration ) );
        }
    } // Move*/
    
    
    //TODO
    func move(delta: TimeInterval) -> () {

        
        if (delta == TimeSpec.minPeriodDuration)
        {
            return
        }
        
        for timePeriod in periods {
        
            let localStart: Date = timePeriod.start!.addingTimeInterval(delta)
            timePeriod.setup(newStart: localStart, newEnd: localStart.addingTimeInterval(timePeriod.duration!))
            
        }
        
    }
    

    // ----------------------------------------------------------------------
    /*public virtual void SortBy( ITimePeriodComparer comparer )
    {
        if ( comparer == null )
        {
            throw new ArgumentNullException( "comparer" );
        }
        periods.Sort( comparer );
    } // SortBy*/
    
/*
    func sortBy(comparer: TimePeriodComparerProtocol?) -> () {
        
        
        if (comparer == nil)
        {
            //throw new ArgumentNullException( "comparer" );
        }
        periods.sort(by: comparer)
        
    }
*/
    

    // ----------------------------------------------------------------------
    /*public virtual void SortReverseBy( ITimePeriodComparer comparer )
    {
        if ( comparer == null )
        {
            throw new ArgumentNullException( "comparer" );
        }
        SortBy( new TimePeriodReversComparer( comparer ) );
    } // SortReverseBy*/
    
    
/*
    func sortReverseBy(comparer: TimePeriodComparerProtocol?) -> () {
        
        
        if (comparer == nil)
        {
            //throw new ArgumentNullException( "comparer" );
        }
        sortBy(comparer: TimePeriodReverseComparer(baseComparer: comparer!))
        
    }
*/
    

    // ----------------------------------------------------------------------
    /*public virtual void SortByStart( ListSortDirection sortDirection = ListSortDirection.Ascending )
    {
        switch ( sortDirection )
        {
            case ListSortDirection.Ascending:
                SortBy( TimePeriodStartComparer.Comparer );
                break;
            case ListSortDirection.Descending:
                SortBy( TimePeriodStartComparer.ReverseComparer );
                break;
            default:
                throw new ArgumentOutOfRangeException( "sortDirection" );
        }
    } // SortByStart*/
    
    
/*
    func sortByStart(sortDirection: ListSortDirection = ListSortDirection.ascending) -> () {
        
        
        switch (sortDirection)
        {
            case ListSortDirection.ascending:
                sortBy(comparer: TimePeriodStartComparer.comparer)
                break
            
            case ListSortDirection.descending:
                sortBy(comparer: TimePeriodStartComparer.reverseComparer)
                break
            
            default:
                print("default")
                //throw new ArgumentOutOfRangeException( "sortDirection" );
        }
        
    }
*/
    

    // ----------------------------------------------------------------------
    /*public virtual void SortByEnd( ListSortDirection sortDirection = ListSortDirection.Ascending )
    {
        switch ( sortDirection )
        {
            case ListSortDirection.Ascending:
                SortBy( TimePeriodEndComparer.Comparer );
                break;
            case ListSortDirection.Descending:
                SortBy( TimePeriodEndComparer.ReverseComparer );
                break;
            default:
                throw new ArgumentOutOfRangeException( "sortDirection" );
        }
    } // SortByEnd*/
    
    
    
/*
    func sortByEnd(sortDirection: ListSortDirection = ListSortDirection.ascending) -> () {
        
        
        switch (sortDirection)
        {
            case ListSortDirection.ascending:
                sortBy(comparer: TimePeriodEndComparer.comparer)
                break
            
            case ListSortDirection.descending:
                sortBy(comparer: TimePeriodEndComparer.reverseComparer)
                break
            
            default:
                print("default")
                //throw new ArgumentOutOfRangeException( "sortDirection" );
        }
        
    }
 */

    // ----------------------------------------------------------------------
    /*public virtual void SortByDuration( ListSortDirection sortDirection = ListSortDirection.Ascending )
    {
        switch ( sortDirection )
        {
            case ListSortDirection.Ascending:
                SortBy( TimePeriodDurationComparer.Comparer );
                break;
            case ListSortDirection.Descending:
                SortBy( TimePeriodDurationComparer.ReverseComparer );
                break;
            default:
                throw new ArgumentOutOfRangeException( "sortDirection" );
        }
    } // SortByDuration*/
    
    
    
    
/*
    func sortByDuration(sortDirection: ListSortDirection = ListSortDirection.ascending) -> () {
        
        
        switch (sortDirection)
        {
            case ListSortDirection.ascending:
                sortBy(comparer: TimePeriodDurationComparer.comparer)
                break
            
            case ListSortDirection.descending:
                sortBy(comparer: TimePeriodDurationComparer.reverseComparer)
                break
            
            default:
                print("default")
                //throw new ArgumentOutOfRangeException( "sortDirection" );
        }
        
    }
 */
    
    // ----------------------------------------------------------------------
    /*public void AddAll( IEnumerable<ITimePeriod> timePeriods )
    {
        if ( timePeriods == null )
        {
            throw new ArgumentNullException( "timePeriods" );
        }

        foreach ( ITimePeriod period in timePeriods )
        {
            Add( period );
        }
    } // AddAll*/
        
        
        
    func addAll(periods: [TimePeriodProtocol]) -> () {
    
        if (periods.count == 0)
        {
            //throw new ArgumentNullException( "timePeriods" );
        }

        for period in periods {
            
            add(item: period)
            
        }
    } // AddAll


    // ----------------------------------------------------------------------
    /*public virtual void Insert( int index, ITimePeriod item )
    {
        if ( index < 0 || index > Count )
        {
            throw new ArgumentOutOfRangeException( "index" );
        }
        if ( item == null )
        {
            throw new ArgumentNullException( "item" );
        }
        periods.Insert( index, item );
    } // Insert*/
        
        
        
    // Inserts the given period into the collection on a given index
    func insert(index: Int, item: TimePeriodProtocol?) -> () {
    
        if (index < 0 || index > count)
        {
            //throw new ArgumentOutOfRangeException( "index" );
        }
        if (item == nil)
        {
            //throw new ArgumentNullException( "item" );
        }
        periods.insert(item!, at: index)
        
    } // Insert



    // ----------------------------------------------------------------------
    /*public virtual bool Contains( ITimePeriod item )
    {
        if ( item == null )
        {
            throw new ArgumentNullException( "item" );
        }
        return periods.Contains( item );
    } // Contains*/
        
      
    //TODO
    func contains(item: TimePeriodProtocol?) -> Bool {
    
        if (item == nil)
        {
            //throw new ArgumentNullException( "item" );
        }
        //return periods.contains(item!)
        return self.containsPeriod(test: item!)
        
    } // Contains



    // ----------------------------------------------------------------------
    /*public virtual int IndexOf( ITimePeriod item )
    {
        if ( item == null )
        {
            throw new ArgumentNullException( "item" );
        }
        return periods.IndexOf( item );
    } // IndexOf*/
        
    
    // Returns the collection index of a given period
    func indexOf(item: TimePeriodProtocol?) -> Int {
    
        if (item == nil)
        {
            //throw new ArgumentNullException( "item" );
        }
        
        var elementIndex: Int? = nil
    
        for (index, element) in periods.enumerated() {
            
            if element.equals(item!) {
                
                elementIndex = index
                break
                
            }
            
        }
        
        return elementIndex!
        
        
    } // IndexOf


    // ----------------------------------------------------------------------
    /*public virtual void CopyTo( ITimePeriod[] array, int arrayIndex )
    {
        if ( array == null )
        {
            throw new ArgumentNullException( "array" );
        }
        periods.CopyTo( array, arrayIndex );
    } // CopyTo*/
        
        
    // Copy the contents of the colection to an array at a given index
    func copyTo(array: inout [TimePeriodProtocol?] , arrayIndex: Int) -> () {
    
        if (array.count == 0)
        {
            //throw new ArgumentNullException( "array" );
        }
        
        array.insert(contentsOf: periods, at: arrayIndex)
        
    } // CopyTo



    // ----------------------------------------------------------------------
    /*public virtual void Clear()
    {
        periods.Clear();
    } // Clear*/
        
        
/*
    func clear() -> () {
    
        periods.clear()
        
    } // Clear
 */

    
    // ----------------------------------------------------------------------
    /*public virtual bool Remove( ITimePeriod item )
    {
        if ( item == null )
        {
            throw new ArgumentNullException( "item" );
        }
        return periods.Remove( item );
    } // Remove*/
        
        
    
    // Removes the given period from collection and return the removed period
    func remove(item: TimePeriodProtocol?) -> Bool {
    
        if (item == nil)
        {
            //throw new ArgumentNullException( "item" );
        }
        
        var result: Bool? = nil
        
        for (index, element) in periods.enumerated() {
            
            if element.equals(item!) {
                
                periods.remove(at: index)
                    
                result = true
                
            }
            
        }
        
        return result!
        
        
    } // Remove


    // ----------------------------------------------------------------------
    /*public virtual void RemoveAt( int index )
    {
        periods.RemoveAt( index );
     
    } // RemoveAt*/
        
    
    // Removes the period at a given index from the collection and return the removed period
    
    func removeAt(index: Int) -> () {
    
        periods.remove(at: index)
        
    } // RemoveAt


    // ----------------------------------------------------------------------
    /*public virtual bool IsSamePeriod( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }
        return Start == test.Start && End == test.End;
    } // IsSamePeriod*/
    

    // ----------------------------------------------------------------------
    /*public virtual int CompareTo( ITimePeriod other, ITimePeriodComparer comparer )
    {
        if ( other == null )
        {
            throw new ArgumentNullException( "other" );
        }
        if ( comparer == null )
        {
            throw new ArgumentNullException( "comparer" );
        }
        return comparer.Compare( this, other );
    } // CompareTo*/
    
    
    
    // TODO
    func compareTo(other: TimePeriodProtocol?, comparer: TimePeriodComparerProtocol?) -> Int {
    
        if (other == nil)
        {
            //throw new ArgumentNullException( "other" );
        }
        if (comparer == nil)
        {
            //throw new ArgumentNullException( "comparer" );
        }
        return comparer!.compare(left: self, right: other!)
    } // CompareTo
    

/*

    // ----------------------------------------------------------------------
    public string GetDescription( ITimeFormatter formatter = null )
    {
        return Format( formatter ?? TimeFormatter.Instance );
    } // GetDescription
        
        
        
    func getDescription(formatter: TimeFormatterProtocol = nil) -> String {
    {
        return format(formatter ?? TimeFormatter.Instance)
        
    } // GetDescription
 */
    
    
/*
    // ----------------------------------------------------------------------
    /*protected virtual string Format( ITimeFormatter formatter )
    {
        return formatter.GetCollectionPeriod( Count, Start, End, Duration );
    } // Format*/
        
        
    func format(formatter: TimeFormatterProtocol) -> String {
    
        return formatter.getCollectionPeriod(count, start, end, duration)
    } // Format
*/
    
    
/*
    // ----------------------------------------------------------------------
    /*public override string ToString()
    {
        return GetDescription();
    } // ToString*/
        
        
    override func toString() -> String {
        
        return getDescription()
        
    }
*/
    
    
/*
    // ----------------------------------------------------------------------
    public sealed override bool Equals( object obj )
    {
        if ( obj == this )
        {
            return true;
        }
        if ( obj == null || GetType() != obj.GetType() )
        {
            return false;
        }
        return IsEqual( obj );
    } // Equals
        
        
        
    func equals(obj: NSObject) -> Bool {
        
        if (obj == self)
        {
            return true
        }
        
        if (obj == nil || type(of: nil) != type(of: obj))
        {
            return false
        }
        
        return isEqual(obj: obj)
        
    }
*/


/*
    // ----------------------------------------------------------------------
    /*protected virtual bool IsEqual( object obj )
    {
        return HasSameData( obj as TimePeriodCollection );
    } // IsEqual*/
    
    
    
    
    
    func isEqual(obj: NSObject) -> Bool {
        
        return hasSameData(comp: obj as TimePeriodCollection)
        
    }
*/
    

    // ----------------------------------------------------------------------
    /*private bool HasSameData( IList<ITimePeriod> comp )
    {
        if ( Count != comp.Count )
        {
            return false;
        }

        for ( int i = 0; i < Count; i++ )
        {
            if ( !this[ i ].Equals( comp[ i ] ) )
            {
                return false;
            }
        }

        return true;
    } // HasSameData*/
    
        
    // True if all elements of given array is equal to collection periods.
    func hasSameData(comp: [TimePeriodProtocol?]) -> Bool {
    
        if (count != comp.count)
        {
            return false
        }
        
        for i in 0..<count {
        
            if (!self[i].equals(comp[i]!))
            {
                return false
            }
        }

        return true
    } // HasSameData
    
    
  /*
    // ----------------------------------------------------------------------
    /*public sealed override int GetHashCode()
    {
        return HashTool.AddHashCode( GetType().GetHashCode(), ComputeHashCode() );
    } // GetHashCode*/
        
        
    func getHashCode() -> Int {
        
        return hashTool.addHashCode(getType().getHashCode(), computeHashCode())
        
    } // GetHashCode
 */
    

/*
    // ----------------------------------------------------------------------
    /*protected virtual int ComputeHashCode()
    {
        return HashTool.ComputeHashCode( periods );
    } // ComputeHashCode*/
        
        
    func computeHashCode() -> Int {
        
        return hashTool.computeHashCode(periods)
        
    } // ComputeHashCode
*/
    

    // ----------------------------------------------------------------------
    /*protected virtual DateTime? GetStart()
    {
        if ( Count == 0 )
        {
            return null;
        }

        DateTime start = TimeSpec.MaxPeriodDate;

        foreach ( ITimePeriod timePeriod in periods )
        {
            if ( timePeriod.Start < start )
            {
                start = timePeriod.Start;
            }
        }

        return start;
    } // GetStart*/
        
        
    func getStart() -> Date? {
    
        if (count == 0)
        {
            return nil
        }

        var start: Date = TimeSpec.maxPeriodDate

        for timePeriod in periods {
        
            if (timePeriod.start! < start)
            {
                start = timePeriod.start!
            }
        }

        return start
    } // GetStart
    

    // ----------------------------------------------------------------------
    /*protected virtual DateTime? GetEnd()
    {
        if ( Count == 0 )
        {
            return null;
        }

        DateTime end = TimeSpec.MinPeriodDate;

        foreach ( ITimePeriod timePeriod in periods )
        {
            if ( timePeriod.End > end )
            {
                end = timePeriod.End;
            }
        }

        return end;
    } // GetEnd*/
        
        
    func getEnd() -> Date? {
    
        if (count == 0)
        {
            return nil
        }

        var end: Date = TimeSpec.minPeriodDate

        for timePeriod in periods {
        
            if (timePeriod.end! > end)
            {
                end = timePeriod.end!
            }
        }

        return end
    } // GetEnd

    
    // ----------------------------------------------------------------------
    /*protected virtual void GetStartEnd( out DateTime? start, out DateTime? end )
    {
        if ( Count == 0 )
        {
            start = null;
            end = null;
            return;
        }

        start = TimeSpec.MaxPeriodDate;
        end = TimeSpec.MinPeriodDate;

        foreach ( ITimePeriod timePeriod in periods )
        {
            if ( timePeriod.Start < start )
            {
                start = timePeriod.Start;
            }
            if ( timePeriod.End > end )
            {
                end = timePeriod.End;
            }
        }
    } // GetStartEnd*/
        
    func getStartEnd(start: inout Date?, end: inout Date?) -> () {
    
        if (count == 0)
        {
            start = nil
            end = nil
            return
        }

        start = TimeSpec.maxPeriodDate
        end = TimeSpec.minPeriodDate

        for timePeriod in periods {
        
            if (timePeriod.start! < start!)
            {
                start = timePeriod.start
            }
            if (timePeriod.end! > end!)
            {
                end = timePeriod.end
            }
        }
            
    } // GetStartEnd


    // ----------------------------------------------------------------------
    /*protected virtual TimeSpan? GetDuration()
    {
        DateTime? start;
        DateTime? end;

        GetStartEnd( out start, out end );

        if ( start == null || end == null )
        {
            return null;
        }

        return end.Value - start.Value;
    } // GetDuration*/
        
        
        
    func getDuration() -> TimeInterval? {
    
        var start: Date?
        var end: Date?

        getStartEnd(start: &start, end: &end)

        if (start == nil || end == nil)
        {
            return nil
        }

        return end!.timeIntervalSince(start!)
        
    } // GetDuration
    
    
    
    
    // MARK: - Sorting
    /// Sort elements in place using given method.
    ///
    /// - Parameter type: sorting method
    public func sort(by type: SortType) {
        
        switch type {
        case .duration(let mode):    periods.sort(by: sortFuncDuration(mode))
        case .start(let mode):        periods.sort(by: sortFunc(byStart: true, type: mode))
        case .end(let mode):        periods.sort(by: sortFunc(byStart: false, type: mode))
        case .custom(let f):        periods.sort(by: f)
        }
        
    }
    
    
    

    /// Generate a new `TimePeriodCollection` where items are sorted with specified method.
    ///
    /// - Parameters:
    ///   - type: sorting method
    /// - Returns: collection ordered by given function
    public func sorted(by type: SortType) -> TimePeriodCollection {
        var sortedList: [TimePeriodProtocol]!
        switch type {
        case .duration(let mode):    sortedList = periods.sorted(by: sortFuncDuration(mode))
        case .start(let mode):        sortedList = periods.sorted(by: sortFunc(byStart: true, type: mode))
        case .end(let mode):        sortedList = periods.sorted(by: sortFunc(byStart: false, type: mode))
        case .custom(let f):        sortedList = periods.sorted(by: f)
        }
        return TimePeriodCollection(timePeriods: sortedList)
    }
    
    
    
    
    // MARK: - Equatable Protocol
    public static func == (lhs: TimePeriodCollection, rhs: TimePeriodCollection) -> Bool {
        return TimePeriodCollection.hasSameElements(array1: lhs.periods, rhs.periods)
    }
    
    
    

    // MARK: - Sequence Protocol
    public func makeIterator() -> IndexingIterator<[TimePeriodProtocol]> {
        return periods.makeIterator()
    }

    public func map<T>(_ transform: (TimePeriodProtocol) throws -> T) rethrows -> [T] {
        return try periods.map(transform)
    }

    public func filter(_ isIncluded: (TimePeriodProtocol) throws -> Bool) rethrows -> [TimePeriodProtocol] {
        return try periods.filter(isIncluded)
    }

    public func forEach(_ body: (TimePeriodProtocol) throws -> Void) rethrows {
        return try periods.forEach(body)
    }

    public func split(maxSplits: Int, omittingEmptySubsequences: Bool, whereSeparator isSeparator: (TimePeriodProtocol) throws -> Bool) rethrows -> [AnySequence<TimePeriodProtocol>] {
        return try periods.split(maxSplits: maxSplits, omittingEmptySubsequences: omittingEmptySubsequences, whereSeparator: isSeparator).map(AnySequence.init)
    }

    subscript(index: Int) -> TimePeriodProtocol {
        get {
            return periods[index]
        }
    }

    internal func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, TimePeriodProtocol) throws -> Result) rethrows -> Result {
        return try periods.reduce(initialResult, nextPartialResult)
    }
    
    
    

} // class TimePeriodCollection
