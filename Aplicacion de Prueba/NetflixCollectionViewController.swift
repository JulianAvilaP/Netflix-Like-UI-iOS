//
//  CollectionViewController.swift
//  Aplicacion de Prueba
//
//  Created by Julian Avila Polanco on 1/5/19.
//  Copyright © 2019 Julian Avila Polanco. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let headerId = "HeaderID"
private let celdaCircularId = "circularId"

class NetflixCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let categorias = ["Terror","Suspenso","Comedia","Romance"]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        collectionView.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        title = "Netflix layout"
        collectionView.showsVerticalScrollIndicator = false
        self.collectionView!.register(CeldaContenedorPeliculas.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        self.collectionView.register(CeldaContenedorPeliculasPreview.self, forCellWithReuseIdentifier: celdaCircularId)

    }

    // MARK: Header
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
       let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

       return CGSize(width: view.frame.width, height: 200)
    }
    
    // MARK: Data Source
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorias.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: celdaCircularId, for: indexPath) as! CeldaContenedorPeliculasPreview
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CeldaContenedorPeliculas
            cell.labelCategoria.text = "\(categorias[indexPath.item])"
            
            return cell
        }
        
        
        
    }
    
    //MARK: CollectionViewFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (indexPath.item == 0){
            return .init(width: view.frame.width, height: 140)
        }
        return .init(width: view.frame.width, height: 210)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}
