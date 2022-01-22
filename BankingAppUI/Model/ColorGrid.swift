//
//  ColorGrid.swift
//  BankingAppUI
//
//  Created by Ali Aghamirbabaei on 1/23/22.
//

import SwiftUI

struct ColorGrid: Identifiable{
    var id = UUID().uuidString
    var hexValue: String
    var color: Color
    
    // MARK: Animation Properties for Each Card
    var rotateCards: Bool = false
    var addToGrid: Bool = false
    var showText: Bool = false
    var removeFromView: Bool = false
}
