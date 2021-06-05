import Foundation

public struct TimeSlotsCalculator {
    private static let dateComponents: Set<Calendar.Component> = [.day, .month, .year, .hour, .minute, .second]
    public func getTimeSlot(for date: Date) -> TimeSlot {
        let components = Calendar.current.dateComponents(Self.dateComponents,
                                           from: date)
        if let hour = components.hour, hour < 12 {
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
