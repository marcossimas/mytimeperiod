//
//  TimelineMomentCollectionProtocol.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 09/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation






//public interface ITimeLineMomentCollection : IEnumerable<ITimeLineMoment> {
protocol TimelineMomentCollectionProtocol {

    // ----------------------------------------------------------------------
    //int Count { get; }
    var count: Int { get }

    // ----------------------------------------------------------------------
    //bool IsEmpty { get; }
    var isEmpty: Bool { get }

    // ----------------------------------------------------------------------
    //ITimeLineMoment Min { get; }
    var min: TimelineMomentProtocol? { get }

    // ----------------------------------------------------------------------
    //ITimeLineMoment Max { get; }
    var max: TimelineMomentProtocol? { get }
    
    

    // ----------------------------------------------------------------------
    //ITimeLineMoment this[ int index ] { get; }
    subscript(index: Int) ->  TimelineMomentProtocol { get }

    // ----------------------------------------------------------------------
    //ITimeLineMoment this[ DateTime moment ] { get; }
    subscript(moment: Date) ->  TimelineMomentProtocol { get }
    
    
    

    // ----------------------------------------------------------------------
    //void Add( ITimePeriod period );
    func add(period: TimePeriodProtocol?) -> ()

    // ----------------------------------------------------------------------
    //void AddAll( IEnumerable<ITimePeriod> periods );
    func addAll(periods: [TimePeriodProtocol]) -> ()

    // ----------------------------------------------------------------------
    //void Remove( ITimePeriod period );
    func remove(period: TimePeriodProtocol?) -> ()

    // ----------------------------------------------------------------------
    //ITimeLineMoment Find( DateTime moment );
    func find(moment: Date) -> TimelineMoment?

    // ----------------------------------------------------------------------
    //bool Contains( DateTime moment );
    func contains(moment: Date) -> Bool

    // ----------------------------------------------------------------------
    //bool HasOverlaps();
    func hasOverlaps() -> Bool

    // ----------------------------------------------------------------------
    //bool HasGaps();
    func hasGaps() -> Bool

} // TimelineMomentCollectionProtocol
