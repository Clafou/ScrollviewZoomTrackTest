//
//  OverlaysView.swift
//  ScrollviewZoomTrackTest
//
//  Created by Sébastien Molines on 04/11/2014.
//  Copyright (c) 2014 Clafou. All rights reserved.
//

import UIKit

class OverlaysView: UIView {

    @IBOutlet var trackedScrollView: TrackedScrollView?
    
    let outline: CALayer
    
    required init(coder aDecoder: NSCoder) {
        outline = CALayer()
        outline.borderColor = UIColor.redColor().CGColor
        outline.borderWidth = 2
        super.init(coder: aDecoder)
        self.layer.addSublayer(outline)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let trackedScrollView = self.trackedScrollView {
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            let frame = trackedScrollView.convertRect(trackedScrollView.square.frame, toView: self)
            outline.frame = CGRectIntegral(CGRectInset(frame, -3, -3))
            CATransaction.commit()
        }
    }
}
