//
//  TimeBlockProtocol.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 09/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation


// public interface ITimeBlock : ITimePeriod {
protocol TimeBlockProtocol: TimePeriodProtocol {

    // ----------------------------------------------------------------------
    //new DateTime Start { get; set; }
    override var start: Date? { get set }

    // ----------------------------------------------------------------------
    //new DateTime End { get; set; }
    override var end: Date? { get set }

    // ----------------------------------------------------------------------
    //new TimeSpan Duration { get; set; }
    override var duration: TimeInterval? { get set }
    

    // ----------------------------------------------------------------------
    //void Setup( DateTime newStart, TimeSpan newDuration );
    func setup(newStart: Date, newDuration: TimeInterval) -> ()

    // ----------------------------------------------------------------------
    //void Move( TimeSpan delta );
    func move(offset: TimeInterval) -> ()

    // ----------------------------------------------------------------------
    //void DurationFromStart( TimeSpan newDuration );
    func durationFromStart(newDuration: TimeInterval) -> ()

    // ----------------------------------------------------------------------
    //void DurationFromEnd( TimeSpan newDuration );
    func durationFromEnd(newDuration: TimeInterval) -> ()

    // ----------------------------------------------------------------------
    //ITimeBlock Copy( TimeSpan delta );
    func copy(offset: TimeInterval) -> TimeBlockProtocol

    // ----------------------------------------------------------------------
    //ITimeBlock GetPreviousPeriod( TimeSpan offset );
    func getPreviousPeriod(offset: TimeInterval) -> TimeBlockProtocol

    // ----------------------------------------------------------------------
    //ITimeBlock GetNextPeriod( TimeSpan offset );
    func getNextPeriod(offset: TimeInterval) -> TimeBlockProtocol

    // ----------------------------------------------------------------------
    //ITimeBlock GetIntersection( ITimePeriod period );
    func getIntersection(period: TimePeriodProtocol?) -> TimeBlockProtocol?
    

} //  TimeBlockProtocol
