//
//  CalendarViewDay.swift
//
//  Created by roife on 3/11/20.
//

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct CalendarViewDay: View {
    let calendar: Calendar
    let day: Date
    let selected: Bool
    let hasEvents: Bool
    let width: CGFloat
    let height: CGFloat
    
    let selectedDateColor: Color
    let todayDateColor: Color
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Text("\(self.dateFormatter().string(from: day))")
                .font(.body)
                .foregroundColor(self.selected ? Color.white :
                                    self.calendar.isDateInWeekend(self.day) ? Color.secondary : Color.primary)
            
            if hasEvents {
                Circle()
                    .frame(width: 6, height: 6)
                    .offset(x: 0, y: 18)
                    .foregroundColor(Color.secondary)
            }
        }
        .padding(8)
        .frame(width: abs(self.width))
        .background(Circle()
                        .foregroundColor(dateColor())
                        .padding(0))
        .padding([.top, .bottom], 10)
        .frame(height: self.height)
    }
    
    func dateColor() -> Color {
        if self.selected {
            return self.selectedDateColor
        } else if calendar.isDateInToday(day) {
            return self.todayDateColor
        } else {
            return Color.clear
        }
    }
    
    func dateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "d"
        return formatter
    }
}
