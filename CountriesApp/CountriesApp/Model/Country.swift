import Foundation

struct Country: Codable{
    let name: Name
    
}
struct Name: Codable{
    let common: String?
    let official: String?
}
