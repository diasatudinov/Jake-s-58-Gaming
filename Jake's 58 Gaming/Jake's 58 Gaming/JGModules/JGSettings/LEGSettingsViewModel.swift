//
//  LEGSettingsViewModel.swift
//  Jake's 58 Gaming
//
//  Created by Dias Atudinov on 25.08.2025.
//


import SwiftUI

class LEGSettingsViewModel: ObservableObject {
    @AppStorage("soundEnabled") var soundEnabled: Bool = true
    @AppStorage("musicEnabled") var musicEnabled: Bool = true

}
