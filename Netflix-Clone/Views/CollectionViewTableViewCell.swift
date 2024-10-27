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
    
    // Başlatıcı metod
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier) // Üst sınıfın başlatıcısını çağır
        contentView.backgroundColor = .systemPink // Hücrenin arka plan rengini pembe yap
    }
    
    // Kod ile başlatıldığında kullanılacak gereksiz başlatıcı
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // Eğer storyboard veya xib ile başlatılmaya çalışılırsa hata ver
    }
}
