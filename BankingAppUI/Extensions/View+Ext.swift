//
//  View+Ext.swift
//  BankingAppUI
//
//  Created by Ali Aghamirbabaei on 1/23/22.
//

import SwiftUI

extension View {
    func hLeading() -> some View {
        self
            .frame (maxWidth: .infinity, alignment: .leading)
    }
    
    func hTrailing() -> some View {
        self
            .frame (maxWidth: .infinity, alignment: .trailing)
    }

    func hCenter() -> some View {
        self
            .frame (maxWidth: .infinity, alignment: .center)
    }

    func vCenter() -> some View {
        self
            .frame (maxHeight: .infinity, alignment: .center)
    }

    func vTop() -> some View {
        self
            .frame (maxHeight: .infinity, alignment: .top)
    }
    
    func vBottom() -> some View {
        self
            .frame (maxHeight: .infinity, alignment: .bottom)
    }
}
