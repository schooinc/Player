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
    
}
