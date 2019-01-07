//
//  HeaderView.swift
//  Aplicacion de Prueba
//
//  Created by Julian Avila Polanco on 1/5/19.
//  Copyright © 2019 Julian Avila Polanco. All rights reserved.
//

import UIKit

let cellIDHeader = "cellIDheader"

class HeaderView: UICollectionReusableView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var coverImages: [UIImage] = [#imageLiteral(resourceName: "lucifer"),#imageLiteral(resourceName: "stranger-things-poster2")]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionViewHeader.dequeueReusableCell(withReuseIdentifier: cellIDHeader, for: indexPath) as! CeldaCover
        celda.imageViewPeliculaCover.image = coverImages[indexPath.item]
        return celda
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: frame.width, height: frame.height - 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    let collectionViewHeader: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionViewHeader.register(CeldaCover.self, forCellWithReuseIdentifier: cellIDHeader)
        collectionViewHeader.delegate = self
        collectionViewHeader.dataSource = self
        setupCollectionView()
    }
    
    override func willTransition(from oldLayout: UICollectionViewLayout, to newLayout: UICollectionViewLayout) {
       super.willTransition(from: oldLayout, to: newLayout)
        newLayout.invalidateLayout()
        oldLayout.invalidateLayout()
    }
    
    fileprivate func setupCollectionView() {
        addSubview(collectionViewHeader)
        collectionViewHeader.showsHorizontalScrollIndicator = false
        collectionViewHeader.topAnchor.constraint(equalTo: collectionViewHeader.superview!.topAnchor).isActive = true
        collectionViewHeader.trailingAnchor.constraint(equalTo: collectionViewHeader.superview!.trailingAnchor).isActive = true
        collectionViewHeader.leadingAnchor.constraint(equalTo: collectionViewHeader.superview!.leadingAnchor).isActive = true
        collectionViewHeader.bottomAnchor.constraint(equalTo: collectionViewHeader.superview!.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class CeldaCover: UICollectionViewCell {
    
    fileprivate let imageViewPeliculaCover: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "stranger-things-poster2"))
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageViewPeliculaCover)
        setupImageView()
    }
    
    func setupImageView() {
        imageViewPeliculaCover.centerXAnchor.constraint(equalTo: imageViewPeliculaCover.superview!.centerXAnchor).isActive = true
        imageViewPeliculaCover.centerYAnchor.constraint(equalTo: imageViewPeliculaCover.superview!.centerYAnchor).isActive = true
        imageViewPeliculaCover.widthAnchor.constraint(equalTo: imageViewPeliculaCover.superview!.widthAnchor).isActive = true
        imageViewPeliculaCover.heightAnchor.constraint(equalTo: imageViewPeliculaCover.superview!.heightAnchor).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
