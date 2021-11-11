//
//  Registration.swift
//  FIT SPACE
//
//  Created by Krish Rana on 18/04/21.
//  Copyright © 2021 Krish Rana. All rights reserved.
//

import SwiftUI

struct Registration: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        
        ZStack{
            
            Color.init(red: 24/255, green: 26/255, blue: 32/255, opacity: 100)
                .ignoresSafeArea(edges: .vertical)
            
            VStack{
                VStack(alignment: .leading){
                    Text("What's your")
                        .fontWeight(.heavy)
                        .font(.system(size: 37))
                        .foregroundColor(.white)
                    
                    Text("email")
                        .fontWeight(.heavy)
                        .font(.system(size: 37))
                        .foregroundColor(.white)
                    
                    Text("address?")
                        .fontWeight(.heavy)
                        .font(.system(size: 37))
                        .foregroundColor(.white)
                    
                }
                .frame(width: 300, alignment: .leading)
                .padding(.top, 100)
                
                Text("Your Email")
                    .foregroundColor(.gray)
                    .frame(width: 300, alignment: .topLeading)
                    .padding(.top, 20)
                
                
                TextField(" ", text: self.$email)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 40)
                    .cornerRadius(12.28)
                
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 1)
                    .padding(.top, -10)
                
                
                
                NavigationLink(
                    destination: SetUp(),
                    label: {
                        Text("Continue")
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

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
    }
}
