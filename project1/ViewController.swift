//
//  ViewController.swift
//  project1
//
//  Created by EnesÖzcan on 18.02.2024.
//

import UIKit

class MyCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Collection view için özel bir hücre sınıfı kaydetmek
        self.collectionView!.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        // Collection view'in düzenini ayarlamak
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    // Collection view'deki hücre sayısını döndüren yöntem
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    // Collection view'deki her hücreyi oluşturan yöntem
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
        cell.textLabel.text = "Item \(indexPath.item)"
        return cell
    }
    
    // Collection view'deki hücre boyutunu ayarlayan yöntem (UICollectionViewDelegateFlowLayout protokolünü uygulamalısınız)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

// Özel bir hücre sınıfı oluşturmak
class MyCollectionViewCell: UICollectionViewCell {
    var textLabel: UILabel
    
    override init(frame: CGRect) {
        self.textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        super.init(frame: frame)
        contentView.addSubview(textLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
