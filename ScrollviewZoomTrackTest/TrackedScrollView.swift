//
//  TrackedScrollView.swift
//  ScrollviewZoomTrackTest
//
//  Created by Sébastien Molines on 04/11/2014.
//  Copyright (c) 2014 Clafou. All rights reserved.
//

import UIKit

class TrackedScrollView: UIScrollView {
    
    @IBOutlet var overlaysView: UIView?

    let square: UIView
    
    required init(coder aDecoder: NSCoder) {
        square = UIView(frame: CGRect(x: 50, y: 300, width: 300, height: 300))
        square.backgroundColor = UIColor.orangeColor()

        super.init(coder: aDecoder)

        self.addSubview(square)
        self.maximumZoomScale = 1
        self.minimumZoomScale = 0.5
        self.contentSize = CGSize(width: 500, height: 900)
        self.delegate = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        overlaysView?.setNeedsLayout()
    }
}

extension TrackedScrollView: UIScrollViewDelegate {
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return square
    }
}
