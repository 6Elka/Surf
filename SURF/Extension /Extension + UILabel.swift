//
//  Extension + UILabel.swift
//  SURF
//
//  Created by Artem on 09.02.2023.
//

import Foundation
import UIKit

extension UILabel {
    func createLabel(corner: CGFloat, color: UIColor?, size: CGFloat, weight: UIFont.Weight, textColor: UIColor, alignment: NSTextAlignment) -> UILabel {
        let lbl = UILabel()
        lbl.layer.cornerRadius = corner
        lbl.clipsToBounds = true
        lbl.numberOfLines = 0
        lbl.backgroundColor = color
        lbl.textAlignment = alignment
        lbl.font = .systemFont(ofSize: size, weight: weight)
        lbl.textColor = textColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
}
