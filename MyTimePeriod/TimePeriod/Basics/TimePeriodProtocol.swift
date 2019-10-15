//
//  TimePeriodProtocol.swift
//  DateTools
//
//  Created by Grayson Webster on 8/17/16.
//  Copyright © 2016 Grayson Webster. All rights reserved.
//

import Foundation
    

// public interface ITimePeriod {
protocol TimePeriodProtocol {
    


    // ----------------------------------------------------------------------
    //bool HasStart { get; }
    var hasStart: Bool { get }

    // ----------------------------------------------------------------------
    //DateTime Start { get; }
    var start: Date { get }

    // ----------------------------------------------------------------------
    //bool HasEnd { get; }
    var hasEnd: Bool { get }

    // ----------------------------------------------------------------------
    //DateTime End { get; }
    var end: Date { get }

    // ----------------------------------------------------------------------
    //TimeSpan Duration { get; }
    var duration: TimeInterval { get }

    /*// ----------------------------------------------------------------------
    //string DurationDescription { get; }
    var durationDescription: String { get }*/

    // ----------------------------------------------------------------------
    //bool IsMoment { get; }
    var isMoment: Bool { get }

    // ----------------------------------------------------------------------
    //bool IsAnytime { get; }
    var isAnytime: Bool { get }

    // ----------------------------------------------------------------------
    //bool IsReadOnly { get; }
    var isReadOnly: Bool { get }
    
    
    

    // ----------------------------------------------------------------------
    //TimeSpan GetDuration( IDurationProvider provider );
    func getDuration(provider: DurationProviderProtocol?) -> TimeInterval

    // ----------------------------------------------------------------------
    //void Setup( DateTime newStart, DateTime newEnd );
    func setup(newStart: Date, newEnd: Date) -> ()

    // ----------------------------------------------------------------------
    //bool IsSamePeriod( ITimePeriod test );
    func isSamePeriod(test: TimePeriodProtocol?) -> Bool

    // ----------------------------------------------------------------------
    //bool HasInside( DateTime test );
    func hasInside(test: Date) -> Bool

    // ----------------------------------------------------------------------
    //bool HasInside( ITimePeriod test );
    func hasInside(test: TimePeriodProtocol?) -> Bool

    // ----------------------------------------------------------------------
    //bool IntersectsWith( ITimePeriod test );
    func intersectsWith(test: TimePeriodProtocol?) -> Bool

    // ----------------------------------------------------------------------
    //bool OverlapsWith( ITimePeriod test );
    func overlapsWith(test: TimePeriodProtocol?) -> Bool

    // ----------------------------------------------------------------------
    //PeriodRelation GetRelation( ITimePeriod test );
    func getRelation(test: TimePeriodProtocol?) -> PeriodRelation

    // ----------------------------------------------------------------------
    //int CompareTo( ITimePeriod other, ITimePeriodComparer comparer );
    func compareTo(other: TimePeriodProtocol?, comparer: TimePeriodComparerProtocol?) -> Int

    /*// ----------------------------------------------------------------------
    //string GetDescription( ITimeFormatter formatter );
    func getDescription(formatter: TimeFormatterProtocol) -> String*/
    

} // TimePeriodProtocol
