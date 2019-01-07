//
//  Celda.swift
//  Aplicacion de Prueba
//
//  Created by Julian Avila Polanco on 1/5/19.
//  Copyright © 2019 Julian Avila Polanco. All rights reserved.
//

import UIKit

fileprivate let cellID = "cellId"


class CeldaContenedorPeliculas: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
    var coverPelicula = [#imageLiteral(resourceName: "Daredevil"),#imageLiteral(resourceName: "narcos-cover"),#imageLiteral(resourceName: "strangerThingsCover")]
    
    let labelCategoria: UILabel = {
        let label = UILabel()
        label.text = "CELDAS GENERO"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Arial-BoldMT", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coverPelicula.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CeldaPelicula
        cell.imagenPelicula.image = coverPelicula[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: frame.height - 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    
    fileprivate let collectionViewPeliculas: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
       let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        addSubview(collectionViewPeliculas)
        addSubview(labelCategoria)
        setupCollectionView()
        setupLabelCategoria()
    }
    
    fileprivate func setupLabelCategoria() {
        labelCategoria.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        labelCategoria.leftAnchor.constraint(equalTo: labelCategoria.superview!.leftAnchor, constant: 14).isActive = true
        labelCategoria.topAnchor.constraint(equalTo: labelCategoria.superview!.topAnchor, constant: 15).isActive = true
        labelCategoria.widthAnchor.constraint(equalToConstant: 300).isActive = true
        labelCategoria.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    fileprivate func setupCollectionView() {
        collectionViewPeliculas.register(CeldaPelicula.self, forCellWithReuseIdentifier: cellID)
        collectionViewPeliculas.dataSource = self
        collectionViewPeliculas.delegate = self
        collectionViewPeliculas.showsHorizontalScrollIndicator = false
        collectionViewPeliculas.topAnchor.constraint(equalTo: collectionViewPeliculas.superview!.topAnchor, constant: 40).isActive = true
        collectionViewPeliculas.bottomAnchor.constraint(equalTo: collectionViewPeliculas.superview!.bottomAnchor).isActive = true
        collectionViewPeliculas.trailingAnchor.constraint(equalTo: collectionViewPeliculas.superview!.trailingAnchor).isActive = true
        collectionViewPeliculas.leadingAnchor.constraint(equalTo: collectionViewPeliculas.superview!.leadingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

