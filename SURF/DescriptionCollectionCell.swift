//
//  DescriptionCollectionView.swift
//  SURF
//
//  Created by Artem on 08.02.2023.
//

import Foundation
import UIKit

//MARK: - DescriptionCollectionCell
final class DescriptionCollectionCell: UICollectionViewCell {
    
    static let reuseId = "Description"
    
    func configure(info: Item) {
        self.descriptionLabel.text = info.title
    }
    
    //MARK: - Label
    private let descriptionLabel = UILabel().createLabel(corner: 0, color: .white, size: 14, weight: .medium, textColor: #colorLiteral(red: 0.6537410617, green: 0.6508514285, blue: 0.6713270545, alpha: 1), alignment: .left)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func setup() {
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
}
