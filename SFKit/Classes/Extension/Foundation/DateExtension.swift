//
//  DateExtension.swift
//  LuckyMascot
//
//  Created by 黄山锋 on 2020/3/6.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

extension Date {
    
    /// 年
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    /// 月
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    /// 日
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    /// 时
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    /// 分
    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
    
    /// 秒
    var second: Int {
        return Calendar.current.component(.second, from: self)
    }
    
    /// 毫秒
    var nanosecond: Int {
        return Calendar.current.component(.nanosecond, from: self)
    }
    
    /// 周几（1~7,1表示周日）
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    /// 这个月的第几个周几
    /// 例如：某一天是这个月的第2个周日，可能是这个月的第二周，可能是第三周
    var weekdayOrdinal: Int {
        return Calendar.current.component(.weekdayOrdinal, from: self)
    }
    
    /// 这个月的第几周
    /// 是指明确的这个月的第几周的周几
    var weekOfMonth: Int {
        return Calendar.current.component(.weekOfMonth, from: self)
    }
    
    /// 这一年的第几周
    var weekOfYear: Int {
        return Calendar.current.component(.weekOfYear, from: self)
    }
    
    ///
    var yearForWeekOfYear: Int {
        return Calendar.current.component(.yearForWeekOfYear, from: self)
    }
    
    /// 第几刻钟（1刻钟=15分钟）
    var quarter: Int {
        return Calendar.current.component(.quarter, from: self)
    }
    
    /// 判断是否为天
    func isToday() -> Bool {
        if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) {
            return false;
        }
        return Date().day == self.day;
    }
    
//    /// 判断是否为昨天
//    func isYestarday() -> Bool {
//
//    }
//
//    /// 判断是否为明天
//    func isTomorrow() -> Bool {
//
//    }
    
    func dateByAddingYears(_ years: Int) -> Date {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = years
        return calendar.date(byAdding: components, to: self, wrappingComponents: true) ?? self
    }
    
    func dateByAddingMonths(_ months: Int) -> Date {
        let calendar = Calendar.current
        var components = DateComponents()
        components.month = months
        return calendar.date(byAdding: components, to: self, wrappingComponents: true) ?? self
    }
    
    func dateByAddingWeeks(_ weeks: Int) -> Date {
        let calendar = Calendar.current
        var components = DateComponents()
        components.weekOfYear = weeks
        return calendar.date(byAdding: components, to: self, wrappingComponents: true) ?? self
    }
    
    func dateByAddingDays(_ days: Int) -> Date {
        let aTimeInterval = self.timeIntervalSinceReferenceDate + TimeInterval(86400 * days)
        return Date.init(timeIntervalSinceReferenceDate: aTimeInterval)
    }
    
    func dateByAddingHours(_ hours: Int) -> Date {
        let aTimeInterval = self.timeIntervalSinceReferenceDate + TimeInterval(3600 * hours)
        return Date.init(timeIntervalSinceReferenceDate: aTimeInterval)
    }
    
    func dateByAddingMinutes(_ minutes: Int) -> Date {
        let aTimeInterval = self.timeIntervalSinceReferenceDate + TimeInterval(60 * minutes)
        return Date.init(timeIntervalSinceReferenceDate: aTimeInterval)
    }
    
    func dateByAddingSeconds(_ seconds: Int) -> Date {
        let aTimeInterval = self.timeIntervalSinceReferenceDate + TimeInterval(seconds)
        return Date.init(timeIntervalSinceReferenceDate: aTimeInterval)
    }
    
    
    /// Date转String
    /// - Parameters:
    ///   - format: 格式化字符串
    ///   - timeZone: 时区
    ///   - locale: 地区
    func stringWithFormat(_ format: String, timeZone: TimeZone = TimeZone.current, locale: Locale = Locale.current) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = timeZone
        formatter.locale = locale
        return formatter.string(from: self)
    }
    
    /// String转Date
    /// - Parameters:
    ///   - dateString: 时间字符串
    ///   - format: 格式化字符串
    ///   - timeZone: 时区
    ///   - locale: 地区
    static func dateWithString(_ dateString: String, format: String, timeZone: TimeZone = TimeZone.current, locale: Locale = Locale.current) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = timeZone
        formatter.locale = locale
        return formatter.date(from: dateString)
    }
}
