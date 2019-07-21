import Foundation

// MARK: - EventElement
class EventElement: Codable {
    let id: Int
    let latitude, longitude: Double
    let title, eventDescription: String
    let photo: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case id, latitude, longitude, title
        case eventDescription = "description"
        case photo
    }
    
    init(id: Int, latitude: Double, longitude: Double, title: String, eventDescription: String, photo: [Photo]) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.title = title
        self.eventDescription = eventDescription
        self.photo = photo
    }
}

// MARK: - Photo
class Photo: Codable {
    let url: String
    
    init(url: String) {
        self.url = url
    }
}

typealias Event = [EventElement]
