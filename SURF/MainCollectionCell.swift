//
//  MainCollectionCell.swift
//  SURF
//
//  Created by Artem on 08.02.2023.
//

import Foundation
import UIKit

//MARK: - MainCollectionCell
final class MainCollectionCell: UICollectionViewCell {
    
    static let reuseId = "Main"
    
    func configure(info: Item) {
        self.mainLabel.text = info.title
    }
    
    //MARK: - Label
    private let mainLabel = UILabel().createLabel(corner: 0, color: .white, size: 24, weight: .semibold, textColor: #colorLiteral(red: 0.2511924207, green: 0.2511924207, blue: 0.2511924207, alpha: 1), alignment: .left)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func setup() {
        addSubview(mainLabel)
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
}
