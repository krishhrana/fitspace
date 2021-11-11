//
//  SetUp.swift
//  FIT SPACE
//
//  Created by Krish Rana on 17/04/21.
//  Copyright © 2021 Krish Rana. All rights reserved.
//

import SwiftUI

struct SetUp: View {
    @State var selectedHeight = 1
    @State var gender: String?
    @State var clicked = false
    @EnvironmentObject var viewlaunch: ViewLaunch
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack{
            
            Color.init(red: 24/255, green: 26/255, blue: 32/255, opacity: 100)
                .ignoresSafeArea(edges: .vertical)
            
            VStack{
                
                VStack(alignment: .leading){
                    Text("Just a few details.")
                        .fontWeight(.heavy)
                        .font(.system(size: 37))
                        .foregroundColor(.white)
                        .frame(width: 300, alignment: .leading)
                        .padding(.bottom, 100)
                        .padding(.top, 50)
                    
                    VStack{
                        HStack{
                            Text("Birth Date")
                                .foregroundColor(.gray)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                                .padding(.leading, 10)
                            Spacer()
                        }
                        DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/,
                                   label: {
                                    /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/
                                        .foregroundColor(.white)})
                            .padding(.leading, 10)
                            .padding(.bottom, 20)
                        
                        HStack{
                            Text("Height")
                                .foregroundColor(.gray)
                                .frame(width: 100, alignment: .topLeading)
                                .padding(.leading, 10)
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        
                    }
                }
                
                Spacer()
                Button(action: {
                    print("DEBUG: ")
                    UserDefaults.standard.set(true, forKey: "LaunchBefore")
                    self.viewlaunch.currentPage = "Tabs"
                        
                }){

                    Text("Next")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 300, height: 51.42)
                        .background(Color.blue)
                        .cornerRadius(12.28)
                        .padding(.top, 30)
                    
                }
            }
        }
    }
}

struct SetUp_Previews: PreviewProvider {
    static var previews: some View {
        SetUp()
    }
}
