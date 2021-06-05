import XCTest
@testable import TimeSlotsCalculator

final class TimeSlotsCalculatorTests: XCTestCase {
    func testAtMiddayShouldReturnRushHour() {
        let calculator = TimeSlotsCalculator(holidays: [])
        let date = Date.midday
        
        let response = try? calculator.getTimeSlot(for: date)
        
        XCTAssertEqual(response, .rush)
    }
    
    func testAtEightShouldReturnFlatHour() {
        let calculator = TimeSlotsCalculator(holidays: [])
        let date = Date.am8
        
        let response = try? calculator.getTimeSlot(for: date)
        
        XCTAssertEqual(response, .flat)
    }
    
    func testAtSevenAMShouldReturnValleyHour(){
        let calculator = TimeSlotsCalculator(holidays: [])
        let date = Date.am7
        
        let response = try? calculator.getTimeSlot(for: date)
        
        XCTAssertEqual(response, .valley)
    }
    
    func testAtMidnightShouldReturnValleyHour(){
        let calculator = TimeSlotsCalculator(holidays: [])
        let date = Date.midnight
        
        let response = try? calculator.getTimeSlot(for: date)
        
        XCTAssertEqual(response, .valley)
    }
    
    func testAt14hShouldReturnFlatHour() {
        let calculator = TimeSlotsCalculator(holidays: [])
        let date = Date.pm14
        
        let response = try? calculator.getTimeSlot(for: date)
        
        XCTAssertEqual(response, .flat)
    }
    
    func testAt17hShouldReturnFlatHour() {
        let calculator = TimeSlotsCalculator(holidays: [])
        let date = Date.pm17
        
        let response = try? calculator.getTimeSlot(for: date)
        
        XCTAssertEqual(response, .flat)
    }
    
    func testAt21hShouldReturnRushHour() {
        let calculator = TimeSlotsCalculator(holidays: [])
        let date = Date.pm21
        
        let response = try? calculator.getTimeSlot(for: date)
        
        XCTAssertEqual(response, .rush)
    }
}
