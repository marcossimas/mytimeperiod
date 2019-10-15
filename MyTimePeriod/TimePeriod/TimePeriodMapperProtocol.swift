//
//  TimePeriodMapperProtocol.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 09/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//


import Foundation


// public interface ITimePeriodMapper {
protocol TimePeriodMapperProtocol {


    // ----------------------------------------------------------------------
    //DateTime MapStart( DateTime moment );
    func mapStart(moment: Date) -> Date

    // ----------------------------------------------------------------------
    //DateTime MapEnd( DateTime moment );
    func mapEnd(moment: Date) -> Date

    // ----------------------------------------------------------------------
    //DateTime UnmapStart( DateTime moment );
    func unmapStart(moment: Date) -> Date

    // ----------------------------------------------------------------------
    //DateTime UnmapEnd( DateTime moment );
    func unmapEnd(moment: Date) -> Date
    

} // TimePeriodMapperProtocol
