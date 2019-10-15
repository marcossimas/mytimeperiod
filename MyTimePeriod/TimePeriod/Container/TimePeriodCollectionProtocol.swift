//
//  TimePeriodCollectionProtocol.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 09/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation


// public interface ITimePeriodCollection : ITimePeriodContainer
protocol TimePeriodCollectionProtocol: TimePeriodContainerProtocol {

    // ----------------------------------------------------------------------
    //new DateTime Start { get; set; }
    override var start: Date? { get set }

    // ----------------------------------------------------------------------
    //new DateTime End { get; set; }
    override var end: Date? { get set }

    // ----------------------------------------------------------------------
    //TimeSpan TotalDuration { get; }
    var totalDuration: TimeInterval { get }

    // ----------------------------------------------------------------------
    //TimeSpan GetTotalDuration( IDurationProvider provider );
    func getTotalDuration(provider: DurationProviderProtocol?) -> TimeInterval

    
/*
    
    // ----------------------------------------------------------------------
    //void SortBy( ITimePeriodComparer comparer );
    func sortBy(comparer: TimePeriodComparerProtocol) -> ()

    // ----------------------------------------------------------------------
    //void SortReverseBy( ITimePeriodComparer comparer );
    func sortReverseBy(comparer: TimePeriodComparerProtocol) -> ()

    // ----------------------------------------------------------------------
    //void SortByStart( ListSortDirection sortDirection = ListSortDirection.Ascending );
    //func sortByStart(sortDirection: ListSortDirection = ListSortDirection.Ascending) -> ()
    func sortByStart(sortDirection: ListSortDirection) -> ()

    // ----------------------------------------------------------------------
    //void SortByEnd( ListSortDirection sortDirection = ListSortDirection.Ascending );
    //func sortByEnd(sortDirection: ListSortDirection = ListSortDirection.Ascending) -> ()
    func sortByEnd(sortDirection: ListSortDirection) -> ()

    // ----------------------------------------------------------------------
    //void SortByDuration( ListSortDirection sortDirection = ListSortDirection.Ascending );
    //func sortByDuration(sortDirection: ListSortDirection = ListSortDirection.Ascending) -> ()
    func sortByDuration(sortDirection: ListSortDirection) -> ()
 
 
 */
    

    // ----------------------------------------------------------------------
    //bool HasInsidePeriods( ITimePeriod test );
    func hasInsidePeriods(test: TimePeriodProtocol?) -> Bool

    // ----------------------------------------------------------------------
    //bool HasOverlaps();
    func hasOverlaps() -> Bool

    // ----------------------------------------------------------------------
    //bool HasGaps();
    func hasGaps() -> Bool

    // ----------------------------------------------------------------------
    //bool HasOverlapPeriods( ITimePeriod test );
    func hasOverlapPeriods(test: TimePeriodProtocol?) -> Bool

    // ----------------------------------------------------------------------
    //bool HasIntersectionPeriods( DateTime test );
    func hasIntersectionPeriods(test: Date) -> Bool

    // ----------------------------------------------------------------------
    //bool HasIntersectionPeriods( ITimePeriod test );
    func hasIntersectionPeriods(test: TimePeriodProtocol?) -> Bool

    // ----------------------------------------------------------------------
    //ITimePeriodCollection InsidePeriods( ITimePeriod test );
    //func insidePeriods(test: TimePeriodProtocol) -> TimePeriodCollectionProtocol
    //func insidePeriods<T: Sequence>(test: TimePeriodProtocol) -> T
    //func insidePeriods<T: TimePeriodCollectionProtocol>(test: TimePeriodProtocol?) -> T
    func insidePeriods(test: TimePeriodProtocol?) -> TimePeriodCollection

    // ----------------------------------------------------------------------
    //ITimePeriodCollection OverlapPeriods( ITimePeriod test );
    func overlapPeriods(test: TimePeriodProtocol?) -> TimePeriodCollection

    // ----------------------------------------------------------------------
    //ITimePeriodCollection IntersectionPeriods( DateTime test );
    func intersectionPeriods(test: Date) -> TimePeriodCollection

    // ----------------------------------------------------------------------
    //ITimePeriodCollection IntersectionPeriods( ITimePeriod test );
    func intersectionPeriods(test: TimePeriodProtocol?) -> TimePeriodCollection

    // ----------------------------------------------------------------------
    //ITimePeriodCollection RelationPeriods( ITimePeriod test, PeriodRelation relation );
    func relationPeriods(test: TimePeriodProtocol?, relation: PeriodRelation) -> TimePeriodCollection
    
    
    
} // TimePeriodCollectionProtocol
