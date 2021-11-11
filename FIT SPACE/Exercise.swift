//
//  Exercise.swift
//  FIT SPACE
//
//  Created by Krish Rana on 03/11/20.
//  Copyright © 2020 Krish Rana. All rights reserved.
//

import SwiftUI
import ARKit
import RealityKit

//Contains Excercise_Details and PlacementButtons Views
struct Exercise: View {
    @State private var isPlacementEnabled = false
    @State private var selectedmodel: String?
    @State private var modelConfirmedForPlacement: String?
    // Analogous to selectedmodel: Set in BrowseView
    @State var exerciseName: String
    var body: some View {
        ZStack{
            if self.isPlacementEnabled{
                PlacementButtonsView(isPlacementEnabled: self.$isPlacementEnabled, excerciseName: self.$exerciseName, modelConfirmedForPlacemet: self.$modelConfirmedForPlacement)
            }
            else{
                //Analogous to ModelPickerView
                Excercise_Details(isPlacementEnabled: self.$isPlacementEnabled, exerciseName: self.$exerciseName)
            }
        }
    }
}


// Gives Details of Exercise Path to ArView
struct Excercise_Details: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var exerciseName: String
    var body: some View {
        ZStack{
            VStack{
                    Image(self.exerciseName)
                        .resizable()
                        .frame(width: .infinity)
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea(edges: .top)
                        .offset(y: -100)
                        
                Spacer()
            }
            
            VStack(){
                Text(exerciseName)
                    .font(.custom("Bebas-Regular", size: 51)).bold()
                    .foregroundColor(Color.white)
                    .padding(.top, 130)
                
                HStack(spacing: 30){
                    VStack{
                        Image(systemName: "timer")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                        Text("30 MINS")
                            .foregroundColor(Color.white)
                            .font(.custom("Bebas-Regular", size: 24))
                            .bold()
                    }
                    VStack{
                        Image(systemName: "bolt.fill")
                        .resizable()
                            .frame(width: 20, height: 30)
                        .foregroundColor(Color.white)
                        Text("Intensity")
                            .foregroundColor(Color.white)
                            .font(.custom("Bebas-Regular", size: 24))
                            .bold()
                    }
                    VStack{
                        Image(systemName: "flame")
                        .resizable()
                            .frame(width: 30, height: 34)
                        .foregroundColor(Color.white)
                        Text("30 CAL")
                            .foregroundColor(Color.white)
                            .font(.custom("Bebas-Regular", size: 24))
                            .bold()
                    }
                }.padding(.top, 130)
                
                Button(action:{
                    print("Ar Button Clicked")
                    self.isPlacementEnabled = true
                }){
                    Text("AR")
                        .frame(width: 100, height: 100)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(
                    Circle().stroke(Color.black, lineWidth: 2))
                    .shadow(radius: 10)
                }.buttonStyle(PlainButtonStyle())
                
                Spacer()
            }
        }
    }
}

struct PlacementButtonsView: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var excerciseName: String
    @Binding var modelConfirmedForPlacemet: String?
    var body: some View {
        ZStack(alignment: .bottom){
            ARViewContainer(modelConfirmedforPlacement: self.$modelConfirmedForPlacemet)
            
            HStack{
                //Cancel Button
                Button(action: {
                    print("[Debug] Placement Cancled")
                    self.isPlacementEnabled = false
                    
                }) {
                    Image(systemName: "xmark")
                        .frame(width: 60, height: 60, alignment: .center)
                        .background(Color.white, alignment: .center)
                        .cornerRadius(30)
                        .padding(20)
                }
                
                //Connfirm Button
                Button(action: {
                    print("[Debug] Placement Confirm")
                    self.modelConfirmedForPlacemet = excerciseName
                }) {
                    Image(systemName: "checkmark")
                        .frame(width: 60, height: 60, alignment: .center)
                        .background(Color.white, alignment: .center)
                        .cornerRadius(30)
                        .padding(20)
                }
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelConfirmedforPlacement: String?
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        arView.session.run(config)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let modelName=self.modelConfirmedforPlacement
        {
            print("[Debug] Adding model to scene \(modelName)")
            let filename = modelName + ".usdz"
            let modelEntity = try! ModelEntity.loadModel(named: filename)
            
            modelEntity.scale = SIMD3<Float>([0.005, 0.005, 0.005])
            
            let modelAnimation = modelEntity.availableAnimations[0]
            print("[Model Animation] \(modelAnimation)")
            let anchorEntity = AnchorEntity(plane: .any)
            anchorEntity.addChild(modelEntity)
                        
            uiView.scene.addAnchor(anchorEntity)
            modelEntity.playAnimation(modelEntity.availableAnimations[0].repeat(duration: .infinity),transitionDuration: 0.5,startsPaused: false)
            
            DispatchQueue.main.async {
                self.modelConfirmedforPlacement = nil
            }
        }
    }
    
}





struct Exercise_Previews: PreviewProvider {
    static var previews: some View {
        Exercise(exerciseName: "Situps")
    }
}
