//
//  DateHelper.swift
//  
//
//  Created by Aitor Pagan on 5/6/21.
//

import Foundation

extension Date {
    static let normalFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return formatter
    }()
    
    static var midday: Date { normalFormatter.date(from: "01/01/2001 12:00:00")! }
    
    static var am8: Date { normalFormatter.date(from: "01/01/2001 8:00:00")! }
    
    static var am7: Date { normalFormatter.date(from: "01/01/2001 7:00:00")! }
    
    static var midnight: Date { normalFormatter.date(from: "01/01/2001 00:00:00")! }
    
    static var pm14: Date { normalFormatter.date(from: "01/01/2001 14:00:00")! }
    
    static var pm17: Date { normalFormatter.date(from: "01/01/2001 17:00:00")! }
    
    static var pm21: Date { normalFormatter.date(from: "01/01/2001 21:00:00")! }
    
    static var holiday: Date { normalFormatter.date(from: "21/01/2001 00:00:00")! }
    
    static var middayHoliday: Date { normalFormatter.date(from: "21/01/2001 12:00:00")! }
    
    static var weekendMidday: Date { normalFormatter.date(from: "6/01/2001 12:00:00")! }
}
