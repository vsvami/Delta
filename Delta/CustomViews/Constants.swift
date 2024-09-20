//
//  Constants.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 08.09.24.
//

import SwiftUI

struct Constants {
    static let widthOne = (UIScreen.main.bounds.width - 16 * 6) / 5
    static let widthTwo = (UIScreen.main.bounds.width - 16 * 6) / 5 * 2 + 16
    static let widthThree = (UIScreen.main.bounds.width - 16 * 6) / 5 * 3 + 32
    static let widthFive = UIScreen.main.bounds.width - 32

    static let heightOne = UIScreen.main.bounds.height * 0.09
    static let heightTwo = UIScreen.main.bounds.height * 0.18 + 16
    static let heightThree = UIScreen.main.bounds.height * 0.1
    
    static let largeAccountCardWidth = UIScreen.main.bounds.width * 0.5
    static let largeAccountCardHeight = UIScreen.main.bounds.height * 0.15
    
    static let itemCardWidth = UIScreen.main.bounds.width * 0.44
    static let itemCardHeight = UIScreen.main.bounds.height * 0.12
    
    static let accountSettingsWidth = UIScreen.main.bounds.width - 32
    static let accountSettingsHeight = UIScreen.main.bounds.height * 0.2
    static let accountGroupSettingsHeight = UIScreen.main.bounds.height * 0.12
    
    static let accountPickerWidth = UIScreen.main.bounds.width * 0.44
    static let accountPickerHeight = UIScreen.main.bounds.height * 0.06
}
