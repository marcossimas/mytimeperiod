//
//  TimeRange.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 09/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation


class TimeRange: TimeRangeProtocol {
    
    
    
    

    // ----------------------------------------------------------------------
    //public static readonly TimeRange Anytime = new TimeRange( true );
    static var anytime: TimeRange = TimeRange(isReadOnly: true)
    
    
    
    
    
    
    // ----------------------------------------------------------------------
    /*// members
    private readonly bool isReadOnly;
    private DateTime start;
    private DateTime end;*/
    
    
    private var localIsReadOnly: Bool
    private var localStart: Date
    private var localEnd: Date
    
    
    
    

    
    // ----------------------------------------------------------------------
    /*public TimeRange() :
        this( TimeSpec.MinPeriodDate, TimeSpec.MaxPeriodDate )
    {
    } // TimeRange*/
    
    init() {
        
        localStart = TimeSpec.minPeriodDate
        localEnd = TimeSpec.maxPeriodDate
        localIsReadOnly = false
        
    }
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*internal TimeRange( bool isReadOnly = false ) :
        this( TimeSpec.MinPeriodDate, TimeSpec.MaxPeriodDate, isReadOnly )
    {
    } // TimeRange*/
    
    init(isReadOnly: Bool = false) {
        
        localStart = TimeSpec.minPeriodDate
        localEnd = TimeSpec.maxPeriodDate
        localIsReadOnly = isReadOnly
        
    }
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeRange( DateTime moment, bool isReadOnly = false ) :
        this( moment, moment, isReadOnly )
    {
    } // TimeRange*/
    
    init(moment: Date, isReadOnly: Bool = false) {
        
        localStart = moment
        localEnd = moment
        localIsReadOnly = isReadOnly
        
    }
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeRange( DateTime start, DateTime end, bool isReadOnly = false )
    {
        if ( start <= end )
        {
            this.start = start;
            this.end = end;
        }
        else
        {
            this.end = start;
            this.start = end;
        }
        this.isReadOnly = isReadOnly;
    } // TimeRange*/
    
    
    
    
    
    init(start: Date, end: Date, isReadOnly: Bool = false) {
        
        if (start <= end) {
            
            localStart = start
            localEnd = end
            
        } else {
            
            localEnd = start
            localStart = end
        }
        
        localIsReadOnly = isReadOnly
        
    }
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeRange( DateTime start, TimeSpan duration, bool isReadOnly = false )
    {
        if ( duration >= TimeSpan.Zero )
        {
            this.start = start;
            end = start.Add( duration );
        }
        else
        {
            this.start = start.Add( duration );
            end = start;
        }
        this.isReadOnly = isReadOnly;
    } // TimeRange*/
    
    
    
    
    
    init(start: Date, duration: TimeInterval, isReadOnly: Bool = false) {
        
        if (duration >= TimeSpec.minPeriodDuration)
        {
            localStart = start
            localEnd = start.addingTimeInterval(duration)
        }
        else
        {
            localStart = start.addingTimeInterval(duration)
            localEnd = start
        }
        
        localIsReadOnly = isReadOnly
        
    }
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeRange( ITimePeriod copy )
    {
        if ( copy == null )
        {
            throw new ArgumentNullException( "copy" );
        }
        start = copy.Start;
        end = copy.End;
        isReadOnly = copy.IsReadOnly;
    } // TimeRange*/
    
    
    
    
    init(copy: TimePeriodProtocol?) {
        
        if (copy == nil) {
            
            //throw new ArgumentNullException( "copy" );
            
        }
        
        localStart = copy!.start
        localEnd = copy!.end
        localIsReadOnly = copy!.isReadOnly
        
    }
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*protected TimeRange( ITimePeriod copy, bool isReadOnly )
    {
        if ( copy == null )
        {
            throw new ArgumentNullException( "copy" );
        }
        start = copy.Start;
        end = copy.End;
        this.isReadOnly = isReadOnly;
    } // TimeRange*/
    
    
    
    
    init(copy: TimePeriodProtocol?, isReadOnly: Bool) {
        
        if (copy == nil) {
            
            //throw new ArgumentNullException( "copy" );
            
        }
        
        localStart = copy!.start
        localEnd = copy!.end
        localIsReadOnly = isReadOnly
        
    }
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public bool IsReadOnly
    {
        get { return isReadOnly; }
    } // IsReadOnly*/
    
    var isReadOnly: Bool {
        
        get {
            
            return localIsReadOnly
            
        }
        
    }
    

    
    
    
    
    

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
        get { return start.Equals( end ); }
    } // IsMoment*/
    
    
    var isMoment: Bool {
        
        //get { return start.equals(end) }
        
        get { return (abs(localStart.timeIntervalSince1970 - localEnd.timeIntervalSince1970) <= 0) }
        
    }
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public bool HasStart
    {
        get { return start != TimeSpec.MinPeriodDate; }
    } // HasStart*/
    
    
    var hasStart: Bool {
        
        get { return start != TimeSpec.minPeriodDate }
        
    }
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public DateTime Start
    {
        get { return start; }
        set
        {
            CheckModification();
            if ( value > end )
            {
                throw new ArgumentOutOfRangeException( "value" );
            }
            start = value;
        }
    } // Start*/
    
    
    
    var start: Date {
        
        get { return localStart }
        
        set(value) {
            
            checkModification()
            
            if (value > localEnd)
            {
                //throw new ArgumentOutOfRangeException( "value" );
            }
            
            localStart = value
            
        }
        
    }
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public bool HasEnd
    {
        get { return end != TimeSpec.MaxPeriodDate; }
    } // HasEnd*/
    
    
    var hasEnd: Bool {
        
        get { return end != TimeSpec.maxPeriodDate }
        
    }
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public DateTime End
    {
        get { return end; }
        set
        {
            CheckModification();
            if ( value < start )
            {
                throw new ArgumentOutOfRangeException( "value" );
            }
            end = value;
        }
    } // End*/
    
    
    
    var end: Date {
        
        get { return localEnd }
        
        set(value) {
            
            checkModification()
            
            if (value < localStart) {
                //throw new ArgumentOutOfRangeException( "value" );
            }
            
            localEnd = value
            
        }
        
    }
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeSpan Duration
    {
        get { return end.Subtract( start ); }
        set
        {
            CheckModification();
            end = start.Add( value );
        }
    } // Duration*/
    
    
    var duration: TimeInterval {
        
        
        get { return localEnd.timeIntervalSince(localStart) }
        
        set(value) {
            
            checkModification()
            
            localEnd = localStart.addingTimeInterval(value)
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
/*
    // ----------------------------------------------------------------------
    /*public string DurationDescription
    {
        get { return TimeFormatter.Instance.GetDuration( Duration, DurationFormatType.Detailed ); }
    } // DurationDescription*/
    
    
    
    var durationDescription: String {
        
        get { return TimeFormatter.Instance.getDuration(duration, DurationFormatType.detailed) }
        
    }
    
    */
    
    
    


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
        
        return provider!.getDuration(start: start, end: end)
        
    }
    
    

    
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual void Setup( DateTime newStart, DateTime newEnd )
    {
        CheckModification();
        if ( newStart <= newEnd )
        {
            start = newStart;
            end = newEnd;
        }
        else
        {
            end = newStart;
            start = newEnd;
        }
    } // Setup*/
    
    
    func setup(newStart: Date, newEnd: Date) -> () {
        
        checkModification()
        
        if (newStart <= newEnd)
        {
            localStart = newStart
            localEnd = newEnd
        }
        else
        {
            localEnd = newStart
            localStart = newEnd
        }
        
    }
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual bool IsSamePeriod( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }
        return start == test.Start && end == test.End;
    } // IsSamePeriod*/
    
    
    
    func isSamePeriod(test: TimePeriodProtocol?) -> Bool {
        
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" )
        }
        return localStart == test!.start && localEnd == test!.end
        
    }
    
    
    
    

    

    // ----------------------------------------------------------------------
    /*public virtual bool HasInside( DateTime test )
    {
        return TimePeriodCalc.HasInside( this, test );
    } // HasInside*/
    
    
    
    func hasInside(test: Date) -> Bool {
        
        return TimePeriodCalc.hasInside(period: self, test: test)
        
    }
    
    
    
    


    // ----------------------------------------------------------------------
    /*public virtual bool HasInside( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }
        return TimePeriodCalc.HasInside( this, test );
    } // HasInside*/
    
    
    
    func hasInside(test: TimePeriodProtocol?) -> Bool {
        
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }
        return TimePeriodCalc.hasInside(period: self, test: test!)
        
    }
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public ITimeRange Copy()
    {
        return Copy( TimeSpan.Zero );
    } // Copy*/
    
    
    func copy() -> TimeRangeProtocol {
        
        return copy(offset: TimeSpec.minPeriodDuration)
        
    }
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual ITimeRange Copy( TimeSpan offset )
    {
        return new TimeRange( start.Add( offset ), end.Add( offset ), IsReadOnly );
    } // Copy*/
    
    
    
    func copy(offset: TimeInterval) -> TimeRangeProtocol {
        
        return TimeRange(start: localStart.addingTimeInterval(offset), end: localEnd.addingTimeInterval(offset), isReadOnly: isReadOnly)
        
    }
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual void Move( TimeSpan offset )
    {
        CheckModification();
        if ( offset == TimeSpan.Zero )
        {
            return;
        }
        start = start.Add( offset );
        end = end.Add( offset );
    } // Move*/
    
    
    
    func move(offset: TimeInterval) -> () {
        
        checkModification()
        
        if (offset == TimeSpec.minPeriodDuration)
        {
            return
        }
        
        localStart = localStart.addingTimeInterval(offset)
        localEnd = localEnd.addingTimeInterval(offset)
        
    }
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual void ExpandStartTo( DateTime moment )
    {
        CheckModification();
        if ( start > moment )
        {
            start = moment;
        }
    } // ExpandStartTo*/
    
    
    
    func expandStartTo(moment: Date) -> () {
        
        checkModification()
        
        if (localStart > moment)
        {
            localStart = moment
        }
        
    }
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual void ExpandEndTo( DateTime moment )
    {
        CheckModification();
        if ( end < moment )
        {
            end = moment;
        }
    } // ExpandEndTo*/
    
    
    
    
    func expandEndTo(moment: Date) -> () {
        
        checkModification()
        
        if (localEnd < moment)
        {
            localEnd = moment
        }
        
    }
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public void ExpandTo( DateTime moment )
    {
        ExpandStartTo( moment );
        ExpandEndTo( moment );
    } // ExpandTo*/
    
    
    
    func expandTo(moment: Date) -> () {
        
        expandStartTo(moment: moment)
        expandEndTo(moment: moment)
        
    }

    
    
    
    
    
    
    
    // ----------------------------------------------------------------------
    /*public void ExpandTo( ITimePeriod period )
    {
        if ( period == null )
        {
            throw new ArgumentNullException( "period" );
        }
        ExpandStartTo( period.Start );
        ExpandEndTo( period.End );
    } // ExpandTo*/
    
    
    
    
    func expandTo(period: TimePeriodProtocol?) -> () {
        
        if (period == nil)
        {
            //throw new ArgumentNullException( "period" );
        }
        
        expandStartTo(moment: period!.start)
        expandEndTo(moment: period!.end)
        
    }
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual void ShrinkStartTo( DateTime moment )
    {
        CheckModification();
        if ( HasInside( moment ) && start < moment )
        {
            start = moment;
        }
    } // ShrinkStartTo*/
    
    
    
    
    func shrinkStartTo(moment: Date) -> () {
        
        checkModification()
        
        if (hasInside(test: moment) && localStart < moment)
        {
            localStart = moment
        }
        
    }
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual void ShrinkEndTo( DateTime moment )
    {
        CheckModification();
        if ( HasInside( moment ) && end > moment )
        {
            end = moment;
        }
    } // ShrinkEndTo*/
    
    
    
    func shrinkEndTo(moment: Date) -> () {
        
        checkModification()
        
        if (hasInside(test: moment) && localEnd > moment)
        {
            localEnd = moment
        }
        
    }
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public void ShrinkTo( ITimePeriod period )
    {
        if ( period == null )
        {
            throw new ArgumentNullException( "period" );
        }
        ShrinkStartTo( period.Start );
        ShrinkEndTo( period.End );
    } // ShrinkTo*/
    
    
    
    
    func shrinkTo(period: TimePeriodProtocol?) -> () {
        
        if (period == nil)
        {
            //throw new ArgumentNullException( "period" );
        }
        shrinkStartTo(moment: period!.start)
        shrinkEndTo(moment: period!.end)
        
    }
    

    
    
    

    // ----------------------------------------------------------------------
    /*public virtual bool IntersectsWith( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }
        return TimePeriodCalc.IntersectsWith( this, test );
    } // IntersectsWith*/
    
    
    
    
    
    func intersectsWith(test: TimePeriodProtocol?) -> Bool {
        
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }
        return TimePeriodCalc.intersectsWith(period: self, test: test!)
        
    }
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual ITimeRange GetIntersection( ITimePeriod period )
    {
        if ( period == null )
        {
            throw new ArgumentNullException( "period" );
        }
        if ( !IntersectsWith( period ) )
        {
            return null;
        }
        DateTime periodStart = period.Start;
        DateTime periodEnd = period.End;
        return new TimeRange(
            periodStart > start ? periodStart : start,
            periodEnd < end ? periodEnd : end,
            IsReadOnly );
    } // GetIntersection*/
    
    
    
    
    
    
    func getIntersection(period: TimePeriodProtocol?) -> TimeRangeProtocol? {
        
        if (period == nil)
        {
            //throw new ArgumentNullException( "period" );
        }
        if (!intersectsWith(test: period))
        {
            return nil
        }
        let periodStart: Date = period!.start
        let periodEnd: Date = period!.end
        
        return TimeRange(start: periodStart > localStart ? periodStart : localStart, end: periodEnd < localEnd ? periodEnd : localEnd, isReadOnly: isReadOnly)
        
    }
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual bool OverlapsWith( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }
        return TimePeriodCalc.OverlapsWith( this, test );
    } // OverlapsWith*/
    
    
    
    func overlapsWith(test: TimePeriodProtocol?) -> Bool {
        
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }
        return TimePeriodCalc.overlapsWith(period: self, test: test!)
        
    }
    

    
    


    // ----------------------------------------------------------------------
    /*public virtual PeriodRelation GetRelation( ITimePeriod test )
    {
        if ( test == null )
        {
            throw new ArgumentNullException( "test" );
        }
        return TimePeriodCalc.GetRelation( this, test );
    } // GetRelation*/
    
    
    
    
    
    func getRelation(test: TimePeriodProtocol?) -> PeriodRelation {
        
        if (test == nil)
        {
            //throw new ArgumentNullException( "test" );
        }
        
        return TimePeriodCalc.getRelation(period: self, test: test!)
        
    }
    
    

    
    
    
    
    
    

/*
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
    
    
*/
    
    
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
        
    }
    
    


    
    
    

    // ----------------------------------------------------------------------
    /*public virtual void Reset()
    {
        CheckModification();
        start = TimeSpec.MinPeriodDate;
        end = TimeSpec.MaxPeriodDate;
    } // Reset*/
    
    
    
    func reset() -> () {
        
        checkModification()
        
        localStart = TimeSpec.minPeriodDate
        localEnd = TimeSpec.maxPeriodDate
        
    }
    
    
    
    
    
    
    
    /*

    // ----------------------------------------------------------------------
    /*public string GetDescription( ITimeFormatter formatter = null )
    {
        return Format( formatter ?? TimeFormatter.Instance );
    } // GetDescription*/
    
    
    
    
    
    func getDescription(formatter: TimeFormatterProtocol? = nil) -> String {
        
        return format(formatter ?? TimeFormatter.Instance)
        
    }
    
    
    */
    
    
    
    /*

    // ----------------------------------------------------------------------
    /*protected virtual string Format( ITimeFormatter formatter )
    {
        return formatter.GetPeriod( start, end, Duration );
    } // Format*/
    
    
    
    
    func format(formatter: TimeFormatterProtocol) -> String {
        
        return formatter.getPeriod(start: localStart, end: localEnd, duration: duration)
        
    }
    
    
    */
    
    
    
    
    
    /*

    // ----------------------------------------------------------------------
    /*public override string ToString()
    {
        return GetDescription();
    } // ToString*/
    
    
    
    
    
    
    func toString() -> String {
        
        return getDescription()
        
    }
    
    
    */
    
    

    
    
    
    /*
    // ----------------------------------------------------------------------
    /*public sealed override bool Equals( object obj )
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
    } // Equals*/
    
    
    
    
    
    
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
        return HasSameData( obj as TimeRange );
    } // IsEqual*/
    
    
    
    
    
    func isEqual(obj: NSObject) -> Bool {
        
        return hasSameData(comp: obj as TimeRange)
        
    }
    
    
    */
    
    
    

    // ----------------------------------------------------------------------
    /*private bool HasSameData( TimeRange comp )
    {
        return start == comp.start && end == comp.end && isReadOnly == comp.isReadOnly;
    } // HasSameData*/
    
    
    
    
    
    func hasSameData(comp: TimeRange) -> Bool {
        
        return localStart == comp.start && localEnd == comp.end && localIsReadOnly == comp.isReadOnly

        
    }
    
    
    
    
    
    
/*
    // ----------------------------------------------------------------------
    /*public sealed override int GetHashCode()
    {
        return HashTool.AddHashCode( GetType().GetHashCode(), ComputeHashCode() );
    } // GetHashCode*/
    
    
    
    
    
    func getHashCode() -> Int {
        
        return hashTool.addHashCode(getType().getHashCode(), computeHashCode())
        
    }
    
    
    
    
*/
    
    
    /*
    

    // ----------------------------------------------------------------------
    /*protected virtual int ComputeHashCode()
    {
        return HashTool.ComputeHashCode( isReadOnly, start, end );
    } // ComputeHashCode*/
    
    
    
    
    func computeHashCode() -> Int {
        
        return hashTool.computeHashCode(localIsReadOnly, localStart, localEnd)
        
    }
    
    
    */
    
    
    

    // ----------------------------------------------------------------------
    /*protected void CheckModification()
    {
        if ( IsReadOnly )
        {
            throw new NotSupportedException( "TimeRange is read-only" );
        }
    } // CheckModification*/
    
    
    
    func checkModification() {
        
        if (isReadOnly) {

            //throw new NotSupportedException( "TimeRange is read-only" );
            
        }
        
    }
    
    
    

} //  TimeRange

