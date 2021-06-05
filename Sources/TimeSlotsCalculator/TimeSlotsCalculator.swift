import Foundation

public enum TimeSlotsErrors: Error {
    case invalidDateHour
}

public struct TimeSlotsCalculator {
    private enum Configuration {
        static let dateComponents: Set<Calendar.Component> = [.day, .month, .year, .hour, .minute, .second]
        
        static let endValleyHour: Int = 8
        
        static let flatHours: Set<Int> = [8, 9, 14, 15, 16, 17, 22, 23]
    }

    private var holidays: Set<Date> = []
    
    public init(holidays: Set<Date>) {
        self.holidays = holidays
    }
    
    /// Get time slot from a date given, date must contain day, month, year and hour at least
    /// @return TImeSlot time slot from date given (valley, flat, rush)
    public func getTimeSlot(for date: Date) throws -> TimeSlot {
        let components = Calendar.current.dateComponents(Configuration.dateComponents,
                                           from: date)
        
        if try isValley(components: components) {
            return .valley
        }
        
        if try isFlat(components: components) {
            return .flat
        }
        
        return .rush
    }
    
    // MARK: - Private
    
    private func isFlat(components: DateComponents) throws -> Bool {
        guard let hour = components.hour else { throw TimeSlotsErrors.invalidDateHour }
        
        return Configuration.flatHours.contains(hour)
    }
    
    private func isValley(components: DateComponents) throws -> Bool {
        guard let hour = components.hour else { throw TimeSlotsErrors.invalidDateHour }
        
        return isHoliday(components: components)
            || hour < Configuration.endValleyHour
    }
    
    private func isHoliday(components: DateComponents) -> Bool {
        holidays
            .map { Calendar.current.dateComponents(Configuration.dateComponents, from: $0) }
            .contains { $0.day == components.day && $0.month == components.month && $0.year == components.year }
    }
}

public enum TimeSlot: String {
    case rush
    case valley
    case flat
}
