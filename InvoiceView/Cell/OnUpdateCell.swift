//
//  OnUpdateCell.swift
//  InvoiceView
//
//  Created by Binar - Akbar on 12/02/22.
//

import UIKit

class OnUpdateCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.roundCorners(.allCorners, radius: 4)
        self.containerView.roundCorners(.allCorners, radius: 4)
        self.addShadowWithoutBezierPath()
    }

}
