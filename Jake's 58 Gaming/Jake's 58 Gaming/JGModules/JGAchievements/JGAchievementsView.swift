//
//  JGAchievementsView.swift
//  Jake's 58 Gaming
//
//

import SwiftUI

struct JGAchievementsView: View {
    @State private var current: Int = 0
    @StateObject var achievementVM = LEGAchievementsViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            VStack {
                Image(.achievementsTextJG)
                    .resizable()
                    .scaledToFit()
                    .frame(height: NGDeviceManager.shared.deviceType == .pad ? 140:75)
                Spacer()
                GeometryReader { geo in
                    let w = geo.size.width
                    let spacing: CGFloat = 16
                    let sideScale: CGFloat = 0.75
                    
                    ZStack {
                        HStack(spacing: spacing) {
                            // ЛЕВАЯ (предыдущая)
                            imageView(index: leftIndex,
                                      scale: sideScale)
                            .frame(width: (w - spacing*2) * 0.28)
                            .contentShape(Rectangle())
                            .onTapGesture { move(.left) }
                            
                            // ЦЕНТРАЛЬНАЯ (текущая, крупнее)
                            imageView(index: current,
                                      scale: 1.0)
                            .frame(width: (w - spacing*2) * 0.44)
                            .shadow(radius: 10)
                            .contentShape(Rectangle())
                            
                            // ПРАВАЯ (следующая)
                            imageView(index: rightIndex,
                                      scale: sideScale)
                            .frame(width: (w - spacing*2) * 0.28)
                            .contentShape(Rectangle())
                            .onTapGesture { move(.right) }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .animation(.easeInOut(duration: 0.25), value: current)
                        
                        // Стрелки
                        HStack(spacing: ((w - spacing*2) * 0.44 - 60)) {
                            Button(action: { move(.left) }) {
                                Image(.arrowLeftJG)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: NGDeviceManager.shared.deviceType == .pad ? 100:50)
                            }
                            
                            Button(action: { move(.right) }) {
                                Image(.arrowLeftJG)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: NGDeviceManager.shared.deviceType == .pad ? 100:50)
                                    .scaleEffect(x: -1, y: 1)
                                
                            }
                        }
                        .padding(.horizontal, 8)
                    }
                }
                .frame(height: 260)
                .padding(.horizontal, 16)
                Spacer()
            }
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                            
                        } label: {
                            Image(.backIconJG)
                                .resizable()
                                .scaledToFit()
                                .frame(height: NGDeviceManager.shared.deviceType == .pad ? 100:50)
                        }
                        
                        NGCoinBg()
                    }
                    Spacer()
                }.padding()
                Spacer()
                
            }
        }
        .background(
            ZStack {
                Image(.appBgJG)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
            } 
        )
    }
    
    private var leftIndex: Int  { (current - 1 + achievementVM.achievements.count) % achievementVM.achievements.count }
    private var rightIndex: Int { (current + 1) % achievementVM.achievements.count }
    
    private enum Direction { case left, right }
    private func move(_ dir: Direction) {
        switch dir {
        case .left:  current = (current - 1 + achievementVM.achievements.count) % achievementVM.achievements.count
        case .right: current = (current + 1) % achievementVM.achievements.count
        }
    }
    
    @ViewBuilder
    private func imageView(index: Int, scale: CGFloat) -> some View {
        ZStack {
            Image(achievementVM.achievements[index].image)
                .resizable()
                .scaledToFit()
                .opacity(achievementVM.achievements[index].isAchieved ? 1 : 0.5)
            if index == current {
                VStack {
                    Spacer()
                    Button {
                        if achievementVM.achievements[index].isAchieved {
                            NGUser.shared.updateUserMoney(for: 10)
                        }
                        achievementVM.achieveToggle(achievementVM.achievements[index])
                        
                    } label: {
                        Image(.tenMoneyBtnJG)
                            .resizable()
                            .scaledToFit()
                            .frame(height: NGDeviceManager.shared.deviceType == .pad ? 100:60)
                    }
                }
            }
        }
        .scaleEffect(scale)
        .animation(.easeInOut(duration: 0.25), value: scale)
        .animation(.easeInOut(duration: 0.25), value: 1)
    }
}

#Preview {
    JGAchievementsView()
}
