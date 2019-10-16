//
//  TimelineMomentProtocol.swift
//  MyTimePeriod
//
//  Created by Marcos Simas on 15/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation



//public interface ITimeLineMoment {
protocol  TimelineMomentProtocol {

    // ----------------------------------------------------------------------
    //DateTime Moment { get; }
    var moment: Date { get }

    // ----------------------------------------------------------------------
    //int BalanceCount { get; }
    var balanceCount: Int { get }

    // ----------------------------------------------------------------------
    //int StartCount { get; }
    var startCount: Int { get }

    // ----------------------------------------------------------------------
    //int EndCount { get; }
    var endCount: Int { get }

    // ----------------------------------------------------------------------
    //bool IsEmpty { get; }
    var isEmpty: Bool { get }
    
    
    

    // ----------------------------------------------------------------------
    //void AddStart();
    func addStart() -> ()

    // ----------------------------------------------------------------------
    //void RemoveStart();
    func removeStart() -> ()

    // ----------------------------------------------------------------------
    //void AddEnd();
    func addEnd() -> ()

    // ----------------------------------------------------------------------
    //void RemoveEnd();
    func removeEnd() -> ()

} //  TimelineMomentProtocol
