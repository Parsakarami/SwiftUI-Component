//
//  ContentView.swift
//  SwiftUI-Component
//
//  Created by Parsa Karami on 2024-01-27.
//

import SwiftUI

struct ShowRoom: View {
    @State var showSideMenu : Bool = false
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    withAnimation(.snappy) {
                        showSideMenu.toggle()
                    }
                }, label: {
                    Text("Side Menu")
                        .frame(width: 200,height:40)
                        .background(.indigo)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                })
            }
            .zIndex(0)
            .padding()
            
            SideMenu(isShowMenu: $showSideMenu, userName: "Jenna Smith", profile: "Profile", bgColors: [.blue,.black,.black])
        }
    }
}

#Preview {
    ShowRoom()
}
