//
//  ViewController.swift
//  SURF
//
//  Created by Artem on 07.02.2023.
//

import UIKit

//MARK: - ViewController
final class ViewController: UIViewController {
  
    //MARK: - ImageView
    private let imageView = UIImageView().createImage()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        present(PresentationController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //MARK: - Image
        view.addSubview(imageView)
        imageView.frame = view.bounds
        
    }
}
