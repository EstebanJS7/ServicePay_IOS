//
//  ViewController.swift
//  ServicePay_IOS
//
//  Created by Esteban Jiménez on 2023-08-25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var newArray: [[[String: String]]] = []
    
    var dataList1: [[String: String]] = []
    var dataList2: [[String: String]] = []
    var dataList3: [[String: String]] = []
    
    private let myCellWidth = UIScreen.main.bounds.width / 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addElement(img: "tigo_png", nombre: "Tigo", to: &dataList1)
        addElement(img: "claro_png", nombre: "Claro", to: &dataList1)
        addElement(img: "tigo_png", nombre: "Tigo", to: &dataList1)
        addElement(img: "claro_png", nombre: "Claro", to: &dataList1)
        addElement(img: "ic_copaco", nombre: "Copaco", to: &dataList3)
        addElement(img: "essap_png", nombre: "Essap", to: &dataList3)
        addElement(img: "ic_copaco", nombre: "Copaco", to: &dataList3)
        addElement(img: "essap_png", nombre: "Essap", to: &dataList3)
        addElement(img: "ic_copaco", nombre: "Copaco", to: &dataList3)
        addElement(img: "essap_png", nombre: "Essap", to: &dataList3)
        addElement(img: "ic_copaco", nombre: "Copaco", to: &dataList3)
        addElement(img: "essap_png", nombre: "Essap", to: &dataList3)
        addElement(img: "ic_medilife", nombre: "Medilife", to: &dataList2)
        addElement(img: "ic_sancor", nombre: "Sancor", to: &dataList2)
        addElement(img: "ic_medilife", nombre: "Medilife", to: &dataList2)
        addElement(img: "ic_sancor", nombre: "Sancor", to: &dataList2)

        
        newArray.append(dataList1)
        newArray.append(dataList2)
        newArray.append(dataList3)

        
        collectionView.dataSource  = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
    }
    
    func addElement(img: String, nombre: String, to dataList: inout [[String: String]]) {
        let newElement: [String: String] = ["img": img, "nombre": nombre]
        dataList.append(newElement)
    }
}

extension ViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return newArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newArray[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? CardCollectionViewCell
        let data = newArray[indexPath.section][indexPath.item]
               if let imageName = data["img"], let nombre = data["nombre"] {
                   cell!.imgMarca.image = UIImage(named: imageName)
                   cell!.titleMarca.text = nombre
               }
               
               return cell!
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: myCellWidth, height: myCellWidth)
    }
}
