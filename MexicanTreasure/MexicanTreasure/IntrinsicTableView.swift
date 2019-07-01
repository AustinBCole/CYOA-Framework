//
//  IntrinsicTableView.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 7/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class IntrinsicTableView: UITableView {

    class IntrinsicTableView: UITableView {
        
        override var contentSize:CGSize {
            didSet {
                self.invalidateIntrinsicContentSize()
            }
        }
        
        override var intrinsicContentSize: CGSize {
            self.layoutIfNeeded()
            return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
        }
        
    }

}
