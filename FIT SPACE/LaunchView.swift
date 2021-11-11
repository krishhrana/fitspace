//
//  LaunchView.swift
//  FIT SPACE
//
//  Created by Krish Rana on 17/04/21.
//  Copyright © 2021 Krish Rana. All rights reserved.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var viewlaunch: ViewLaunch
    var body: some View {
        VStack{
            if viewlaunch.currentPage == "OnBoarding" {
                OnBoarding()
                
            } else if viewlaunch.currentPage == "SetUp" {
                SetUp()
            }
            else if viewlaunch.currentPage == "Tabs" {
                Tabs()
            }
        }
    }
}

class ViewLaunch: ObservableObject {
    init() {
        if !UserDefaults.standard.bool(forKey: "LaunchBefore") {
                currentPage = "OnBoarding"
        } else {
            currentPage = "Tabs"
        }
        
        print($currentPage)
    }
    @Published var currentPage: String
    
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView().environmentObject(ViewLaunch())
    }
}
