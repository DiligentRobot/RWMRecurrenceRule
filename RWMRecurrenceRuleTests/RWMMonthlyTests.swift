//
//  RWMMonthlyTests.swift
//  RWMRecurrenceRuleTests
//
//  Created by Richard W Maddy on 5/17/18.
//  Copyright © 2018 Maddysoft. All rights reserved.
//

import XCTest

class RWMMonthlyTests: RWMRecurrenceRuleBase {
    // ----------- MONTHLY ------------

    // Monthly can use BYMONTH, BYMONTHDAY, BYDAY, BYSETPOS

    func testMonthly01() {
        // Start 20180517T090000
        // Monthly with no BYxxx clauses. Should give 3 months with same day as dtStart date
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;COUNT=3", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-06-17T09:00:00", "2018-07-17T09:00:00"]
        )
    }

    func testMonthly02() {
        // Start 20180517T090000
        // Once every three months
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;INTERVAL=3;COUNT=3", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-08-17T09:00:00", "2018-11-17T09:00:00"]
        )
    }

    func testMonthly03() {
        // Start 20180517T090000
        // Start day each May and June
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTH=5,6;COUNT=3", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-06-17T09:00:00", "2019-05-17T09:00:00"]
        )
    }

    func testMonthly03a() {
        // Start 20180617T090000
        // Start day each May and June
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 6, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;INTERVAL=2;BYMONTH=1,3,5,7,9,11;COUNT=5", dtStart: dtStart, results:
            ["2018-06-17T09:00:00"/*, "2018-07-17T09:00:00", "2018-09-17T09:00:00", "2018-11-17T09:00:00",
             "2019-01-17T09:00:00"*/]
        )
    }

    func testMonthly04() {
        // Start 20180517T090000
        // 2nd, 4th, and 6th of each month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTHDAY=2,4,6;COUNT=10", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-06-02T09:00:00", "2018-06-04T09:00:00", "2018-06-06T09:00:00",
             "2018-07-02T09:00:00", "2018-07-04T09:00:00", "2018-07-06T09:00:00", "2018-08-02T09:00:00",
             "2018-08-04T09:00:00", "2018-08-06T09:00:00"]
        )
    }

    func testMonthly05() {
        // Start 20180517T090000
        // 2nd and last day of each month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTHDAY=2,-1;COUNT=10", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-05-31T09:00:00", "2018-06-02T09:00:00", "2018-06-30T09:00:00",
             "2018-07-02T09:00:00", "2018-07-31T09:00:00", "2018-08-02T09:00:00", "2018-08-31T09:00:00",
             "2018-09-02T09:00:00", "2018-09-30T09:00:00"]
        )
    }

    func testMonthly06() {
        // Start 20180517T090000
        // 2nd, 4th, and 6th of every other month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTHDAY=2,4,6;INTERVAL=2;COUNT=10", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-07-02T09:00:00", "2018-07-04T09:00:00", "2018-07-06T09:00:00",
             "2018-09-02T09:00:00", "2018-09-04T09:00:00", "2018-09-06T09:00:00", "2018-11-02T09:00:00",
             "2018-11-04T09:00:00", "2018-11-06T09:00:00"]
        )
    }

    func testMonthly07() {
        // Start 20180517T090000
        // 2nd and last day of each 3rd month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTHDAY=2,-1;INTERVAL=3;COUNT=10", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-05-31T09:00:00", "2018-08-02T09:00:00", "2018-08-31T09:00:00",
             "2018-11-02T09:00:00", "2018-11-30T09:00:00", "2019-02-02T09:00:00", "2019-02-28T09:00:00",
             "2019-05-02T09:00:00", "2019-05-31T09:00:00"]
        )
    }

    func testMonthly08() {
        // Start 20180517T090000
        // Every Tuesday and Thursday of every month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=TU,TH;COUNT=10", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-05-22T09:00:00", "2018-05-24T09:00:00", "2018-05-29T09:00:00",
             "2018-05-31T09:00:00", "2018-06-05T09:00:00", "2018-06-07T09:00:00", "2018-06-12T09:00:00",
             "2018-06-14T09:00:00", "2018-06-19T09:00:00"]
        )
    }

    func testMonthly09() {
        // Start 20180517T090000
        // 1st Monday and last Friday of every month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=1MO,-1FR;COUNT=10", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-05-25T09:00:00", "2018-06-04T09:00:00", "2018-06-29T09:00:00",
             "2018-07-02T09:00:00", "2018-07-27T09:00:00", "2018-08-06T09:00:00", "2018-08-31T09:00:00",
             "2018-09-03T09:00:00", "2018-09-28T09:00:00"]
        )
    }

    func testMonthly10() {
        // Start 20180517T090000
        // Every Tuesday and Thursday of every third month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=TU,TH;INTERVAL=3;COUNT=10", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-05-22T09:00:00", "2018-05-24T09:00:00", "2018-05-29T09:00:00",
             "2018-05-31T09:00:00", "2018-08-02T09:00:00", "2018-08-07T09:00:00", "2018-08-09T09:00:00",
             "2018-08-14T09:00:00", "2018-08-16T09:00:00"]
        )
    }

    func testMonthly11() {
        // Start 20180517T090000
        // 1st Monday and last Friday of every other month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=1MO,-1FR;INTERVAL=2;COUNT=10", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-05-25T09:00:00", "2018-07-02T09:00:00", "2018-07-27T09:00:00",
             "2018-09-03T09:00:00", "2018-09-28T09:00:00", "2018-11-05T09:00:00", "2018-11-30T09:00:00",
             "2019-01-07T09:00:00", "2019-01-25T09:00:00"]
        )
    }

    func testMonthly12() {
        // Start 20180517T090000
        // 2nd, 4th, and 6th of March and May
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTHDAY=2,4,6;BYMONTH=3,5;COUNT=10", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2019-03-02T09:00:00", "2019-03-04T09:00:00", "2019-03-06T09:00:00",
             "2019-05-02T09:00:00", "2019-05-04T09:00:00", "2019-05-06T09:00:00", "2020-03-02T09:00:00",
             "2020-03-04T09:00:00", "2020-03-06T09:00:00"]
        )
    }

    func testMonthly13() {
        // Start 20180517T090000
        // 2nd and last day of June
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTH=6;BYMONTHDAY=2,-1;COUNT=10", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-06-02T09:00:00", "2018-06-30T09:00:00", "2019-06-02T09:00:00",
             "2019-06-30T09:00:00", "2020-06-02T09:00:00", "2020-06-30T09:00:00", "2021-06-02T09:00:00",
             "2021-06-30T09:00:00", "2022-06-02T09:00:00"]
        )
    }

    func testMonthly14() {
        // Start 20180517T090000
        // Every Tuesday and Thursday of every August
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=TU,TH;BYMONTH=8;COUNT=15", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-08-02T09:00:00", "2018-08-07T09:00:00", "2018-08-09T09:00:00",
             "2018-08-14T09:00:00", "2018-08-16T09:00:00", "2018-08-21T09:00:00", "2018-08-23T09:00:00",
             "2018-08-28T09:00:00", "2018-08-30T09:00:00", "2019-08-01T09:00:00", "2019-08-06T09:00:00",
             "2019-08-08T09:00:00", "2019-08-13T09:00:00", "2019-08-15T09:00:00"]
        )
    }

    func testMonthly14a() {
        // Start 20180517T090000
        // Every Tuesday and the 2nd Thursday of every August
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=TU,2TH;BYMONTH=8;COUNT=15", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-08-07T09:00:00", "2018-08-09T09:00:00", "2018-08-14T09:00:00",
             "2018-08-21T09:00:00", "2018-08-28T09:00:00", "2019-08-06T09:00:00", "2019-08-08T09:00:00",
             "2019-08-13T09:00:00", "2019-08-20T09:00:00", "2019-08-27T09:00:00", "2020-08-04T09:00:00",
             "2020-08-11T09:00:00", "2020-08-13T09:00:00", "2020-08-18T09:00:00"]
        )
    }

    func testMonthly15() {
        // Start 20180517T090000
        // 1st Monday and last Friday of every March and September
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=1MO,-1FR;BYMONTH=3,9;COUNT=10", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-09-03T09:00:00", "2018-09-28T09:00:00", "2019-03-04T09:00:00",
             "2019-03-29T09:00:00", "2019-09-02T09:00:00", "2019-09-27T09:00:00", "2020-03-02T09:00:00",
             "2020-03-27T09:00:00", "2020-09-07T09:00:00"]
        )
    }

    func testMonthly16() {
        // Start 20180517T090000
        // The 10th, 11th, 12th, 13th, and 14th of every month that falls on a Tuesday or Thursday
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=TU,TH;BYMONTHDAY=10,11,12,13,14;COUNT=10", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-06-12T09:00:00", "2018-06-14T09:00:00", "2018-07-10T09:00:00",
             "2018-07-12T09:00:00", "2018-08-14T09:00:00", "2018-09-11T09:00:00", "2018-09-13T09:00:00",
             "2018-10-11T09:00:00", "2018-11-13T09:00:00"]
        )
    }

    func testMonthly17() {
        // Start 20180517T090000
        // The 1st, 2nd, 3rd, last, 2nd-to-last, and 3rd-to-last of every month that falls on the 1st Monday or the last Friday
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTHDAY=1,2,3,-1,-2,-3;BYDAY=1MO,-1FR;COUNT=10", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2018-06-29T09:00:00", "2018-07-02T09:00:00", "2018-08-31T09:00:00",
             "2018-09-03T09:00:00", "2018-09-28T09:00:00", "2018-10-01T09:00:00", "2018-11-30T09:00:00",
             "2018-12-03T09:00:00", "2019-03-29T09:00:00"]
        )
    }

    func testMonthly18() {
        // Start 20180517T090000
        // The 1st, 2nd, and 3rd of January, February, and March that fall on a Sunday, Monday, or Tuesday
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTH=1,2,3;BYMONTHDAY=1,2,3;BYDAY=SU,MO,TU;COUNT=10", dtStart: dtStart, results:
            ["2018-05-17T09:00:00", "2019-01-01T09:00:00", "2019-02-03T09:00:00", "2019-03-03T09:00:00",
             "2020-02-02T09:00:00", "2020-02-03T09:00:00", "2020-03-01T09:00:00", "2020-03-02T09:00:00",
             "2020-03-03T09:00:00", "2021-01-03T09:00:00"]
        )
    }

    func testMonthly19() {
        // Start 20180517T090000
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let enumerationStartDate = calendar.date(from: DateComponents(year: 2018, month: 5, day: 16, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;COUNT=3", dtStart: dtStart, enumerationStartDate: enumerationStartDate, results:
            ["2018-05-17T09:00:00", "2018-06-17T09:00:00", "2018-07-17T09:00:00"]
        )
    }

    func testMonthly20() {
        // Start 20180517T090000
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let enumerationStartDate = calendar.date(from: DateComponents(year: 2018, month: 5, day: 18, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;COUNT=3", dtStart: dtStart, enumerationStartDate: enumerationStartDate, results:
            ["2018-06-17T09:00:00", "2018-07-17T09:00:00", "2018-08-17T09:00:00"]
        )
    }

    func testMonthly21() {
        // Start 20180517T090000
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let enumerationStartDate = calendar.date(from: DateComponents(year: 2018, month: 4, day: 16, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;COUNT=3", dtStart: dtStart, enumerationStartDate: enumerationStartDate, results:
            ["2018-05-17T09:00:00", "2018-06-17T09:00:00", "2018-07-17T09:00:00"]
        )
    }

    // MARK: - Exdates

    func testMonthly01e() {
        // Start 20180517T090000
        // Monthly with no BYxxx clauses. Should give 3 months with same day as dtStart date
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 7, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;COUNT=3", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-06-17T09:00:00", "2018-08-17T09:00:00", "2018-09-17T09:00:00"]
        )
    }

    func testMonthly02e() {
        // Start 20180517T090000
        // Once every three months
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 11, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;INTERVAL=3;COUNT=3", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-08-17T09:00:00", "2019-02-17T09:00:00", "2019-05-17T09:00:00"]
        )
    }

    func testMonthly03e() {
        // Start 20180517T090000
        // Start day each May and June
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 6, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTH=5,6;COUNT=3", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-06-17T09:00:00", "2019-05-17T09:00:00", "2020-05-17T09:00:00"]
        )
    }

    func testMonthly04e() {
        // Start 20180517T090000
        // 2nd, 4th, and 6th of each month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 7, day: 4, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTHDAY=2,4,6;COUNT=8", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-06-02T09:00:00", "2018-06-04T09:00:00", "2018-06-06T09:00:00",
             "2018-07-02T09:00:00", "2018-07-06T09:00:00", "2018-08-02T09:00:00",
             "2018-08-04T09:00:00", "2018-08-06T09:00:00"]
        )
    }

    func testMonthly05e() {
        // Start 20180517T090000
        // 2nd and last day of each month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 7, day: 31, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTHDAY=2,-1;COUNT=8", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-05-31T09:00:00", "2018-06-02T09:00:00", "2018-06-30T09:00:00",
             "2018-07-02T09:00:00", "2018-08-02T09:00:00", "2018-08-31T09:00:00",
             "2018-09-02T09:00:00", "2018-09-30T09:00:00"]
        )
    }

    func testMonthly06e() {
        // Start 20180517T090000
        // 2nd, 4th, and 6th of every other month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 7, day: 4, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTHDAY=2,4,6;INTERVAL=2;COUNT=8", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-07-02T09:00:00", "2018-07-06T09:00:00",
             "2018-09-02T09:00:00", "2018-09-04T09:00:00", "2018-09-06T09:00:00", "2018-11-02T09:00:00",
             "2018-11-04T09:00:00", "2018-11-06T09:00:00"]
        )
    }

    func testMonthly07e() {
        // Start 20180517T090000
        // 2nd and last day of each 3rd month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 8, day: 31, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTHDAY=2,-1;INTERVAL=3;COUNT=8", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-05-31T09:00:00", "2018-08-02T09:00:00",
             "2018-11-02T09:00:00", "2018-11-30T09:00:00", "2019-02-02T09:00:00", "2019-02-28T09:00:00",
             "2019-05-02T09:00:00", "2019-05-31T09:00:00"]
        )
    }

    func testMonthly08e() {
        // Start 20180517T090000
        // Every Tuesday and Thursday of every month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 6, day: 5, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=TU,TH;COUNT=8", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-05-22T09:00:00", "2018-05-24T09:00:00", "2018-05-29T09:00:00",
             "2018-05-31T09:00:00", "2018-06-07T09:00:00", "2018-06-12T09:00:00",
             "2018-06-14T09:00:00", "2018-06-19T09:00:00"]
        )
    }

    func testMonthly09e() {
        // Start 20180517T090000
        // 1st Monday and last Friday of every month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 6, day: 4, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=1MO,-1FR;COUNT=8", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-05-25T09:00:00", "2018-06-29T09:00:00",
             "2018-07-02T09:00:00", "2018-07-27T09:00:00", "2018-08-06T09:00:00", "2018-08-31T09:00:00",
             "2018-09-03T09:00:00", "2018-09-28T09:00:00"]
        )
    }

    func testMonthly10e() {
        // Start 20180517T090000
        // Every Tuesday and Thursday of every third month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 29, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=TU,TH;INTERVAL=3;COUNT=8", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-05-22T09:00:00", "2018-05-24T09:00:00",
             "2018-05-31T09:00:00", "2018-08-02T09:00:00", "2018-08-07T09:00:00", "2018-08-09T09:00:00",
             "2018-08-14T09:00:00", "2018-08-16T09:00:00"]
        )
    }

    func testMonthly11e() {
        // Start 20180517T090000
        // 1st Monday and last Friday of every other month
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 9, day: 28, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=1MO,-1FR;INTERVAL=2;COUNT=8", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-05-25T09:00:00", "2018-07-02T09:00:00", "2018-07-27T09:00:00",
             "2018-09-03T09:00:00", "2018-11-05T09:00:00", "2018-11-30T09:00:00",
             "2019-01-07T09:00:00", "2019-01-25T09:00:00"]
        )
    }

    func testMonthly12e() {
        // Start 20180517T090000
        // 2nd, 4th, and 6th of March and May
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 3, day: 4, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTHDAY=2,4,6;BYMONTH=3,5;COUNT=8", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2019-03-02T09:00:00", "2019-03-06T09:00:00",
             "2019-05-02T09:00:00", "2019-05-04T09:00:00", "2019-05-06T09:00:00", "2020-03-02T09:00:00",
             "2020-03-04T09:00:00", "2020-03-06T09:00:00"]
        )
    }

    func testMonthly13e() {
        // Start 20180517T090000
        // 2nd and last day of June
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 6, day: 30, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTH=6;BYMONTHDAY=2,-1;COUNT=8", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-06-02T09:00:00", "2018-06-30T09:00:00", "2019-06-02T09:00:00",
             "2020-06-02T09:00:00", "2020-06-30T09:00:00", "2021-06-02T09:00:00",
             "2021-06-30T09:00:00", "2022-06-02T09:00:00"]
        )
    }

    func testMonthly14e() {
        // Start 20180517T090000
        // Every Tuesday and Thursday of every August
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 8, day: 9, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=TU,TH;BYMONTH=8;COUNT=13", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-08-02T09:00:00", "2018-08-07T09:00:00",
             "2018-08-14T09:00:00", "2018-08-16T09:00:00", "2018-08-21T09:00:00", "2018-08-23T09:00:00",
             "2018-08-28T09:00:00", "2018-08-30T09:00:00", "2019-08-01T09:00:00", "2019-08-06T09:00:00",
             "2019-08-08T09:00:00", "2019-08-13T09:00:00", "2019-08-15T09:00:00"]
        )
    }

    func testMonthly14ae() {
        // Start 20180517T090000
        // Every Tuesday and the 2nd Thursday of every August
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 8, day: 9, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=TU,2TH;BYMONTH=8;COUNT=13", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-08-07T09:00:00", "2018-08-14T09:00:00",
             "2018-08-21T09:00:00", "2018-08-28T09:00:00", "2019-08-06T09:00:00", "2019-08-08T09:00:00",
             "2019-08-13T09:00:00", "2019-08-20T09:00:00", "2019-08-27T09:00:00", "2020-08-04T09:00:00",
             "2020-08-11T09:00:00", "2020-08-13T09:00:00", "2020-08-18T09:00:00"]
        )
    }

    func testMonthly15e() {
        // Start 20180517T090000
        // 1st Monday and last Friday of every March and September
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 9, day: 28, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=1MO,-1FR;BYMONTH=3,9;COUNT=8", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-09-03T09:00:00", "2019-03-04T09:00:00",
             "2019-03-29T09:00:00", "2019-09-02T09:00:00", "2019-09-27T09:00:00", "2020-03-02T09:00:00",
             "2020-03-27T09:00:00", "2020-09-07T09:00:00"]
        )
    }

    func testMonthly16e() {
        // Start 20180517T090000
        // The 10th, 11th, 12th, 13th, and 14th of every month that falls on a Tuesday or Thursday
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 9, day: 11, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYDAY=TU,TH;BYMONTHDAY=10,11,12,13,14;COUNT=8", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-06-12T09:00:00", "2018-06-14T09:00:00", "2018-07-10T09:00:00",
             "2018-07-12T09:00:00", "2018-08-14T09:00:00", "2018-09-13T09:00:00",
             "2018-10-11T09:00:00", "2018-11-13T09:00:00"]
        )
    }

    func testMonthly17e() {
        // Start 20180517T090000
        // The 1st, 2nd, 3rd, last, 2nd-to-last, and 3rd-to-last of every month that falls on the 1st Monday or the last Friday
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 8, day: 31, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTHDAY=1,2,3,-1,-2,-3;BYDAY=1MO,-1FR;COUNT=8", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2018-06-29T09:00:00", "2018-07-02T09:00:00",
             "2018-09-03T09:00:00", "2018-09-28T09:00:00", "2018-10-01T09:00:00", "2018-11-30T09:00:00",
             "2018-12-03T09:00:00", "2019-03-29T09:00:00"]
        )
    }

    func testMonthly18e() {
        // Start 20180517T090000
        // The 1st, 2nd, and 3rd of January, February, and March that fall on a Sunday, Monday, or Tuesday
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 3, day: 3, hour: 9))!,
            calendar.date(from: DateComponents(year: 2019, month: 5, day: 25, hour: 9))! // not part of results
        ]
        run(rule: "RRULE:FREQ=MONTHLY;BYMONTH=1,2,3;BYMONTHDAY=1,2,3;BYDAY=SU,MO,TU;COUNT=8", dtStart: dtStart, exclusionDates: exclusionDates, results:
            ["2019-01-01T09:00:00", "2019-02-03T09:00:00",
             "2020-02-02T09:00:00", "2020-02-03T09:00:00", "2020-03-01T09:00:00", "2020-03-02T09:00:00",
             "2020-03-03T09:00:00", "2021-01-03T09:00:00"]
        )
    }

    func testMonthly19e() {
        // Start 20180517T090000
        // Monthly with exclusion dates
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDate = calendar.date(from: DateComponents(year: 2018, month: 6, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;COUNT=3", dtStart: dtStart, exclusionDates: [exclusionDate], results:
            ["2018-05-17T09:00:00", "2018-07-17T09:00:00", "2018-08-17T09:00:00"]
        )
    }

    func testMonthly20e() {
        // Start 20180517T090000
        // Monthly with exclusion date == dtStart date with COUNT=10
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDate = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY;COUNT=10", dtStart: dtStart, exclusionDates: [exclusionDate], results:
            ["2018-06-17T09:00:00", "2018-07-17T09:00:00", "2018-08-17T09:00:00", "2018-09-17T09:00:00", "2018-10-17T09:00:00", "2018-11-17T09:00:00", "2018-12-17T09:00:00", "2019-01-17T09:00:00", "2019-02-17T09:00:00", "2019-03-17T09:00:00"]
        )
    }

    func testMonthly21e() {
        // Start 20180517T090000
        // Monthly with exclusion date == dtStart date without COUNT
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDate = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY", dtStart: dtStart, max: 5, exclusionDates: [exclusionDate], results:
            ["2018-06-17T09:00:00", "2018-07-17T09:00:00", "2018-08-17T09:00:00", "2018-09-17T09:00:00", "2018-10-17T09:00:00"]
        )
    }

    func testMonthly22e() {
        // Start 20180517T090000
        // Monthly with exclusion date out of occrrences sequence
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 6, day: 17, hour: 9))!
        let exclusionDate = calendar.date(from: DateComponents(year: 2018, month: 7, day: 1, hour: 9))!
        run(rule: "RRULE:FREQ=MONTHLY", dtStart: dtStart, max: 5, exclusionDates: [exclusionDate], results:
            ["2018-06-17T09:00:00", "2018-07-17T09:00:00", "2018-08-17T09:00:00", "2018-09-17T09:00:00", "2018-10-17T09:00:00"]
        )
    }

    func testMonthly23e() {
        // Start 20180517T090000
        // Monthly with multiple exclusion dates
        let dtStart = calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!
        let exclusionDates = [
            calendar.date(from: DateComponents(year: 2018, month: 5, day: 17, hour: 9))!,
            calendar.date(from: DateComponents(year: 2018, month: 7, day: 17, hour: 9))!
        ]
        run(rule: "RRULE:FREQ=MONTHLY", dtStart: dtStart, max: 5, exclusionDates: exclusionDates, results:
            ["2018-06-17T09:00:00", "2018-08-17T09:00:00", "2018-09-17T09:00:00", "2018-10-17T09:00:00", "2018-11-17T09:00:00"]
        )
    }

    // TODO - test BYSETPOS
}
