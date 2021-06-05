import Foundation

public struct TimeSlotsCalculator {
    public func getTimeSlot(for date: Date) -> TimeSlot {
        return .rush
    }
}

public enum TimeSlot: String {
    case rush
    case valley
    case flat
}
