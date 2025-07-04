import Foundation

class NovelService {
    static let shared = NovelService()
    private init() {}

    let baseURL = URL(string: "https://api.example.com")!

    func fetchNovels(category: NovelCategory) async -> [Novel] {
        let url = baseURL.appendingPathComponent("novels").appending(queryItems: [URLQueryItem(name: "category", value: category.rawValue)])
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode([Novel].self, from: data)
        } catch {
            print("Failed to load novels", error)
            return []
        }
    }

    func createNovel(title: String, idea: String, category: NovelCategory, themes: [String], roles: [String], plots: [String]) async -> Novel? {
        let url = baseURL.appendingPathComponent("novels")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let body: [String: Any] = [
            "title": title,
            "idea": idea,
            "category": category.rawValue,
            "themes": themes,
            "roles": roles,
            "plots": plots
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(Novel.self, from: data)
        } catch {
            print("Failed to create novel", error)
            return nil
        }
    }

    func fetchChapter(novelID: String, chapterID: String) async -> Chapter? {
        let url = baseURL.appendingPathComponent("novels/\(novelID)/chapters/\(chapterID)")
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(Chapter.self, from: data)
        } catch {
            print("Failed to load chapter", error)
            return nil
        }
    }

    func requestNextChapter(novelID: String, opinion: String?) async -> Chapter? {
        let url = baseURL.appendingPathComponent("novels/\(novelID)/chapters")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let body = ["opinion": opinion ?? ""]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(Chapter.self, from: data)
        } catch {
            print("Failed to generate next chapter", error)
            return nil
        }
    }
}

private extension URL {
    func appending(queryItems: [URLQueryItem]) -> URL {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else { return self }
        components.queryItems = queryItems
        return components.url ?? self
    }
}
