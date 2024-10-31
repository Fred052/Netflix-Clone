//
//  TitleCollectionViewCell.swift
//  Netflix-Clone
//
//  Created by Ferid Suleymanzade on 31.10.24.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    
    // Film afişlerini göstermek için kullanılan UIImageView nesnesi
    private let posterImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill // Görüntünün kenarlara kırpılmadan doldurulması
        return imageView
    }()
    
    // Başlatıcı (initializer) fonksiyonu
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView) // Afiş görüntüsünü hücreye ekleme
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // Alt görünümleri düzenleyen fonksiyon
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds // Afiş görüntüsünün hücre sınırlarına yayılması
    }
    
    // Hücreyi modelle yapılandırmak için fonksiyon
    public func  configure(with model: String) {
       
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
            return
        }
        
        // URL'den resim indirip posterImageView'da gösterme
        posterImageView.sd_setImage(with: url, completed: nil)
    }
    
}
