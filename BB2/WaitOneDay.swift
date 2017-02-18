//
//  waitOneDay.swift
//  BB2
//
//  Created by Rob Norback on 2/10/17.
//  Copyright © 2017 Norback Solutions, LLC. All rights reserved.
//

import Foundation

class WaitOneDay: Puzzle {
    var puzzleId: PuzzleId = .waitOneDay
    var isSolved: Bool {
        return UserDefaults.standard.bool(forKey: puzzleId.rawValue)
    }
    
    func checkForSuccess(value secondsPassed:Int?) {
        guard let secondsPassed = secondsPassed else {
            print("\(type(of:self)): Not passed a valid integer")
            return
        }
        
        if secondsPassed == 60 * 60 * 24 + 60 {
            NotificationCenter.default.post(
                name: Notification.Name(puzzleId.rawValue),
                object: nil
            )
            UserDefaults.standard.set(true, forKey: puzzleId.rawValue)
        }
    }
}
