//
//  ContentView.swift
//  SwiftUI-Component
//
//  Created by Parsa Karami on 2024-01-27.
//

import SwiftUI

struct ShowRoom: View {
    
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
                }
                .frame(maxWidth: .infinity ,maxHeight: .infinity)
            }
        }
    }
}

#Preview {
    ShowRoom()
}
