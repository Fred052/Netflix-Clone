//
//  APICaller.swift
//  Netflix-Clone
//
//  Created by Ferid Suleymanzade on 30.10.24.
//

import Foundation


// 1. Sabitler tanımlanıyor
struct Constants {
    static let API_KEY = "7c8677591239863f4e667a978ec735cf" // API anahtarı
    static let baseURL = "https://api.themoviedb.org" // API'nin temel URL'i
}

// 2. Hata durumları için özel bir enum tanımlanıyor
enum APIError: Error {
    case failedToGetData // API çağrısında veri alınamazsa döndürülecek hata
}

// 3. APICaller sınıfı Singleton olarak oluşturuluyor
class APICaller {
    static let shared = APICaller() // Tek örneklik tasarım deseni (Singleton)

    // 4. getTrendingMovies fonksiyonu API çağrısı yapar
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return} // URL oluşturuluyor

        // 5. URLSession kullanılarak veri görevi başlatılıyor
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return } // Veri kontrol ediliyor
            
            do {
                // 6. Gelen JSON verisi TrendMoviesResponse modeline dönüştürülüyor
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results)) // Başarılı durumda completion çağırılıyor
            } catch {
                completion(.failure(APIError.failedToGetData)) // Hata durumunda completion çağırılıyor
            }
        }
        task.resume() // 7. Görev başlatılıyor
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil  else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
            }
            catch {
                completion(.failure(APIError.failedToGetData)) // Hata durumunda completion çağırılıyor
            }
        }
        
        task.resume()
    }
    
    func upComingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results  = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
            } catch {
                completion(.failure(APIError.failedToGetData)) // Hata durumunda completion çağırılıyor
            }
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
            } catch {
                completion(.failure(APIError.failedToGetData)) // Hata durumunda completion çağırılıyor
            }
        }
        
        task.resume()

    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
            } catch {
                completion(.failure(APIError.failedToGetData)) // Hata durumunda completion çağırılıyor
            }
        }
        task.resume()
    }
    
    
    
}
