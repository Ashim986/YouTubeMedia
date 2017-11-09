//
//  Extensions.swift
//  YouTubeMedia
//
//  Created by ashim Dahal on 11/6/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init (r : CGFloat , g :CGFloat, b : CGFloat){
        self.init(red : r/255 , green : g/255 , blue : b/255 , alpha : 1)
    }
}
