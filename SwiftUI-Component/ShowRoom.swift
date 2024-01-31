//
//  ContentView.swift
//  SwiftUI-Component
//
//  Created by Parsa Karami on 2024-01-27.
//

import SwiftUI

struct ShowRoom: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View {
        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            NavigationSplitView {
                ZStack {
                    LinearGradient(colors:[.indigo,.black,.black], startPoint: .topLeading, endPoint: .bottomTrailing)
                    NavigationLink(destination: PhotoPickerView(), label: {
                        HStack {
                            Image(systemName: "photo.on.rectangle.angled")
                            Text("Photo Picker")
                        }
                        .padding()
                        .frame(alignment: .leading)
                    })
                    .tint(.white)
                    
                }
                .ignoresSafeArea()
            } detail: {
                Text("The app is running from the Mac or iPad.")
            }
        } else {
            NavigationView {
                ZStack {
                    VStack {
                        NavigationLink {
                            SideMenuView()
                        } label: {
                            Text("Side Menu")
                                .frame(width: 200,height:40)
                                .background(.indigo)
                                .foregroundStyle(.white)
                                .clipShape(.capsule)
                        }
                        
                        NavigationLink {
                            PhotoPickerView()
                        } label: {
                            Text("Photo Picker")
                                .frame(width: 200,height:40)
                                .background(.indigo)
                                .foregroundStyle(.white)
                                .clipShape(.capsule)
                        }
                    }
                    .frame(maxWidth: .infinity ,maxHeight: .infinity)
                }
            }
        }
    }
}

#Preview {
    ShowRoom()
}
