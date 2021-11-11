//
//  OnBoarding.swift
//  FIT SPACE
//
//  Created by Krish Rana on 17/04/21.
//  Copyright © 2021 Krish Rana. All rights reserved.
//

import SwiftUI

struct OnBoarding: View {
    @EnvironmentObject var viewlaunch: ViewLaunch
    var body: some View {
        NavigationView{
            ZStack{
                
                Color.init(red: 24/255, green: 26/255, blue: 32/255, opacity: 100)
                    .ignoresSafeArea(edges: .vertical)
                
                VStack{
                    
                    Spacer()
                    VStack(alignment: .leading, spacing: 6){
                        Text("Let's create a")
                            .fontWeight(.heavy)
                            .font(.system(size: 37))
                            .foregroundColor(.white)
                        
                        Text("workout just")
                            .fontWeight(.heavy)
                            .font(.system(size: 37))
                            .foregroundColor(.white)
                        
                        Text("for you.")
                            .fontWeight(.heavy)
                            .font(.system(size: 37))
                            .foregroundColor(.white)
                        
                    }
                    .frame(width: 300, alignment: .leading)
                    .padding(.top, 200)
                    
                    
                    NavigationLink(
                        destination: LogIn(),
                        label: {
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(width: 300, height: 51.42)
                                .background(Color.blue)
                                .cornerRadius(12.28)
                                .padding(.top, 30)
                        })
                    
                    Spacer()
                }
                
            }
        }
        
    }
}


struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
