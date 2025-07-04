import Foundation

struct Novel: Identifiable, Codable {
    var id: String
    var generating: Bool
    var title: String
    var outline: String
    var tags: [String]
    var trailerURL: URL?
    var coverURL: URL?

    static let placeholder = Novel(id: UUID().uuidString, generating: false, title: "", outline: "", tags: [], trailerURL: nil, coverURL: nil)
}

struct Chapter: Identifiable, Codable {
    var id: String
    var number: Int
    var novelID: String
    var coverURL: URL?
    var content: String
    var audioURL: URL?
    var likes: Int
    var neutrals: Int
    var dislikes: Int
    var previousID: String?
}
