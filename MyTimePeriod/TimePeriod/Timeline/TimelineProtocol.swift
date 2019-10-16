//
//  TimelineProtocol.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 09/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation

// public interface ITimeLine {
protocol TimelineProtocol {
    
    
    // ----------------------------------------------------------------------
    // ITimePeriodContainer Periods { get; }
    var periods: TimePeriodContainerProtocol? { get }

    // ----------------------------------------------------------------------
    // ITimePeriod Limits { get; }
    var limits: TimePeriodProtocol? { get }

    // ----------------------------------------------------------------------
    //ITimePeriodMapper PeriodMapper { get; }
    var periodMapper: TimePeriodMapperProtocol? { get }

    // ----------------------------------------------------------------------
    // bool HasOverlaps();
    func hasOverlaps() -> Bool

    // ----------------------------------------------------------------------
    // bool HasGaps();
    func hasGaps() -> Bool

    // ----------------------------------------------------------------------
    // ITimePeriodCollection CombinePeriods();
    func combinePeriods() -> TimePeriodCollectionProtocol

    // ----------------------------------------------------------------------
    // ITimePeriodCollection IntersectPeriods( bool combinePeriods );
    func intersectPeriods(combinePeriods: Bool) -> TimePeriodCollectionProtocol

    // ----------------------------------------------------------------------
    // ITimePeriodCollection CalculateGaps();
    func calculateGaps() -> TimePeriodCollectionProtocol
    
    
} // TimelineProtocol
