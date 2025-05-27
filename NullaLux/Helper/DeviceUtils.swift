//
//  DeviceUtils.swift
//  LightsOut
//
//  Created by Daniel Ian on 01/04/25.
//

import SwiftUI

struct DeviceUtils {
    static func isPhone(sizeClass: UserInterfaceSizeClass?) -> Bool {
        return sizeClass == .compact
    }
}

extension View {
    func isPhone(sizeClass: UserInterfaceSizeClass?) -> Bool {
        return DeviceUtils.isPhone(sizeClass: sizeClass)
    }
}
