    //
    //  HomeViewController.swift
    //  Netflix-Clone
    //
    //  Created by Ferid Suleymanzade on 27.10.24.
    //

    import UIKit



enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Populer = 2
    case Upcoming = 3
    case TopRated = 4
}

    // Ana ekranı temsil eden HomeViewController sınıfı
    class HomeViewController: UIViewController {
        
        
        // Her bölüm için başlıkları içeren dizi
        let sectionTitles: [String] = ["Trending Movies", "Trending TV", "Popular", "Upcoming Movies", "Top Rated"]

        
        // Ana ekran içeriğini gösterecek UITableView nesnesi
        private let homeFeedTable: UITableView = {
            // .grouped tarzında bir UITableView oluşturuluyor
            let table = UITableView(frame: .zero, style: .grouped)
            // Özel hücre sınıfı olan CollectionViewTableViewCell'i kaydetme
            table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
            return table // TableView döndür
        }()

        // Görünüm yüklendiğinde çağrılan metod
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Arka plan rengini sistem arka plan rengine ayarlama
            view.backgroundColor = .systemBackground
            // homeFeedTable'ı ana görünüme ekleme
            view.addSubview(homeFeedTable)
            
            // UITableView delegate ve data source'u ayarlama
            homeFeedTable.delegate = self
            homeFeedTable.dataSource = self
            
            // Navigation bar yapılandırmasını çağırma
            configureNavbar()
            
            // HeroHeaderUIView ekleyerek tableView için başlık görünümü ayarlama
            let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
            homeFeedTable.tableHeaderView = headerView
           
            
            
        }
        
        // Navigation bar özelleştirmesi
        private func configureNavbar() {
            // Netflix logosunu orijinal renkleriyle navigation item olarak ekleme
            var image = UIImage(named: "NetflixLogo")
            image = image?.withRenderingMode(.alwaysOriginal)
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
            
            // Sağda kişisel profil ve oynat butonları ekleme
            navigationItem.rightBarButtonItems = [
                UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
                UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
            ]
            
            // Navigation bar rengini beyaz olarak ayarlama
            navigationController?.navigationBar.tintColor = .white
        }
        
        // Alt görünümler düzenlendiğinde çağrılan metod
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            // homeFeedTable'ı ana görünümün boyutlarına ayarlama
            homeFeedTable.frame = view.bounds
        }
     
        
    }

    // UITableViewDelegate ve UITableViewDataSource protokollerini uygulama
    extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
        
        // UITableView'da 20 bölüm döndüren metod
        func numberOfSections(in tableView: UITableView) -> Int {
            return sectionTitles.count
        }

        // Her bölümde 1 hücre döndüren metod
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        // Hücreleri yapılandıran metod
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
                return UITableViewCell()
            }
            
            // APICaller üzerinden  verilerin çağırılmasi
            switch indexPath.section {
            case Sections.TrendingMovies.rawValue:
                
                APICaller.shared.getTrendingMovies { result in
                    switch result {
                    case .success(let titles):
                        cell.configure(with: titles)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
                
            case Sections.TrendingTv.rawValue:
                
                APICaller.shared.getTrendingTvs { result in
                    switch result {
                    case .success(let titles):
                        cell.configure(with: titles)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            case Sections.Populer.rawValue:
                
                APICaller.shared.getPopular { result in
                    switch result {
                    case .success(let titles):
                        cell.configure(with: titles)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            case Sections.Upcoming.rawValue:
                
                APICaller.shared.upComingMovies { result in
                    switch result {
                    case .success(let titles):
                        cell.configure(with: titles)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            case Sections.TopRated.rawValue:
                
                APICaller.shared.getTopRated { result in
                    switch result {
                    case .success(let titles):
                        cell.configure(with: titles)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            default:
                return UITableViewCell()
            }
            
            return cell
        }
        
        // Her hücrenin yüksekliğini 200 olarak ayarlayan metod
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }

        // Her bölüm başlığının yüksekliğini 40 olarak ayarlayan metod
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
        }
        
        
        func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            // Başlık görünümünü UITableViewHeaderFooterView tipine dönüştürüyoruz
            guard let header = view as? UITableViewHeaderFooterView else { return }

            // Yazı tipini ve kalınlığını ayarlıyoruz
            header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
            
            // Başlık metninin çerçevesini sola 20 piksel boşluk bırakarak ayarlıyoruz
            header.textLabel?.frame = CGRect(
                x: header.bounds.origin.x + 20,
                y: header.bounds.origin.y,
                width: 100,
                height: header.bounds.height
          )
            
            // Başlık yazı rengini beyaz olarak ayarlıyoruz
            header.textLabel?.textColor = .white
            
            // Başlığı küçük harfe çeviriyoruz
            header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
        }

        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            // sectionTitles dizisinden her bölüm için uygun başlığı döndürüyoruz
            return sectionTitles[section]
        }

        
        // Scroll yapıldığında navigation bar’ın görünürlüğünü değiştiren metod
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let defaultOffSet = view.safeAreaInsets.top
            let offSet = scrollView.contentOffset.y + defaultOffSet
            // Navigation bar'ı yukarı kaydırarak gizler veya gösterir
            navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offSet))
        }
        
    }
