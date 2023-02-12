//
//  Extension + UIImageView.swift
//  SURF
//
//  Created by Artem on 09.02.2023.
//

import Foundation
import UIKit

extension UIImageView {
    func createImage() -> UIImageView {
        let img = UIImageView()
        img.image = UIImage(named: "background")
        img.contentMode = .scaleAspectFill
        return img
    }
}
