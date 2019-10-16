//
//  TimeSpec.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 09/10/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import Foundation


//public static class TimeSpec

class TimeSpec {
    

/*
     
    // ----------------------------------------------------------------------
    // relations
    static let MonthsPerYear = 12
    static let HalfyearsPerYear: Int = 2
    static let QuartersPerYear: Int = 4
    static let QuartersPerHalfyear: Int = QuartersPerYear / HalfyearsPerYear
    static let MaxWeeksPerYear: Int = 53
    static let MonthsPerHalfyear: Int = MonthsPerYear / HalfyearsPerYear
    static let MonthsPerQuarter: Int = MonthsPerYear / QuartersPerYear
    static let MaxDaysPerMonth: Int = 31
    static let DaysPerWeek: Int = 7
    static let HoursPerDay: Int = 24
    static let MinutesPerHour: Int = 60
    static let SecondsPerMinute: Int = 60
    static let MillisecondsPerSecond: Int = 1000

    static let CalendarYearStartMonth: YearMonth = YearMonth.January
    static let FirstWorkingDayOfWeek: DayOfWeek = DayOfWeek.Monday

    // ----------------------------------------------------------------------
    // fiscal calendar
    static let FiscalYearBaseMonth: YearMonth = YearMonth.July
    static let FiscalWeeksPerShortMonth: Int = 4
    static let FiscalWeeksPerLongMonth: Int = 5
    static let FiscalWeeksPerLeapMonth: Int = 6
    static let FiscalWeeksPerQuarter: Int = ( 2 * FiscalWeeksPerShortMonth ) + FiscalWeeksPerLongMonth
    static let FiscalWeeksPerLeapQuarter: Int = FiscalWeeksPerQuarter + 1
    static let FiscalWeeksPerHalfyear: Int = FiscalWeeksPerQuarter * QuartersPerHalfyear
    static let FiscalWeeksPerLeapHalfyear: Int = FiscalWeeksPerHalfyear + 1
    static let FiscalWeeksPerYear: Int = FiscalWeeksPerQuarter * QuartersPerYear
    static let FiscalWeeksPerLeapYear: Int = FiscalWeeksPerYear + 1

    static let FiscalDaysPerShortMonth: Int = FiscalWeeksPerShortMonth * DaysPerWeek
    static let FiscalDaysPerLongMonth: Int = FiscalWeeksPerLongMonth * DaysPerWeek
    static let FiscalDaysPerLeapMonth: Int = FiscalWeeksPerLeapMonth * DaysPerWeek
    static let FiscalDaysPerQuarter: Int = ( 2 * FiscalDaysPerShortMonth ) + FiscalDaysPerLongMonth
    static let FiscalDaysPerLeapQuarter: Int = FiscalDaysPerQuarter + DaysPerWeek
    static let FiscalDaysPerHalfyear: Int = FiscalDaysPerQuarter * QuartersPerHalfyear
    static let FiscalDaysPerLeapHalfyear: Int = FiscalDaysPerHalfyear + DaysPerWeek
    static let FiscalDaysPerYear: Int = FiscalDaysPerQuarter * QuartersPerYear
    static let FiscalDaysPerLeapYear: Int = FiscalDaysPerYear + DaysPerWeek

    // ----------------------------------------------------------------------
    // halfyear
    static let FirstHalfyearMonths: [YearMonth] = [YearMonth.January, YearMonth.February, YearMonth.March, YearMonth.April, YearMonth.May, YearMonth.June]
    static let SecondHalfyearMonths: [YearMonth] = [YearMonth.July, YearMonth.August, YearMonth.September, YearMonth.October, YearMonth.November, YearMonth.December]

    // ----------------------------------------------------------------------
    // quarter
    static let FirstQuarterMonthIndex: Int = 1
    static let SecondQuarterMonthIndex: Int = FirstQuarterMonthIndex + MonthsPerQuarter
    static let ThirdQuarterMonthIndex: Int = SecondQuarterMonthIndex + MonthsPerQuarter
    static let FourthQuarterMonthIndex: Int = ThirdQuarterMonthIndex + MonthsPerQuarter

    static let FirstQuarterMonths: [YearMonth] = [YearMonth.January, YearMonth.February, YearMonth.March]
    static let SecondQuarterMonths: [YearMonth] = [YearMonth.April, YearMonth.May, YearMonth.June]
    static let ThirdQuarterMonths: [YearMonth] = [YearMonth.July, YearMonth.August, YearMonth.September]
    static let FourthQuarterMonths: [YearMonth] = [YearMonth.October, YearMonth.November, YearMonth.December]

    // ----------------------------------------------------------------------
    // duration
    //public static readonly TimeSpan NoDuration = TimeSpan.Zero;
    static let NoDuration: DateInterval = TimeSpan.Zero
    
    //public static readonly TimeSpan MinPositiveDuration = new TimeSpan( 1 ); // positive tick;
    static let MinPositiveDuration: DateInterval = DateInterval(1) // positive tick;
    
    //public static readonly TimeSpan MinNegativeDuration = new TimeSpan( -1 ); // negative tick;
    static let MinNegativeDuration: DateInterval = DateInterval(-1) // negative tick;
    
    
*/

    // ----------------------------------------------------------------------
    // period
    //public static readonly DateTime MinPeriodDate = DateTime.MinValue;
    static let minPeriodDate: Date = .distantPast
    
    //public static readonly DateTime MaxPeriodDate = DateTime.MaxValue;
    static let maxPeriodDate: Date = .distantFuture
    
    

    
    //public static readonly TimeSpan MinPeriodDuration = TimeSpan.Zero;
    static let minPeriodDuration: TimeInterval = 0
    
    //public static readonly TimeSpan MaxPeriodDuration = MaxPeriodDate - MinPeriodDate;
    static let maxPeriodDuration: TimeInterval = maxPeriodDate.timeIntervalSince(minPeriodDate)
 
 

    
    

} // class TimeSpec
