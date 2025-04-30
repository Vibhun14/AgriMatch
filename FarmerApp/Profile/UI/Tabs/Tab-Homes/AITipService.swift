//
//  AITipService.swift
//  FarmerApp
//
//  Created by vibhun naredla on 4/29/25.
//

import Foundation

struct AITip: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let relatedPlants: [String]
    let imagePrompt: String
}

class AITipService {
    private let apiKey = "YOUR_API_KEY_HERE"

    func fetchAITips(from acceptedPlants: [String], completion: @escaping ([AITip]) -> Void) {
        let prompt = """
        You're an expert in agriculture. Given the user's accepted plants: \(acceptedPlants.joined(separator: ", ")), generate 3 smart planting tips. Each tip should include:

        - title
        - description
        - relatedPlants (as a JSON array)
        - imagePrompt (1 sentence for image generation)

        Respond ONLY as a JSON array of objects with: id, title, description, relatedPlants, imagePrompt
        """

        let body: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [
                ["role": "user", "content": prompt]
            ]
        ]

        guard let url = URL(string: "https://api.openai.com/v1/chat/completions"),
              let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let choices = json["choices"] as? [[String: Any]],
                  let content = (choices.first?["message"] as? [String: Any])?["content"] as? String,
                  let contentData = content.data(using: .utf8),
                  let tips = try? JSONDecoder().decode([AITip].self, from: contentData)
            else {
                print("Failed to decode OpenAI response: \(error?.localizedDescription ?? "unknown error")")
                return
            }

            DispatchQueue.main.async {
                completion(tips)
            }
        }.resume()
    }
}
