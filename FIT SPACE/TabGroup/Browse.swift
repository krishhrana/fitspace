//
//  Browse.swift
//  FIT SPACE
//
//  Created by Krish Rana on 05/11/20.
//  Copyright © 2020 Krish Rana. All rights reserved.
//

import SwiftUI

struct Browse: View {
    var models = ["AirSquat", "Situps"]
    var body: some View {
        NavigationView {
            List(models, id: \.self){ model in
                NavigationLink(destination: Exercise(exerciseName: model)){
                    Text(model)
                        .frame(height: 125)
                        .offset(x:10)
                        .font(.custom("Bebas-Regular", size: 24))
                        .foregroundColor(Color.black)
                }
                .background(ExerciseRowView(imgName: model))
            }
            .navigationBarTitle(Text("Browse"))
            
        }
    }
}

struct Browse_Previews: PreviewProvider {
    static var previews: some View {
        Browse()
    }
}
