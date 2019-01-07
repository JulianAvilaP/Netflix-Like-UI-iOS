//
//  File.swift
//  Aplicacion de Prueba
//
//  Created by Julian Avila Polanco on 1/6/19.
//  Copyright © 2019 Julian Avila Polanco. All rights reserved.
//
import UIKit

class CeldaPelicula: UICollectionViewCell {
    
    let imagenPelicula: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "strangerThingsCover.jpg"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        addSubview(imagenPelicula)
        imagenPelicula.topAnchor.constraint(equalTo: imagenPelicula.superview!.topAnchor).isActive = true
        imagenPelicula.bottomAnchor.constraint(equalTo: imagenPelicula.superview!.bottomAnchor).isActive = true
        imagenPelicula.trailingAnchor.constraint(equalTo: imagenPelicula.superview!.trailingAnchor).isActive = true
        imagenPelicula.leadingAnchor.constraint(equalTo: imagenPelicula.superview!.leadingAnchor).isActive = true
    }
    
    
}
