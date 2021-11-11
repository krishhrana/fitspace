//
//  LogIn.swift
//  FIT SPACE
//
//  Created by Krish Rana on 18/04/21.
//  Copyright © 2021 Krish Rana. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct LogIn: View {
    var body: some View {
            ZStack{
                Color.init(red: 24/255, green: 26/255, blue: 32/255, opacity: 100)
                    .ignoresSafeArea(edges: .vertical)
                
                VStack{
                    
                    Spacer()
                    VStack(alignment: .leading, spacing: 6){
                        Text("Workout")
                            .fontWeight(.heavy)
                            .font(.system(size: 37))
                            .foregroundColor(.white)
                    
                        
                        Text("Anywhere")
                            .fontWeight(.heavy)
                            .font(.system(size: 37))
                            .foregroundColor(.white)
                        
                        Text("Easily.")
                            .fontWeight(.heavy)
                            .font(.system(size: 37))
                            .foregroundColor(.white)
                        
                    }
                    .frame(width: 300, alignment: .leading)
                    .padding(.top, 200)
                    
                    
                    NavigationLink(
                        destination: Registration(),
                        label: {
                            Text("Continue with Email")
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

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
