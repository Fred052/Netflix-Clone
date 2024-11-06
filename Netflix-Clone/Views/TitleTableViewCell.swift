//
//  TitleTableViewCell.swift
//  Netflix-Clone
//
//  Created by Ferid Suleymanzade on 06.11.24.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"
    
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titlesPosterUiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterUiImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let titlesPosterUiImageViewConstraints = [
            titlesPosterUiImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titlesPosterUiImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterUiImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            titlesPosterUiImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlesPosterUiImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        
        NSLayoutConstraint.activate(titlesPosterUiImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    
    public func configure(with model: TitleViewModel) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterUrl)") else {
            return
        }
        
        titlesPosterUiImageView.sd_setImage(with: url, completed: nil )
        titleLabel.text = model.titleName
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
