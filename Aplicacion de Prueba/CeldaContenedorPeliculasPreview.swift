//
//  CeldaContenedorPeliculasCircular.swift
//  Aplicacion de Prueba
//
//  Created by Julian Avila Polanco on 1/6/19.
//  Copyright © 2019 Julian Avila Polanco. All rights reserved.
//
fileprivate let cellId = "cellID"

import UIKit



class CeldaContenedorPeliculasPreview: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    var coverPeliculasCirculares = [#imageLiteral(resourceName: "Daredevil"),#imageLiteral(resourceName: "narcos-cover"),#imageLiteral(resourceName: "strangerThingsCover"),#imageLiteral(resourceName: "stranger-things-poster2")]
    
    let labelPreviews: UILabel = {
        let label = UILabel()
        label.text = "Previews"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Arial-BoldMT", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame:.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        return cv
    }()

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coverPeliculasCirculares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PeliculasCircularesCell
        cell.imageViewPeliculas.image = coverPeliculasCirculares[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: frame.height - 25, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        addSubview(collectionView)
        addSubview(labelPreviews)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PeliculasCircularesCell.self, forCellWithReuseIdentifier: cellId)
        backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        setupCollectionView()
        setupLabelPreviews()
    }
    
    fileprivate func setupLabelPreviews() {
        //labelPreviews.backgroundColor = UIColor(red: 33/255, green: 30/255, blue: 30/255, alpha: 1)
        labelPreviews.backgroundColor = .clear
        labelPreviews.leftAnchor.constraint(equalTo: labelPreviews.superview!.leftAnchor, constant: 20).isActive = true
        labelPreviews.topAnchor.constraint(equalTo: labelPreviews.superview!.topAnchor).isActive = true
        labelPreviews.widthAnchor.constraint(equalToConstant: 300).isActive = true
        labelPreviews.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupCollectionView() {
        collectionView.topAnchor.constraint(equalTo: collectionView.superview!.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: collectionView.superview!.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: collectionView.superview!.trailingAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: collectionView.superview!.leadingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("CTMWEON")
    }
    
}

class PeliculasCircularesCell: UICollectionViewCell {
    
    let imageViewPeliculas: UIImageView = {

        let iv = UIImageView(image: #imageLiteral(resourceName: "Daredevil"))
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        return iv

    }()
    
    let imageViewTituloPeliculas: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .clear
        return iv
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageViewPeliculas)
        setupImageViewPeliculas()
        backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    }
    
    fileprivate func setupImageViewPeliculas() {
        imageViewPeliculas.centerXAnchor.constraint(equalTo: imageViewPeliculas.superview!.centerXAnchor).isActive = true
        imageViewPeliculas.widthAnchor.constraint(equalTo: imageViewPeliculas.superview!.widthAnchor).isActive = true
        imageViewPeliculas.heightAnchor.constraint(equalTo: imageViewPeliculas.superview!.heightAnchor, constant: -25).isActive = true
        imageViewPeliculas.bottomAnchor.constraint(equalTo: imageViewPeliculas.superview!.bottomAnchor).isActive = true
        imageViewPeliculas.layer.cornerRadius = (frame.height - 25)/2
        
        addSubview(imageViewTituloPeliculas)
        imageViewTituloPeliculas.centerXAnchor.constraint(equalTo: imageViewPeliculas.centerXAnchor).isActive = true
        imageViewTituloPeliculas.bottomAnchor.constraint(equalTo: imageViewPeliculas.bottomAnchor).isActive = true
        imageViewTituloPeliculas.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/4).isActive = true
        imageViewTituloPeliculas.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("CTMWEON")
    }
    
    
    
    
}
