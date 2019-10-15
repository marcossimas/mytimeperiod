//
//  TimePeriodContainerProtocol.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 09/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation

// public interface ITimePeriodContainer : IList<ITimePeriod>, ITimePeriod
// protocol TimePeriodContainerProtocol: Sequence, TimePeriodProtocol {
protocol TimePeriodContainerProtocol: Sequence, Equatable, TimePeriodProtocol {
    
    
    // ----------------------------------------------------------------------
    //new bool IsReadOnly { get; }
    var isReadOnly: Bool { get }

    // ----------------------------------------------------------------------
    //bool ContainsPeriod( ITimePeriod test );
    func containsPeriod(test:  TimePeriodProtocol?) -> Bool

    // ----------------------------------------------------------------------
    //void AddAll( IEnumerable<ITimePeriod> periods );
    func addAll(periods: [TimePeriodProtocol]) -> ()

    // ----------------------------------------------------------------------
    //void Move( TimeSpan delta );
    func move(delta: TimeInterval) -> ()
    
    
    
    
    
} // TimePeriodContainerProtocol
