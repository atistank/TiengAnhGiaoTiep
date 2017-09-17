

import Foundation


class Episode
{
    var title: String?
    var description: String?
    var thumbnailURL: URL?
    var createdAt: String?
    var author: String?
    var url: URL?
    
    init(title: String, description: String, thumbnailURL: URL, createdAt: String, author: String)
    {
        self.title = title
        self.description = description
        self.thumbnailURL = thumbnailURL
        self.createdAt = createdAt
        self.author = author
    }
    
    typealias EpisodeDictionary = [String : AnyObject]
    
    init(espDictionary: EpisodeDictionary)
    {
        self.title = espDictionary["title"] as? String
        self.description = espDictionary["description"] as? String
        self.thumbnailURL = URL(string: espDictionary["thumbnailURL"] as! String)
        self.createdAt = espDictionary["pubDate"] as? String
        self.author = espDictionary["author"] as? String
        self.url = URL(string: espDictionary["link"] as! String)
    }
    
    static func downloadAllEpisodes() -> [Episode]
    {
        var episodes = [Episode]()
        
        let jsonFile = Bundle.main.path(forResource: "AnhDuy", ofType: "json")
        let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFile!))
        if let jsonDictionary = NetworkService.parseJSONFromData(jsonData) {
            let espDictionaries = jsonDictionary["episodes"] as! [EpisodeDictionary]
            for dict in espDictionaries {
                let episode = Episode(espDictionary: dict)
                episodes.append(episode)
            }
        }
        
        return episodes
    }
}





















