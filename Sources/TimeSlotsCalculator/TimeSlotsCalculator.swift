import Foundation

public enum TimeSlotsErrors: Error {
    case invalidDateHour
}

public struct TimeSlotsCalculator {
    private static let dateComponents: Set<Calendar.Component> = [.day, .month, .year, .hour, .minute, .second]
    
    private static let flatHours: Set<Int> = [8, 9, 14, 15, 16, 17, 22, 23]
    
    public func getTimeSlot(for date: Date) throws -> TimeSlot {
        let components = Calendar.current.dateComponents(Self.dateComponents,
                                           from: date)
        guard let hour = components.hour else { throw TimeSlotsErrors.invalidDateHour }
        
        if hour < 8 {
            return .valley
        }
        
        if Self.flatHours.contains(hour) {
            return .flat
        }
        
        return .rush
    }
}

public enum TimeSlot: String {
    case rush
    case valley
    case flat
}
