//
//  HomeViewController.swift
//  Netflix-Clone
//
//  Created by Ferid Suleymanzade on 27.10.24.
//

import UIKit

// Ana ekranı temsil eden HomeViewController sınıfı
class HomeViewController: UIViewController {
    
    // UITableView nesnesi
    private let homeFeedTable: UITableView = {
        // UITableView oluşturma
        let table = UITableView(frame: .zero, style: .grouped)
        // Hücrelerin kaydedilmesi, bu hücre "cell" kimliğiyle yeniden kullanılacak
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table // UITableView döndür
    }()

    // Görünüm yüklendiğinde çağrılan metod
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Arka plan rengini sistem arka plan rengine ayarla
        view.backgroundColor = .systemBackground
        // homeFeedTable'ı ana görünüme ekle
        view.addSubview(homeFeedTable)
        
        // UITableView delegate ve data source olarak kendisini ayarla
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
    }
    
    // Görünüm alt görünümleri düzenlendiğinde çağrılan metod
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // homeFeedTable'ı ana görünümün boyutlarına ayarla
        homeFeedTable.frame = view.bounds
    }
}

// HomeViewController'ı UITableViewDelegate ve UITableViewDataSource protokollerini uygulamak için genişlet
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // UITableView'daki bölümlerin sayısını belirleyen metod
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20 // Toplam 20 bölüm döndür
    }

    // Hücre sayısını belirleyen metod
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // Örnek olarak her bölümde 1 hücre döndür
    }

    
    // Her hücre için içerik sağla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    // UITableView'da her hücrenin yüksekliğini belirleyen metod
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    // UITableView'da her bölümün başlık yüksekliğini belirleyen metod
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

}
