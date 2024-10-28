//
//  CollectionViewTableViewCell.swift
//  Netflix-Clone
//
//  Created by Ferid Suleymanzade on 28.10.24.
//

import UIKit

// UITableViewCell'den türetilen özel hücre sınıfı
class CollectionViewTableViewCell: UITableViewCell {

    // Hücre için bir tanımlayıcı (identifier) belirliyoruz
    static let identifier = "CollectionViewTableViewCell"
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionVeiw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionVeiw.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionVeiw
    }()
    
    
    
    
    // Başlatıcı metod
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier) // Üst sınıfın başlatıcısını çağır
        contentView.backgroundColor = .systemPink // Hücrenin arka plan rengini pembe yap
        contentView.addSubview(collectionView) // collectionView'i contentView'e ekle
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // Kod ile başlatıldığında kullanılacak gereksiz başlatıcı
    required init?(coder: NSCoder) {
        fatalError() // Eğer storyboard veya xib ile başlatılmaya çalışılırsa hata ver
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds // collectionView'in boyutunu contentView'in boyutuyla eşleştir
    }
}


extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    
    
}
