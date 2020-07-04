//
//  AnimationState.swift
//  techie_brekkie
//
//  Created by David Grew on 03/07/2020.
//  Copyright © 2020 David Grew. All rights reserved.
//

import SwiftUI

class AnimationState: ObservableObject {
    
    @Published var stage: AnimationStage = .INITIAL
    @Published var hiddenPercent: Int = 10
    @Published var windmillRotation: Double = 0
    @Published var sunStage: Int = 0
    
    private var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(initialUpdate), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func restart() {
        withAnimation(.easeIn(duration: 0.5)) {
            self.stopTimer()
            self.stage = .INITIAL
            self.startTimer()
        }
    }
    
    @objc private func initialUpdate() {
        if stage == .INITIAL && hiddenPercent != 0 {
            withAnimation(.linear(duration: 0.1)) {
                hiddenPercent -= 1
            }
        } else if hiddenPercent == 0 {
            withAnimation(.easeIn(duration: 1)) {
                stage = .SETUP
                timer?.invalidate()
                timer = nil
                DispatchQueue.global(qos: .userInteractive).async {
                    sleep(1)
                    DispatchQueue.main.sync {
                        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.ongoingUpdate), userInfo: nil, repeats: true)
                    }
                }
            }
        }
    }
    
    @objc private func ongoingUpdate() {
        withAnimation(.linear(duration: 1)) {
            self.windmillRotation += 45
            self.sunStage = self.sunStage == 6 ? 0 : self.sunStage + 1
        }
    }
}
