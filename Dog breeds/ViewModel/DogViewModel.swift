//
//  DogViewModel.swift
//  Dog breeds
//
//  Created by Lucas da Silva Reis on 11/03/23.
//

import Foundation

//class DogViewModel {
//    var dogs: [Dog]?
//
//    var tableView: UITableView?
//
//    let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBmcGp5cW9ra2xqYnNoZWtpcWdmIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzg1ODEwMTUsImV4cCI6MTk5NDE1NzAxNX0.kVytniABF4oEZFaGzzHKts8wq4zpaMj8Nc3fWSC1Rdc"
//
//    // MARK: Services
//    func getDogs() {
//        guard let url = URL(string: "https://pfpjyqokkljbshekiqgf.supabase.co/rest/v1/dogs") else {return}
//
//        var request = URLRequest(url: url)
//        request.setValue("\(accessToken)", forHTTPHeaderField: "apikey")
//
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let response = response as? HTTPURLResponse {
//                print("Status Code: ", response.statusCode)
//            }
//            guard let data = data else {return}
//
//            do {
//                let dogs = try JSONDecoder().decode([Dog].self, from: data)
//                self.dogs = dogs
//                DispatchQueue.main.async {
//                    self.tableView?.reloadData()
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//
//            //let stringData = String(data: data, encoding: .utf8)
//            //print(stringData)
//        }.resume()
//
//    }
//}

class DogViewModel {
    
    var delegate: DogViewModelDelegate?
    
    let url = URL(string: "https://pfpjyqokkljbshekiqgf.supabase.co/rest/v1/dogs")!
    let apiService = APIService<[Dog]>()
    
    func getDogs() {
        apiService.request(url: url) { result in
            switch result {
            case .success(let dogs):
                print("Dogs: \(dogs)")
                self.delegate?.didFetchDogs(dogs: dogs)
            case .failure(let error):
                print("Erro: \(error.localizedDescription)")
            }
        }
    }
}

protocol DogViewModelDelegate {
    func didFetchDogs(dogs: [Dog])
}
