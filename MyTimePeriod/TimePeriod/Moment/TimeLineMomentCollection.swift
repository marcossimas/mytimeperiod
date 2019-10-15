//
//  TimeLineMomentCollection.swift
//  MyTimePeriod
//
//  Created by Marcos Simas on 15/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation



//public class TimeLineMomentCollection : ITimeLineMomentCollection {
class TimeLineMomentCollection: TimelineMomentCollectionProtocol {
    
    
    // members
    //private readonly List<ITimeLineMoment> timeLineMoments = new List<ITimeLineMoment>();
    var timeLineMoments: [TimelineMomentProtocol] = [TimelineMomentProtocol]()
    
    
    //private readonly Dictionary<DateTime, ITimeLineMoment> timeLineMomentLookup = new Dictionary<DateTime, ITimeLineMoment>();
    var timeLineMomentLookup: [Date : TimelineMomentProtocol] = [Date : TimelineMomentProtocol]()
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeLineMomentCollection()
    {
    } // TimeLineMomentCollection*/
    
    
    init() {
    
    } // TimeLineMomentCollection
    
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeLineMomentCollection( IEnumerable<ITimePeriod> periods )
    {
        AddAll( periods );
    } // TimeLineMomentCollection*/
    
    
    init(periods: [TimePeriodProtocol])
    {
        addAll(periods: periods)
        
    } // TimeLineMomentCollection
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public int Count
    {
        get { return timeLineMoments.Count; }
    } // Count*/
    
    
    var count: Int {
        
        get { return timeLineMoments.count }
        
    } // Count
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public bool IsEmpty
    {
        get { return Count == 0; }
    } // IsEmpty*/
    
    
    
    
    var isEmpty: Bool {
    
        get { return count == 0 }
        
    } // IsEmpty
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public ITimeLineMoment Min
    {
        get { return !IsEmpty ? timeLineMoments[ 0 ] : null; }
    } // Min*/
    
    
    
    var min: TimelineMomentProtocol? {
    
        get { return !isEmpty ? timeLineMoments[0] : nil }
        
    } // Min
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public ITimeLineMoment Max
    {
        get { return !IsEmpty ? timeLineMoments[ Count - 1 ] : null; }
    } // Max*/
    
    
    
    var max: TimelineMomentProtocol? {
  
        get { return !isEmpty ? timeLineMoments[count - 1] : nil }
        
    } // Max
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public ITimeLineMoment this[ int index ]
    {
        get { return timeLineMoments[ index ]; }
    } // this[]*/
    
    
    subscript(index: Int) ->  TimelineMomentProtocol {
    
        get { return timeLineMoments[index] }
        
    }
    
    
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public ITimeLineMoment this[ DateTime moment ]
    {
        get { return timeLineMomentLookup[ moment ]; }
    } // this[]*/
    
    
    
    subscript(moment: Date) ->  TimelineMomentProtocol {
    
        get { return timeLineMomentLookup[moment]! }
        
    }
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*protected IList<ITimeLineMoment> Moments
    {
        get { return timeLineMoments; }
    } // Moments*/
    
    
    
    
    var moments: [TimelineMomentProtocol] {
    
        get { return timeLineMoments }
        
    } // Moments
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public void Clear()
    {
        timeLineMoments.Clear();
        timeLineMomentLookup.Clear();
    } // Clear*/
    
    
    
    /*func clear() -> () {
    
        timeLineMoments.Clear()
        
        timeLineMomentLookup.Clear()
        
    } // Clear*/
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public void Add( ITimePeriod period )
    {
        if ( period == null )
        {
            throw new ArgumentNullException( "period" );
        }
        AddStart( period.Start );
        AddEnd( period.End );
        Sort();
    } // Add*/
    
    
    
    func add(period: TimePeriodProtocol?) -> () {
    
        if (period == nil)
        {
            //throw new ArgumentNullException( "period" );
        }
        addStart(moment: period!.start!)
        addEnd(moment: period!.end!)
        sort()
        
    } // Add
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public void AddAll( IEnumerable<ITimePeriod> periods )
    {
        if ( periods == null )
        {
            throw new ArgumentNullException( "periods" );
        }

        foreach ( ITimePeriod period in periods )
        {
            AddStart( period.Start );
            AddEnd( period.End );
        }
        Sort();
    } // AddAll*/
    
    
    func addAll(periods: [TimePeriodProtocol]) -> () {
    
        if (periods.count == 0)
        {
            //throw new ArgumentNullException( "periods" );
        }

        for period in periods
        {
            addStart(moment: period.start!)
            addEnd(moment: period.end!)
        }
        sort()
    } // AddAll
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public void Remove( ITimePeriod period )
    {
        if ( period == null )
        {
            throw new ArgumentNullException( "period" );
        }

        RemoveStart( period.Start );
        RemoveEnd( period.End );
        Sort();
    } // Remove*/
    
    
    
    func remove(period: TimePeriodProtocol?) -> () {
    
        if (period == nil)
        {
            //throw new ArgumentNullException( "period" );
        }

        removeStart(moment: period!.start!)
        removeEnd(moment: period!.end!)
        sort()
        
    } // Remove
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public ITimeLineMoment Find( DateTime moment )
    {
        ITimeLineMoment timeLineMoment = null;
        if ( Count > 0 )
        {
            timeLineMomentLookup.TryGetValue( moment, out timeLineMoment );
        }
        return timeLineMoment;
    } // Find*/
    
    
    
    
    func find(moment: Date) -> TimelineMomentProtocol {
    
        var timeLineMoment: TimelineMomentProtocol? = nil
        if (count > 0)
        {
            timeLineMomentLookup.TryGetValue(moment, out timeLineMoment)
        }
        return timeLineMoment!
        
    } // Find
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public bool Contains( DateTime moment )
    {
        return timeLineMomentLookup.ContainsKey( moment );
    } // Contains*/
    
    
    
    func contains(moment: Date) -> Bool {
    
        return timeLineMomentLookup.ContainsKey(moment)
        
    } // Contains
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public bool HasOverlaps()
    {
        bool hasOverlaps = false;

        if ( Count > 1 )
        {
            bool start = true;
            foreach ( ITimeLineMoment timeLineMoment in timeLineMoments )
            {
                int startCount = timeLineMoment.StartCount;
                int endCount = timeLineMoment.EndCount;
                if ( start )
                {
                    if ( startCount != 1 || endCount > 1 )
                    {
                        hasOverlaps = true;
                        break;
                    }
                }
                else // end
                {
                    if ( startCount > 1 || endCount != 1 )
                    {
                        hasOverlaps = true;
                        break;
                    }
                }
                start = ( endCount - startCount ) > 0;
            }
        }

        return hasOverlaps;
    } // HasOverlaps*/
    
    
    
    
    
    func hasOverlaps() -> Bool {
    
        var localHasOverlaps: Bool = false

        if (count > 1)
        {
            var localStart: Bool = true
            
            for timeLineMoment in timeLineMoments {
            
                let startCount: Int = timeLineMoment.startCount
                let endCount: Int = timeLineMoment.endCount
                
                if (localStart)
                {
                    if (startCount != 1 || endCount > 1)
                    {
                        localHasOverlaps = true
                        break
                    }
                }
                else // end
                {
                    if (startCount > 1 || endCount != 1)
                    {
                        localHasOverlaps = true
                        break
                    }
                }
                localStart = (endCount - startCount) > 0;
            }
        }

        return localHasOverlaps
        
    } // HasOverlaps
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public bool HasGaps()
    {
        bool hasGaps = false;

        if ( Count > 1 )
        {
            int momentCount = 0;
            for ( int index = 0; index < timeLineMoments.Count; index++ )
            {
                ITimeLineMoment timeLineMoment = timeLineMoments[ index ];
                momentCount += timeLineMoment.StartCount;
                momentCount -= timeLineMoment.EndCount;
                if ( momentCount == 0 && index > 0 && index < timeLineMoments.Count - 1 )
                {
                    hasGaps = true;
                    break;
                }
            }
        }

        return hasGaps;
    } // HasGaps*/
    
    
    
    func hasGaps() -> Bool {
    
        var localHasGaps = false

        if (count > 1)
        {
            var momentCount: Int = 0
            
            //for ( int index = 0; index < timeLineMoments.Count; index++ )
            for index in 0..<timeLineMoments.count {
            
                let timeLineMoment: TimelineMomentProtocol = timeLineMoments[index]
                momentCount += timeLineMoment.startCount
                momentCount -= timeLineMoment.endCount
                if (momentCount == 0 && index > 0 && index < timeLineMoments.count - 1)
                {
                    localHasGaps = true
                    break
                }
            }
        }

        return localHasGaps
    } // HasGaps
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public IEnumerator<ITimeLineMoment> GetEnumerator()
    {
        return timeLineMoments.GetEnumerator();
    } // GetEnumerator*/
    
    
    func getEnumerator() -> IndexingIterator<[TimelineMomentProtocol]> {
        
        return timeLineMoments.makeIterator()
    }
    
    
    
/*
    

    // ----------------------------------------------------------------------
    IEnumerator IEnumerable.GetEnumerator()
    {
        return GetEnumerator();
    
    } // IEnumerable.GetEnumerator
    
    
    
*/
    
    


    // ----------------------------------------------------------------------
    /*protected virtual void AddStart( DateTime moment )
    {
        ITimeLineMoment timeLineMoment = Find( moment );
        if ( timeLineMoment == null )
        {
            timeLineMoment = new TimeLineMoment( moment );
            timeLineMoments.Add( timeLineMoment );
            timeLineMomentLookup.Add( moment, timeLineMoment );
        }
        timeLineMoment.AddStart();
    } // AddStart*/
    
    
    
    func addStart(moment: Date) -> () {
    
        var timeLineMoment: TimelineMomentProtocol? = find(moment: moment)
        if (timeLineMoment == nil)
        {
            timeLineMoment = TimelineMoment(moment)
            timeLineMoments.add(timeLineMoment)
            timeLineMomentLookup.add(moment, timeLineMoment)
        }
        timeLineMoment.addStart()
        
    } // AddStart
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*protected virtual void AddEnd( DateTime moment )
    {
        ITimeLineMoment timeLineMoment = Find( moment );
        if ( timeLineMoment == null )
        {
            timeLineMoment = new TimeLineMoment( moment );
            timeLineMoments.Add( timeLineMoment );
            timeLineMomentLookup.Add( moment, timeLineMoment );
        }
        timeLineMoment.AddEnd();
    } // AddEnd*/
    
    
    
    
    func addEnd(moment: Date) -> () {
    
        var timeLineMoment: TimelineMomentProtocol? = find(moment: moment)
        
        if (timeLineMoment == nil)
        {
            timeLineMoment = TimelineMoment(moment)
            timeLineMoments.add(timeLineMoment)
            timeLineMomentLookup.add(moment, timeLineMoment)
        }
        timeLineMoment!.addEnd()
        
    } // AddEnd
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*protected virtual void RemoveStart( DateTime moment )
    {
        ITimeLineMoment timeLineMoment = Find( moment );
        if ( timeLineMoment == null )
        {
            throw new InvalidOperationException();
        }

        timeLineMoment.RemoveStart();
        if ( timeLineMoment.IsEmpty )
        {
            timeLineMoments.Remove( timeLineMoment );
            timeLineMomentLookup.Remove( moment );
        }
    } // RemoveStart*/
    
    
    
    
    func removeStart(moment: Date) -> () {
    
        var timeLineMoment: TimelineMomentProtocol? = find(moment: moment)
        
        if (timeLineMoment == nil)
        {
            //throw new InvalidOperationException();
        }

        timeLineMoment!.removeStart()
        if (timeLineMoment!.isEmpty)
        {
            timeLineMoments.remove(timeLineMoment)
            timeLineMomentLookup.remove(moment)
        }
    } // RemoveStart
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*protected virtual void RemoveEnd( DateTime moment )
    {
        ITimeLineMoment timeLineMoment = Find( moment );
        if ( timeLineMoment == null )
        {
            throw new InvalidOperationException();
        }

        timeLineMoment.RemoveEnd();
        if ( timeLineMoment.IsEmpty )
        {
            timeLineMoments.Remove( timeLineMoment );
            timeLineMomentLookup.Remove( moment );
        }
    } // RemoveEnd*/
    
    
    
    func removeEnd(moment: Date) -> () {
    
        var timeLineMoment: TimelineMomentProtocol? = find(moment: moment)
        if (timeLineMoment == nil)
        {
            //throw new InvalidOperationException();
        }

        timeLineMoment!.removeEnd()
        if (timeLineMoment!.isEmpty)
        {
            timeLineMoments.remove(timeLineMoment)
            timeLineMomentLookup.remove(moment)
        }
    } // RemoveEnd
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*protected virtual void Sort()
    {
        timeLineMoments.Sort( ( left, right ) => left.Moment.CompareTo( right.Moment ) );
    } // Sort*/
    
    
    
    
    func sort() -> () {
    
        timeLineMoments.sort((left, right) => left.moment.CompareTo(right.Moment))
        
    } // Sort
    
    
    
    

    
    
    
    
    
    

    
    
    
    

} // class TimeLineMomentCollection