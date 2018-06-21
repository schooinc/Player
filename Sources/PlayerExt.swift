//
//  PlayerExt.swift
//  Player_iOS
//
//  Created by ichikawa on 2018/05/16.
//  Copyright © 2018年 Patrick Piemonte. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

extension Player {

    /// AVPlayer取得
    ///
    /// - Returns: AVPlayer
    open func getAVPlayer() -> AVPlayer {
        return self._avplayer
    }

    /// AVPlayerItem取得
    ///
    /// - Returns: AVPlayer || nil
    open func getAVPlayerItem() -> AVPlayerItem? {
        return self._playerItem
    }

    /// 先頭から再生
    ///
    /// - Parameter atRate: 再生レート
    open func playFromBeginning(atRate: Float) {
        self.playbackDelegate?.playerPlaybackWillStartFromBeginning(self)
        self._avplayer.seek(to: kCMTimeZero)
        self.playFromCurrentTime(atRate: atRate)
    }

    /// 現在位置から再生
    ///
    /// - Parameter atRate: 再生レート
    open func playFromCurrentTime(atRate: Float) {
        if !self.autoplay {
            _hasAutoplayActivated = true
        }
        self.play(atRate: atRate)
    }

    /// レート指定で再生
    ///
    /// - Parameter atRate: 再生レート
    internal func play(atRate: Float) {
        self._playerRate = atRate
        if autoplay || _hasAutoplayActivated {
            self.playbackState = .playing
            if #available(iOS 10.0, *) {
                self._avplayer.playImmediately(atRate: atRate)
            } else {
                self._avplayer.play()
                self._avplayer.rate = atRate
            }
        }
    }
    
}
