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
        return false
    }
}

public enum TimeSlot: String {
    case rush
    case valley
    case flat
}
