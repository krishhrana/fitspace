//
//  Tabs.swift
//  FIT SPACE
//
//  Created by Krish Rana on 05/11/20.
//  Copyright © 2020 Krish Rana. All rights reserved.
//

import SwiftUI

struct Tabs: View {
    @State var selected = 2
    var body: some View {
        TabView(selection: $selected) {
                Home()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
            }.tag(1)
                
                Browse().tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Browse")
            }.tag(2)
            
                Saved().tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Saved")
            }.tag(3)
            
                Premium().tabItem {
                    Image(systemName: "star.circle.fill")
                    Text("Premium")
            }.tag(4)
        }
        
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
