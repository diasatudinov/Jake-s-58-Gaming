//
//  JGMainMenuView.swift
//  Jake's 58 Gaming
//
//

import SwiftUI

struct JGMainMenuView: View {
    @State private var showGame = false
    @State private var showShop = false
    @State private var showAchievement = false
    @State private var showMiniGames = false
    @State private var showSettings = false
    @State private var showCalendar = false
    @State private var showDailyReward = false
        
    var body: some View {
        
        ZStack {
            
            HStack {
                Spacer()
                VStack {
                    
                    NGCoinBg()
                    
                    Image(.settingsIconJG)
                        .resizable()
                        .scaledToFit()
                        .frame(height: NGDeviceManager.shared.deviceType == .pad ? 150:80)
                    
                    
                    
                    Image(.dailyTaskIconJG)
                        .resizable()
                        .scaledToFit()
                        .frame(height: NGDeviceManager.shared.deviceType == .pad ? 150:80)
                    
                }.opacity(0)
                Spacer()
                
                VStack(spacing: 0) {
                    Spacer()
                    
                    Image(.menuLogoJG)
                        .resizable()
                        .scaledToFit()
                        .frame(height: NGDeviceManager.shared.deviceType == .pad ? 300:180)
                    
                    HStack(spacing: 7) {
                        
                        Button {
                            showShop = true
                        } label: {
                            Image(.shopIconJG)
                                .resizable()
                                .scaledToFit()
                                .frame(height: NGDeviceManager.shared.deviceType == .pad ? 150:90)
                        }
                        
                        Button {
                            showGame = true
                        } label: {
                            Image(.playIconJG)
                                .resizable()
                                .scaledToFit()
                                .frame(height: NGDeviceManager.shared.deviceType == .pad ? 200:120)
                        }
                        
                        Button {
                            showAchievement = true
                        } label: {
                            Image(.achievementsIconJG)
                                .resizable()
                                .scaledToFit()
                                .frame(height: NGDeviceManager.shared.deviceType == .pad ? 150:90)
                        }
                        
                    }
                    Spacer()
                }
                
                Spacer()
                VStack {
                    
                    NGCoinBg()
                        .padding(.bottom, 35)
                    
                    Button {
                        showSettings = true
                    } label: {
                        Image(.settingsIconJG)
                            .resizable()
                            .scaledToFit()
                            .frame(height: NGDeviceManager.shared.deviceType == .pad ? 150:80)
                    }
                    
                    Button {
                        withAnimation {
                            showDailyReward = true
                        }
                    } label: {
                        Image(.dailyTaskIconJG)
                            .resizable()
                            .scaledToFit()
                            .frame(height: NGDeviceManager.shared.deviceType == .pad ? 150:80)
                    }
                }
                Spacer()
            }
            
            if showDailyReward {
                ZStack {
                    Color.appRed.opacity(0.6).ignoresSafeArea()
                    VStack {
                        Image(.dailyRewardsTextJG)
                            .resizable()
                            .scaledToFit()
                            .frame(height: NGDeviceManager.shared.deviceType == .pad ? 120:70)
                        
                        HStack {
                            Image(.chestJG)
                                .resizable()
                                .scaledToFit()
                                .frame(height: NGDeviceManager.shared.deviceType == .pad ? 500:280)
                            
                            VStack {
                                Image(.tenMoneyJG)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: NGDeviceManager.shared.deviceType == .pad ? 180:100)
                                Button {
                                    withAnimation {
                                        NGUser.shared.updateUserMoney(for: 10)
                                        showDailyReward.toggle()
                                    }
                                } label: {
                                    Image(.takeBtnJG)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: NGDeviceManager.shared.deviceType == .pad ? 140:75)
                                }
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
            
        }.frame(maxWidth: .infinity)
            .background(
                ZStack {
                    Image(.mainMenuBgJG)
                        .resizable()
                        .scaledToFill()
                }.edgesIgnoringSafeArea(.all)
            )
            .fullScreenCover(isPresented: $showGame) {
                //                LEGLevelSelectView()
            }
            .fullScreenCover(isPresented: $showAchievement) {
                JGAchievementsView()
            }
            .fullScreenCover(isPresented: $showShop) {
                //                LEGShopView()
            }
            .fullScreenCover(isPresented: $showSettings) {
                JGSettingsView()
            }
    }
}

#Preview {
    JGMainMenuView()
}
