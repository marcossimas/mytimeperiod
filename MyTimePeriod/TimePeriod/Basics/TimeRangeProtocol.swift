//
//  TimeRangeProtocol.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 09/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation


// public interface ITimeRange : ITimePeriod {
protocol TimeRangeProtocol: TimePeriodProtocol {

    // ----------------------------------------------------------------------
    //new DateTime Start { get; set; }
    override var start: Date { get set }

    // ----------------------------------------------------------------------
    //new DateTime End { get; set; }
    override var end: Date { get set }

    // ----------------------------------------------------------------------
    //new TimeSpan Duration { get; set; }
    override var duration: TimeInterval { get set }
    
    

    // ----------------------------------------------------------------------
    //void Move( TimeSpan offset );
    func move(offset: TimeInterval) -> ()

    // ----------------------------------------------------------------------
    //void ExpandStartTo( DateTime moment );
    func expandStartTo(moment: Date) -> ()

    // ----------------------------------------------------------------------
    //void ExpandEndTo( DateTime moment );
    func expandEndTo(moment: Date) -> ()

    // ----------------------------------------------------------------------
    //void ExpandTo( DateTime moment );
    func expandTo(moment: Date) -> ()

    // ----------------------------------------------------------------------
    //void ExpandTo( ITimePeriod period );
    func expandTo(period: TimePeriodProtocol?) -> ()

    // ----------------------------------------------------------------------
    //void ShrinkStartTo( DateTime moment );
    func shrinkStartTo(moment: Date) -> ()

    // ----------------------------------------------------------------------
    //void ShrinkEndTo( DateTime moment );
    func shrinkEndTo(moment: Date) -> ()

    // ----------------------------------------------------------------------
    //void ShrinkTo( ITimePeriod period );
    func shrinkTo(period: TimePeriodProtocol?) -> ()

    // ----------------------------------------------------------------------
    //ITimeRange Copy( TimeSpan offset );
    func copy(offset: TimeInterval) -> TimeRangeProtocol

    // ----------------------------------------------------------------------
    //ITimeRange GetIntersection( ITimePeriod period );
    func getIntersection(period: TimePeriodProtocol?) -> TimeRangeProtocol?
    

} //  TimeRangeProtocol
