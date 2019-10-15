//
//  TimeLineMoment.swift
//  MyTimePeriod
//
//  Created by Marcos Simas on 15/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation



//public class TimeLineMoment : ITimeLineMoment {
class TimeLineMoment: TimelineMomentProtocol {
    
    
    
    
    // members
    //private readonly DateTime moment;
    var localMoment: Date
    
    
    //private int startCount;
    var localStartCount: Int
    
    
    //private int endCount;
    var localEndCount: Int
    
    
    

    // ----------------------------------------------------------------------
    /*public TimeLineMoment( DateTime moment )
    {
        this.moment = moment;
    } // TimeLineMoment*/
    
    
    
    init(moment: Date)
    {
        self.localMoment = moment
        
    } // TimeLineMoment
    
    
    
    
    
    

    // ----------------------------------------------------------------------
    /*public DateTime Moment
    {
        get { return moment; }
    } // Moment*/
    
    
    var moment: Date {
    
        get { return localMoment }
        
    } // Moment
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public int BalanceCount
    {
        get { return startCount - endCount; }
    } // BalanceCount*/
    
    
    var balanceCount: Int {
    
        get { return localStartCount - localEndCount; }
        
    } // BalanceCount
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public int StartCount
    {
        get { return startCount; }
    } // StartCount*/
    
    
    var startCount: Int {
    
        get { return localStartCount }
        
    } // StartCount
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public int EndCount
    {
        get { return endCount; }
    } // EndCount*/
    
    
    var endCount: Int {
    
        get { return localEndCount }
        
    } // EndCount
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    var isEmpty: Bool {
    
        get { return localStartCount == 0 && localEndCount == 0; }
        
    } // IsEmpty
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public void AddStart()
    {
        startCount++;
    } // AddStart*/
    
    
    func addStart() -> () {
    
        localStartCount += 1
        
    } // AddStart
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public void RemoveStart()
    {
        if ( startCount == 0 )
        {
            throw new InvalidOperationException();
        }
        startCount--;
    } // RemoveStart*/
        
        
    func removeStart() -> () {
    
        if (localStartCount == 0)
        {
            //throw new InvalidOperationException();
        }
        
        localStartCount -= 1
        
    } // RemoveStart
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public void AddEnd()
    {
        endCount++;
    } // AddEnd*/
    
    
    
    
    func addEnd() -> () {
    
        localEndCount += 1
        
    } // AddEnd
    
    
    
    
    
    


    // ----------------------------------------------------------------------
    /*public void RemoveEnd()
    {
        if ( endCount == 0 )
        {
            throw new InvalidOperationException();
        }
        endCount--;
    } // RemoveEnd*/
    
    
    
    func removeEnd() -> () {
    
        if (localEndCount == 0)
        {
            //throw new InvalidOperationException();
        }
        localEndCount -= 1
        
    } // RemoveEnd
    
    
    
    
    
    
/*

    // ----------------------------------------------------------------------
    /*public override string ToString()
    {
        return string.Format( "{0} [{1}/{2}]", Moment, StartCount, EndCount );
    } // ToString*/
    
    
    override func ToString() -> String {
    {
        return string.Format( "{0} [{1}/{2}]", moment, startCount, endCount)
    } // ToString
    
    
*/
    
    
    

    

} // class TimeLineMoment
