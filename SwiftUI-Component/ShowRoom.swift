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
            iPadShowRoomView()
        } else {
            iPhoneShowRoomView()
        }
    }
}

#Preview {
    ShowRoom()
}

struct iPadShowRoomView: View {
    var body: some View {
        NavigationSplitView {
            ZStack {
                LinearGradient(colors:[.indigo,.black,.black], startPoint: .topLeading, endPoint: .bottomTrailing)
                
                VStack{
                    Spacer()
                    iPadSideMenuLink(destination: AnyView(PhotoPickerView()), title: "Photo Picker", icon: "photo.on.rectangle.angled")
                    
                    iPadSideMenuLink(destination: AnyView(SideMenuView()), title: "Side Menu", icon: "hand.point.up.left.fill")
                    
                    
                    Spacer()
                        HStack {
                            Spacer(minLength: 90)
                            Text("Find components source codes in the Github.")
                                .foregroundStyle(.white)
                                .font(.caption2)
                                .tint(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.bottom)
                        }
                    }
            }
            .ignoresSafeArea()
        } detail: {
            Text("The app is running from the Mac or iPad.")
        }
    }
}

struct iPhoneShowRoomView: View {
    var body: some View {
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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

struct iPadSideMenuLink: View {
    @State var destination : AnyView
    @State var title : String
    @State var icon : String
    var body: some View {
        NavigationLink(destination:destination, label: {
            HStack {
                Spacer()
                Image(systemName: icon)
                    .frame(minWidth: 30, maxWidth: 30)
                    .padding(.leading,15)
                Text(title)
                    .padding(.leading,10)
                Spacer()
                Spacer()
                Image(systemName: "chevron.right")
                    .padding(.trailing)
            }
            .padding()
            .frame(alignment: .leading)
            .padding(.leading)
        })
        .background(.gray.opacity(0.15))
        .tint(.white)
        .frame(maxWidth: .infinity)
    }
}
