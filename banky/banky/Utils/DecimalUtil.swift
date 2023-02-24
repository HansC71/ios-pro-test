//
//  DecimalUtil.swift
//  banky
//
//  Created by Johann Csida on 24.02.23.
//

import Foundation
extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
