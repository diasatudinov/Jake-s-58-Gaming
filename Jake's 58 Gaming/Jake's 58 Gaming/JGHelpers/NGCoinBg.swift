//
//  NGCoinBg.swift
//  Jake's 58 Gaming
//
//  Created by Dias Atudinov on 22.08.2025.
//


import SwiftUI

struct NGCoinBg: View {
    @StateObject var user = NGUser.shared
    var height: CGFloat = NGDeviceManager.shared.deviceType == .pad ? 120:70
    var body: some View {
        ZStack {
            Image(.coinsBgNG)
                .resizable()
                .scaledToFit()
            
            Text("\(user.money)")
                .font(.system(size: NGDeviceManager.shared.deviceType == .pad ? 40:20, weight: .black))
                .foregroundStyle(.white)
                .textCase(.uppercase)
                .offset(x: 20)
            
            
            
        }.frame(height: height)
        
    }
}

#Preview {
    NGCoinBg()
}