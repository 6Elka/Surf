//
//  Extension + UIButton.swift
//  SURF
//
//  Created by Artem on 09.02.2023.
//

import Foundation
import UIKit

extension UIButton {
    func createButton() -> UIButton {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.2511924207, green: 0.2511924207, blue: 0.2511924207, alpha: 1)
        btn.setTitle("Отправить заявку", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        btn.layer.cornerRadius = 30
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }
}
