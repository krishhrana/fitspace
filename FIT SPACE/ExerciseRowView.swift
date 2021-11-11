//
//  ExerciseRowView.swift
//  FIT SPACE
//
//  Created by Krish Rana on 03/11/20.
//  Copyright © 2020 Krish Rana. All rights reserved.
//

import SwiftUI

struct ExerciseRowView: View {
    var imgName: String
    var body: some View {
        HStack{
            ZStack{
                GeometryReader { geo in
                        Image(self.imgName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 125)
                            .clipped(antialiased: true)
                    }
                    .frame(height: 125)
            }
            
        }
    }
}

struct ExerciseRowView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRowView(imgName: "AirSquat")
    }
}
