//
//  TimeBlock.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 09/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation


class TimeBlock: TimeBlockProtocol {
    
    

    // ----------------------------------------------------------------------
    //public static readonly TimeBlock Anytime = new TimeBlock( true );
    static var anytime: TimeBlock = TimeBlock(isReadOnly: true)
    
    
    
    // ----------------------------------------------------------------------
    /*// members
    private readonly bool isReadOnly;
    private DateTime start;
    private TimeSpan duration;
    private DateTime end;  // cache*/
    
    
    private var localIsReadOnly: Bool
    private var localStart: Date
    private var localDuration: TimeInterval
    private var localEnd: Date
    
    

    
    /*// ----------------------------------------------------------------------
    public TimeBlock() :
        this( TimeSpec.MinPeriodDate, TimeSpec.MaxPeriodDate )
    {
    } // TimeBlock */
    
    
    
    
    init() {
        
        localStart = TimeSpec.minPeriodDate
        localEnd = TimeSpec.maxPeriodDate
        localDuration = localEnd.timeIntervalSince(localStart)
        localIsReadOnly = false
        
    }
    
    
    
    
    
    

    /*// ----------------------------------------------------------------------
    internal TimeBlock( bool isReadOnly = false ) :
        this( TimeSpec.MinPeriodDate, TimeSpec.MaxPeriodDate, isReadOnly )
    {
    } // TimeBlock*/
    
    
    
    init(isReadOnly: Bool = false) {
        
        localStart = TimeSpec.minPeriodDate
        localEnd = TimeSpec.maxPeriodDate
        localDuration = localEnd.timeIntervalSince(localStart)
        localIsReadOnly = isReadOnly
        
    }
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeBlock( DateTime moment, bool isReadOnly = false ) :
        this( moment, TimeSpec.MinPeriodDuration, isReadOnly )
    {
    } // TimeBlock*/
    
    
    init(moment: Date, isReadOnly: Bool = false) {
        
        localStart = moment
        localDuration = TimeSpec.minPeriodDuration
        localEnd = moment.addingTimeInterval(localDuration)
        localIsReadOnly = isReadOnly
        
    }
    
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeBlock( DateTime start, DateTime end, bool isReadOnly = false )
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
        duration = this.end - this.start;
        this.isReadOnly = isReadOnly;
    } // TimeBlock*/
    
    
    
    
    
    
    init(start: Date, end: Date, isReadOnly: Bool = false) {
        
        if (start <= end) {
            
            localStart = start
            localEnd = end
            
        } else {
            
            localEnd = start
            localStart = end
        }
        
        localDuration = localEnd.timeIntervalSince(localStart)
        
        localIsReadOnly = isReadOnly
        
    }
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeBlock( DateTime start, TimeSpan duration, bool isReadOnly = false )
    {
        if ( duration < TimeSpec.MinPeriodDuration )
        {
            throw new ArgumentOutOfRangeException( "duration" );
        }
        this.start = start;
        this.duration = duration;
        end = start.Add( duration );
        this.isReadOnly = isReadOnly;
    } // TimeBlock*/
    
    
    
    
    
    
    init(start: Date, duration: TimeInterval, isReadOnly: Bool = false) {
        
        if (duration < TimeSpec.minPeriodDuration)
        {
            //throw new ArgumentOutOfRangeException( "duration" );
        }
        localStart = start
        localDuration = duration
        localEnd = start.addingTimeInterval(duration)
        localIsReadOnly = isReadOnly
        
    }
    
    
    
    
    
    
    
    
    
    
    // ----------------------------------------------------------------------
    /*public TimeBlock( TimeSpan duration, DateTime end, bool isReadOnly = false )
    {
        if ( duration < TimeSpec.MinPeriodDuration )
        {
            throw new ArgumentOutOfRangeException( "duration" );
        }
        this.end = end;
        this.duration = duration;
        start = end.Subtract( duration );
        this.isReadOnly = isReadOnly;
    } // TimeBlock*/
    
    
    
    init(duration: TimeInterval, end: Date, isReadOnly: Bool = false) {
        
        if (duration < TimeSpec.minPeriodDuration)
        {
            //throw new ArgumentOutOfRangeException( "duration" );
        }
            localEnd = end
            localDuration = duration
            localStart = end.addingTimeInterval(-duration)
            localIsReadOnly = isReadOnly
    
    }
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeBlock( ITimePeriod copy )
    {
        if ( copy == null )
        {
            throw new ArgumentNullException( "copy" );
        }
        start = copy.Start;
        end = copy.End;
        duration = copy.Duration;
        isReadOnly = copy.IsReadOnly;
    } // TimeBlock*/
        
        
        
        
        
    init(copy: TimePeriodProtocol?) {
        
        if (copy == nil) {
            
            //throw new ArgumentNullException( "copy" );
            
        }
        
        localStart = copy!.start!
        localEnd = copy!.end!
        localDuration = copy!.duration!
        localIsReadOnly = copy!.isReadOnly
        
    }
        
        
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*protected TimeBlock( ITimePeriod copy, bool isReadOnly )
    {
        if ( copy == null )
        {
            throw new ArgumentNullException( "copy" );
        }
        start = copy.Start;
        end = copy.End;
        duration = copy.Duration;
        this.isReadOnly = isReadOnly;
    } // TimeBlock*/
    
    
    
    
    
    init(copy: TimePeriodProtocol?, isReadOnly: Bool) {
        
        if (copy == nil) {
            
            //throw new ArgumentNullException( "copy" );
            
        }
        
        localStart = copy!.start!
        localEnd = copy!.end!
        localDuration = copy!.duration!
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
            start = value;
            end = start.Add( duration );
        }
    } // Start*/
    
    
    
    var start: Date? {
        
        get { return localStart }
        
        set(value) {
            
            checkModification()
            
            localStart = value!
            localEnd = localStart.addingTimeInterval(localDuration)
            
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
            end = value;
            start = end.Subtract( duration );
        }
    } // End*/
    
    
    
    var end: Date? {
        
        get { return localEnd }
        
        set(value) {
            
            checkModification()
            
            localEnd = value!
            localStart = localEnd.addingTimeInterval(-localDuration)
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeSpan Duration
    {
        get { return duration; }
        set { DurationFromStart( value ); }
    } // Duration*/
    
    
    var duration: TimeInterval? {
        
        
        get { return localDuration }
        
        set(value) {
            
            durationFromStart(newDuration: value!)
            
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
        
        return provider!.getDuration(start: start!, end: end!)
        
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
        duration = end - start;
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
        
        localDuration = localEnd.timeIntervalSince(localStart)
        
    }
    
    
    
    
    
    
    // ----------------------------------------------------------------------
    /*public virtual void Setup( DateTime newStart, TimeSpan newDuration )
    {
        CheckModification();
        if ( newDuration < TimeSpec.MinPeriodDuration )
        {
            throw new ArgumentOutOfRangeException( "newDuration" );
        }
        start = newStart;
        duration = newDuration;
        end = start.Add( duration );
    } // Setup*/
    
    
    
    
    
    func setup(newStart: Date, newDuration: TimeInterval) -> () {
        
        checkModification()
        
        if (newDuration < TimeSpec.minPeriodDuration)
        {
            // throw new ArgumentOutOfRangeException( "newDuration" );
        }
        
        localStart = newStart
        localDuration = newDuration
        localEnd = localStart.addingTimeInterval(localDuration)
        
    }
    
    
    
    
    
    
    
    // ----------------------------------------------------------------------
    /*public ITimeBlock Copy()
    {
        return Copy( TimeSpan.Zero );
    } // Copy*/
    
    
    func copy() -> TimeBlockProtocol {
        
        return copy(offset: TimeSpec.minPeriodDuration)
        
    }
    
    
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual ITimeBlock Copy( TimeSpan offset )
    {
        return new TimeBlock( start.Add( offset ), end.Add( offset ), IsReadOnly );
    } // Copy*/
    
    
    
    
    func copy(offset: TimeInterval) -> TimeBlockProtocol {
        
        return TimeBlock(start: localStart.addingTimeInterval(offset), end: localEnd.addingTimeInterval(offset), isReadOnly: isReadOnly)
        
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
    /*public ITimeBlock GetPreviousPeriod()
    {
        return GetPreviousPeriod( TimeSpan.Zero );
    } // GetPreviousPeriod*/
    
    
    
    func getPreviousPeriod() -> TimeBlockProtocol {
        
        return getPreviousPeriod(offset: TimeSpec.minPeriodDuration)
        
    }
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual ITimeBlock GetPreviousPeriod( TimeSpan offset )
    {
        return new TimeBlock( Duration, Start.Add( offset ), IsReadOnly );
    } // GetPreviousPeriod*/
    
    
    
    func getPreviousPeriod(offset: TimeInterval) -> TimeBlockProtocol {
        
        return TimeBlock(duration: duration!, end: start!.addingTimeInterval(offset), isReadOnly: isReadOnly)
        
    }
    
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public ITimeBlock GetNextPeriod()
    {
        return GetNextPeriod( TimeSpan.Zero );
    } // GetNextPeriod*/
    
    
    func getNextPeriod() -> TimeBlockProtocol {
        
        return getNextPeriod(offset: TimeSpec.minPeriodDuration)
        
    }
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual ITimeBlock GetNextPeriod( TimeSpan offset )
    {
        return new TimeBlock( End.Add( offset ), Duration, IsReadOnly );
    } // GetNextPeriod*/
    
    
    
    func getNextPeriod(offset: TimeInterval) -> TimeBlockProtocol {
        
        return TimeBlock(start: end!.addingTimeInterval(offset), duration: duration!, isReadOnly: isReadOnly)
        
    }
    
    
    
    
    
    
    
    // ----------------------------------------------------------------------
    /*public virtual void DurationFromStart( TimeSpan newDuration )
    {
        if ( newDuration < TimeSpec.MinPeriodDuration )
        {
            throw new ArgumentOutOfRangeException( "newDuration" );
        }
        CheckModification();

        duration = newDuration;
        end = start.Add( newDuration );
    } // DurationFromStart*/
    
    
    
    func durationFromStart(newDuration: TimeInterval) -> () {
        
        if (newDuration < TimeSpec.minPeriodDuration)
        {
            // throw new ArgumentOutOfRangeException( "newDuration" );
        }
        
        checkModification()

        localDuration = newDuration
        localEnd = localStart.addingTimeInterval(newDuration)
        
    }
    
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public virtual void DurationFromEnd( TimeSpan newDuration )
    {
        if ( newDuration < TimeSpec.MinPeriodDuration )
        {
            throw new ArgumentOutOfRangeException( "newDuration" );
        }
        CheckModification();

        duration = newDuration;
        start = end.Subtract( newDuration );
    } // DurationFromEnd*/
    
    
    
    func durationFromEnd(newDuration: TimeInterval) -> () {
        
        if (newDuration < TimeSpec.minPeriodDuration)
        {
            // throw new ArgumentOutOfRangeException( "newDuration" );
        }
        
        checkModification()

        localDuration = newDuration
        localStart = localEnd.addingTimeInterval(-newDuration)
        
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
    /*public virtual ITimeBlock GetIntersection( ITimePeriod period )
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
        return new TimeBlock(
            periodStart > start ? periodStart : start,
            periodEnd < end ? periodEnd : end,
            IsReadOnly );
    } // GetIntersection*/
    
    
    
    
    
    
    func getIntersection(period: TimePeriodProtocol?) -> TimeBlockProtocol? {
        
        if (period == nil)
        {
            //throw new ArgumentNullException( "period" );
        }
        if (!intersectsWith(test: period))
        {
            return nil
        }
        let periodStart: Date = period!.start!
        let periodEnd: Date = period!.end!
        
        return TimeBlock(start: periodStart > localStart ? periodStart : localStart, end: periodEnd < localEnd ? periodEnd : localEnd, isReadOnly: isReadOnly)
        
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
        duration = TimeSpec.MaxPeriodDuration;
        end = TimeSpec.MaxPeriodDate;
    } // Reset*/
    
    
    
    func reset() -> () {
        
        checkModification()
        
        localStart = TimeSpec.minPeriodDate
        localDuration = TimeSpec.maxPeriodDuration
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
        return HasSameData( obj as TimeBlock );
    } // IsEqual*/
     
    
    
    func isEqual(obj: NSObject) -> Bool {
        
        return hasSameData(comp: obj as TimeBlock)
        
    }
    
    
    */
    
    
    

    // ----------------------------------------------------------------------
    /*private bool HasSameData( TimeBlock comp )
    {
        return start == comp.start && end == comp.end && isReadOnly == comp.isReadOnly;
    } // HasSameData*/
    
    
    func hasSameData(comp: TimeBlock) -> Bool {
        
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
        return HashTool.ComputeHashCode( isReadOnly, start, end, duration );
    } // ComputeHashCode*/
    
    
    
    
    func computeHashCode() -> Int {
        
        return hashTool.computeHashCode(localIsReadOnly, localStart, localEnd, localDuration)
        
    }
    
    
    */
    
    
    

    // ----------------------------------------------------------------------
    /*protected void CheckModification()
    {
        if ( IsReadOnly )
        {
            throw new NotSupportedException( "TimeBlock is read-only" );
        }
    } // CheckModification*/
    
    
    
    func checkModification() {
        
        if (isReadOnly) {

            //throw new NotSupportedException( "TimeBlock is read-only" );
            
        }
        
    }
    
    
    

} //  TimeBlock
