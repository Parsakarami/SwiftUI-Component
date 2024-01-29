//
//  SideMenuView.swift
//  SwiftUI-Component
//
//  Created by Parsa Karami on 2024-01-29.
//

import SwiftUI

struct SideMenuView: View {
    @State var showSideMenu : Bool = false
    @State var showAnimation : Bool = false
    var body: some View {
        ZStack{
            VStack{
                Image(systemName: "hand.point.up.left.fill")
                    .font(.title)
                    .padding(2)
                    .foregroundStyle(.indigo)
                    .offset(x:showAnimation ? -50 : 50, y: 0)
                VStack{
                    Text("Drag to the right to open the menu")
                        .font(.caption)
                }
                .foregroundStyle(.white)
                .padding()
                .background(.pink)
                .clipShape(.capsule)
                .frame(width:UIScreen.main.bounds.width - 50,height: 100)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .opacity(showSideMenu ? 0.75 : 1)
            .blur(radius: showSideMenu ? 3 : 0)
            .zIndex(0)
            
            SideMenu(
                isShowMenu: $showSideMenu,
                userName: "Jenna Smith",
                profile: "Profile",
                bgColors: [
                    .indigo,
                    .black,
                    .black
                ]
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gesture(DragGesture().onChanged({value in
            if value.translation.width  > 120{
                withAnimation(.snappy(duration: 0.25)) {
                    showSideMenu = true
                }
            }
        }).onEnded({value in
            withAnimation(.snappy(duration: 0.25)) {
                if -(value.translation.width) > 120 {
                    showSideMenu = false
                }
            }
        }))
        .onAppear() {
            withAnimation(
                .snappy(duration: 1)
                .repeatForever(autoreverses: true)) {
                showAnimation = true
            }
        }
    }
}

#Preview {
    SideMenuView()
}
