//
//  NGCoinBg.swift
//  Jake's 58 Gaming
//
//


import SwiftUI

struct NGCoinBg: View {
    @StateObject var user = NGUser.shared
    var height: CGFloat = NGDeviceManager.shared.deviceType == .pad ? 100:50
    var body: some View {
        ZStack {
            Image(.coinsBgJG)
                .resizable()
                .scaledToFit()
            
            Text("\(user.money)")
                .font(.system(size: NGDeviceManager.shared.deviceType == .pad ? 45:25, weight: .black))
                .foregroundStyle(.white)
                .textCase(.uppercase)
            
            
            
        }.frame(height: height)
        
    }
}

#Preview {
    NGCoinBg()
}
