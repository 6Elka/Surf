//
//  SupportFirstCollectionCell.swift
//  SURF
//
//  Created by Artem on 08.02.2023.
//

import Foundation
import UIKit

//MARK: - SupportFirstCollectionCell
final class SupportFirstCollectionCell: UICollectionViewCell {
    
    static let reuseId = "First"
    
    func configure(info: Item) {
        self.kindProfi.text = info.title
    }

    //MARK: - Label
    private let kindProfi = UILabel().createLabel(corner: 12, color: #colorLiteral(red: 0.9625495076, green: 0.9627466798, blue: 0.9688358903, alpha: 1), size: 14, weight: .semibold, textColor: #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1), alignment: .center)
    
    //MARK: - IsSelected
    override var isSelected: Bool {
        didSet {
            if isSelected {
                kindProfi.backgroundColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
                kindProfi.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                kindProfi.backgroundColor = #colorLiteral(red: 0.9625495076, green: 0.9627466798, blue: 0.9688358903, alpha: 1)
                kindProfi.textColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
            }
        }
    }
    
    //MARK: - IsHighlighted
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                print("z")
                kindProfi.backgroundColor = #colorLiteral(red: 0.9625495076, green: 0.9627466798, blue: 0.9688358903, alpha: 1)
                kindProfi.textColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func setup() {
        contentView.addSubview(kindProfi)
        
        NSLayoutConstraint.activate([
            kindProfi.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            kindProfi.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            kindProfi.widthAnchor.constraint(equalToConstant: 70),
            kindProfi.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
