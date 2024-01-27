//
//  SideMenu.swift
//  TTR-Multiplayer
//
//  Created by Parsa Karami on 2024-01-01.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isShowMenu : Bool
    @State var userName: String
    @State var profile : String
    @State var bgColors : [Color]
    @State var sideBarWidth : CGFloat = UIScreen.main.bounds.width - 120
    
    var body: some View {
        VStack (alignment: .leading){
            HStack (alignment:.top){
                VStack(alignment: .leading){
                    Image(profile).resizable()
                        .frame(width: 70,height: 70)
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .clipShape(.circle)
                    
                    Text(userName)
                        .font(.system(size: 22,weight: .semibold, design: .default))
                        .foregroundColor(.white)
                        .padding(.top,10)
                }
                Spacer()
            }
            .frame(width: sideBarWidth, height:200,alignment: .bottomLeading)
            VStack(alignment: .leading,spacing: 0) {
                VStack(alignment: .leading){
                    SideMenuItemButton(text: "Home", icon: "house.fill", action: {closeMenu()})
                    
                    SideMenuLink(text: "Bookmarks", icon: "bookmark.square.fill", destination: getSampleDestination())
                    
                    SideMenuLink(text: "List", icon: "list.bullet.rectangle.portrait.fill", destination: getSampleDestination())
                    
                    SideMenuLink(text: "Monetization", icon: "dollarsign.square.fill", destination: getSampleDestination())
                    
                    SideMenuLink(text: "Profile", icon: "person.fill", destination: getSampleDestination())
                    
                    SideMenuLink(text: "Settings", icon: "gear", destination: getSampleDestination())
                    Spacer()
                }
                .frame(minHeight: 300)
                .frame(alignment: .topLeading)
                Spacer()
                VStack (alignment: .leading) {
                    Spacer()
                    SideMenuItemButton(text:"Sign Out", icon:"arrow.left.square.fill", action: {
                        closeMenu()
                    })
                    Spacer()
                }
            }
            .padding(.top,80)
            .frame(width: sideBarWidth,alignment: .leading)
            Spacer()
        }
        .frame(width: sideBarWidth,
               height: getScreenSize().height,
               alignment: .center)
        .padding(.leading, 20)
        .background(
            LinearGradient(gradient: Gradient(colors:bgColors),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing))
        .frame(width: getScreenSize().width,
               height: getScreenSize().height,
               alignment: .leading)
        .offset(x: isShowMenu ? 0 : -getScreenSize().width)
        .gesture(DragGesture().onChanged({value in
        }).onEnded({value in
            let width = value.translation.width
            withAnimation(.snappy(duration: 0.25)) {
                if -(width) > 120 {
                    isShowMenu = false
                }
            }
        }))
    }
    
    private func closeMenu() {
        withAnimation(.snappy){
            isShowMenu = false
        }
    }
    
    private func getSampleDestination() -> AnyView {
        return AnyView(VStack{})
    }
    
    private func getScreenSize() -> CGRect {
        return UIScreen.main.bounds
    }
}

#Preview {
    SideMenu(isShowMenu: .constant(true),
             userName: "Jenna Smith",
             profile: "Profile",
             bgColors: [.blue,.black,.black])
}
