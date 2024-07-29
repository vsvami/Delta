//
//  File.swift
//  
//
//  Created by Tatiana Lazarenko on 7/29/24.
//

import SwiftUI

public extension Color {
    static let theme = AppColors()
}

public struct AppColors {
    //System Colors
    public let appWhite = Color("appWhite")
    public let appBlack = Color("appBlack")
    public let appBackground = Color("appBackground")
    public let appBackgroundMini = Color("appBackgroundMini")
    
    //Accent Colors
    public let appBlue = Color("appBlue")
    public let appGreen = Color("appGreen")
    public let appMint = Color("appMint")
    public let appPink = Color("appPink")
    public let appPurple = Color("appPurple")
    public let appRed = Color("appRed")
    public let appYellow = Color("appYellow")
    
}

public extension LinearGradient {
    static var blueGradient = LinearGradient(
        gradient: Gradient(colors: [Color.theme.appBlue, Color.theme.appPurple]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static var purpleGradient = LinearGradient(
        gradient: Gradient(colors: [Color.theme.appPurple, Color.theme.appPink]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static var pinkGradient = LinearGradient(
        gradient: Gradient(colors: [Color.theme.appPink, Color.theme.appRed]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static var redGradient = LinearGradient(
        gradient: Gradient(colors: [Color.theme.appRed, Color.theme.appYellow]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static var yellowGradient = LinearGradient(
        gradient: Gradient(colors: [Color.theme.appYellow, Color.theme.appGreen]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static var greenGradient = LinearGradient(
        gradient: Gradient(colors: [Color.theme.appGreen, Color.theme.appMint]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static var mintGradient = LinearGradient(
        gradient: Gradient(colors: [Color.theme.appMint, Color.theme.appBlue]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
