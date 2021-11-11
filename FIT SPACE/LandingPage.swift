//
//  LandingPage.swift
//  FIT SPACE
//
//  Created by Krish Rana on 03/11/20.
//  Copyright © 2020 Krish Rana. All rights reserved.
//

import SwiftUI

struct LandingPage: View {
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: true){
                Tabs()
                Divider()
                Spacer()
            }
        .navigationBarTitle(Text("Workouts"))
        }
        
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
