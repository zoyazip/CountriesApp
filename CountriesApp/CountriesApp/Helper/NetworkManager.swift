//
//  NetworkManager.swift
//  CountriesApp
//
//  Created by d.chernov on 14/05/2023.
//

import Foundation

class NetworkManager{
    static func fetchData(completition: @escaping ([Country]) -> () ){
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request) { (data, response, error) in
            guard error == nil else{
                print("Error+++", error!)
                return
            }
            
            print("Response", response as Any)
            
            guard let data = data else {return}
            do{
                let jsonData = try JSONDecoder().decode([Country].self, from: data)
                completition(jsonData)
            }
            catch{
                print("Error+++ ", error)
            }
            
        }.resume()
    }
}
