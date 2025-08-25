//
//  JGSettingsView.swift
//  Jake's 58 Gaming
//
//

import SwiftUI

struct JGSettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var settingsVM = LEGSettingsViewModel()
    var body: some View {
        ZStack {
            
            VStack {
                
                Image(.settingsTextJG)
                    .resizable()
                    .scaledToFit()
                    .frame(height: NGDeviceManager.shared.deviceType == .pad ? 140:75)
                
                HStack {
                    
                    ZStack {
                        Image(.soundSettingsBgJG)
                            .resizable()
                            .scaledToFit()
                            .frame(height: NGDeviceManager.shared.deviceType == .pad ? 340:170)
                        
                        Button {
                            withAnimation {
                                settingsVM.soundEnabled.toggle()
                            }
                        } label: {
                            Image(settingsVM.soundEnabled ? .onJG:.offJG)
                                .resizable()
                                .scaledToFit()
                                .frame(height: NGDeviceManager.shared.deviceType == .pad ? 200:110)
                        }.offset(y: 10)
                    }
                    
                    Image(.languageBgJG)
                        .resizable()
                        .scaledToFit()
                        .frame(height: NGDeviceManager.shared.deviceType == .pad ? 500:300)
                    
                    ZStack {
                        Image(.musicSettingsBgJG)
                            .resizable()
                            .scaledToFit()
                            .frame(height: NGDeviceManager.shared.deviceType == .pad ? 340:170)
                        
                        Button {
                            withAnimation {
                                settingsVM.musicEnabled.toggle()
                            }
                        } label: {
                            Image(settingsVM.musicEnabled ? .onJG:.offJG)
                                .resizable()
                                .scaledToFit()
                                .frame(height: NGDeviceManager.shared.deviceType == .pad ? 200:110)
                        }.offset(y: 10)
                    }
                }
                Spacer()
            }
            
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        Image(.backIconJG)
                            .resizable()
                            .scaledToFit()
                            .frame(height: NGDeviceManager.shared.deviceType == .pad ? 100:50)
                    }
                    Spacer()
                }.padding()
                Spacer()
                
            }
        }.frame(maxWidth: .infinity)
            .background(
                ZStack {
                    Image(.appBgJG)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    
                }
                
            )
    }
}

#Preview {
    JGSettingsView()
}
