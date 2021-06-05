import XCTest
@testable import TimeSlotsCalculator

final class TimeSlotsCalculatorTests: XCTestCase {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
        return formatter
    }()
    
    func testAtMiddayShouldReturnRushHour() {
        let calculator = TimeSlotsCalculator()
        let date = dateFormatter.date(from: "01/01/2001 12:00:00")!
        
        let response = calculator.getTimeSlot(for: date)
        
        XCTAssertEqual(response, .rush)
    }
    
    func testAtEightShouldReturnFlatHour() {
        let calculator = TimeSlotsCalculator()
        let date = dateFormatter.date(from: "01/01/2001 8:00:00")!
        
        let response = calculator.getTimeSlot(for: date)
        
        XCTAssertEqual(response, .flat)
    }
    
    func testAtSevenAMShouldReturnValleyHour(){
        let calculator = TimeSlotsCalculator()
        let date = dateFormatter.date(from: "01/01/2001 7:00:00")!
        
        let response = calculator.getTimeSlot(for: date)
        
        XCTAssertEqual(response, .valley)
    }
}
