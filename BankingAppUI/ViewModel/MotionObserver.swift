//
//  MotionObserver.swift
//  MotionParallax
//
//  Created by Ali Aghamirbabaei on 4/8/22.
//

import SwiftUI
import CoreMotion

/// roll is X-Axis
/// pitch is Y-Axis

class MotionObserver: ObservableObject {
    @Published var motionManager = CMMotionManager()
    @Published var xValue: CGFloat = 0
    @Published var yValue: CGFloat = 0
    @Published var movingOffset: CGSize = .zero
    
    func fetchMotionData(duration: CGFloat) {
        motionManager.startDeviceMotionUpdates(to: .main) { data, err in
            if let error = err {
                print(error.localizedDescription)
            }
            
            guard let data = data else {
                print("Error in data")
                return
            }
            
            withAnimation(.timingCurve(0.18, 0.78, 0.18, 1, duration: 0.77)) {
                self.xValue = data.attitude.roll
                self.yValue = data.attitude.pitch
                self.movingOffset = self.getOffset(duration: duration)
            }
        }
    }
    
    func getOffset(duration: CGFloat) -> CGSize {
        let width = xValue * duration
        let height = yValue * duration
        
        return CGSize(width: width, height: height)
    }
}
