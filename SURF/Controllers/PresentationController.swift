//
//  PresentationController.swift
//  SURF
//
//  Created by Artem on 08.02.2023.
//

import Foundation
import UIKit

//MARK: -  PresentationController
final class PresentationController: UIViewController {
    
    //MARK: - CollectionView
    private var collectionView: UICollectionView! = nil
    
    //MARK: - Label
    private let wantComeToUs = UILabel().createLabel(corner: 0, color: .white, size: 14, weight: .medium, textColor:  #colorLiteral(red: 0.6537410617, green: 0.6508514285, blue: 0.6713270545, alpha: 1), alignment: .center)
    
    //MARK: - Button
    private let sendMessage = UIButton().createButton()
    
    //MARK: - Data
    private let data = Data.shared.pageList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sheetSetup()
        setConst()
        
   
        
    }
    
    //MARK: - Setup
    private func sheetSetup() {
        //MARK: - SheetPresenration
        sheetPresentationController.selectedDetentIdentifier = .medium
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.detents = [
            .custom(resolver: { context in
                return 320
            }),
            .custom(resolver: { context in
                return 500
            }),
            .large()]
    }
    
    //MARK: - SetConst
    private func setConst() {
        view.backgroundColor = .white
        
        view.addSubview(wantComeToUs)
        wantComeToUs.text = "Хочешь к нам?"
        
        view.addSubview(sendMessage)
        sendMessage.addTarget(self, action: #selector(send), for: .touchUpInside)
        
        //MARK: - Collection
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //MARK: - Registration cell
        collectionView.register(MainCollectionCell.self, forCellWithReuseIdentifier: MainCollectionCell.reuseId)
        collectionView.register(DescriptionCollectionCell.self, forCellWithReuseIdentifier: DescriptionCollectionCell.reuseId)
        collectionView.register(KindProfessionCollectionCell.self, forCellWithReuseIdentifier: KindProfessionCollectionCell.reuseId)
        collectionView.register(OtherDescriptionCollectionCell.self, forCellWithReuseIdentifier: OtherDescriptionCollectionCell.reuseId)
        collectionView.register(SupportFirstCollectionCell.self, forCellWithReuseIdentifier: SupportFirstCollectionCell.reuseId)
        collectionView.register(SupportSecondCollectionCell.self, forCellWithReuseIdentifier: SupportSecondCollectionCell.reuseId)
        
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            wantComeToUs.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            wantComeToUs.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            
            sendMessage.centerYAnchor.constraint(equalTo: wantComeToUs.centerYAnchor),
            sendMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sendMessage.widthAnchor.constraint(equalToConstant: 220),
            sendMessage.heightAnchor.constraint(equalToConstant: 60),
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: sendMessage.topAnchor, constant: -10),
        ])
    }
    
    //MARK: - CreateLayout
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] index, environment in
            guard let self = self else {return nil}
            let section = self.data[index]
            switch section {
            case .first(_):
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                return section
            case .second(_):
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                return section
            case .third(_):
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1/4), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                return section
            case .fourth(_):
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                return section
            case .fifth(_):
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .estimated(140), heightDimension: .absolute(70)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(400), heightDimension: .absolute(60)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
            case .sixth(_):
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(140), heightDimension: .absolute(60)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(400), heightDimension: .absolute(60)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
            }
        }
    }
    
    //MARK: - Alert Button
    @objc func send() {
        let alert = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Закрыть", style: .default)
        
        alert.addAction(ok)
        present(alert, animated: true)
    }
}

//MARK: - UISheetPresentationControllerDelegate
extension PresentationController: UISheetPresentationControllerDelegate  {

    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
}

//MARK: - UICollectionViewDelegate / UICollectionViewDataSource
extension PresentationController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch data[indexPath.section] {
        case .first(let item):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionCell.reuseId, for: indexPath) as! MainCollectionCell
            cell.configure(info: item[indexPath.row])
            return cell
        case .second(let item):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DescriptionCollectionCell.reuseId, for: indexPath) as! DescriptionCollectionCell
            cell.configure(info: item[indexPath.row])
            return cell
        case .third(let item):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KindProfessionCollectionCell.reuseId, for: indexPath) as! KindProfessionCollectionCell
            cell.configure(info: item[indexPath.row])
            return cell
        case .fourth(let item):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OtherDescriptionCollectionCell.reuseId, for: indexPath) as! OtherDescriptionCollectionCell
            cell.configure(info: item[indexPath.row])
            return cell
        case .fifth(let item):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SupportFirstCollectionCell.reuseId, for: indexPath) as?  SupportFirstCollectionCell else {return UICollectionViewCell()}
            cell.configure(info: item[indexPath.row])
            return cell
        case .sixth(let item):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SupportSecondCollectionCell.reuseId, for: indexPath) as! SupportSecondCollectionCell
            cell.configure(info: item[indexPath.row])
            return cell
        }
    }
}
