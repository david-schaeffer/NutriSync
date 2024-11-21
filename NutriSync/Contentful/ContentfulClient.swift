//
//  ContentfulClient.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/19/24.
//

import Contentful

final class ContentfulClient {
    private let client: Client
    
    init() {
        guard let contentfulSpaceId = Bundle.main.infoDictionary?["CONTENTFUL_SPACE_ID"] as? String else {
            fatalError("Missing CONTENTFUL_SPACE_ID in Info.plist")
        }
        guard let contentfulAccessToken = Bundle.main.infoDictionary?["CONTENTFUL_ACCESS_TOKEN"] as? String else {
            fatalError("Missing CONTENTFUL_ACCESS_TOKEN in Info.plist")
        }
        
        client = Client(spaceId: contentfulSpaceId,
                        accessToken: contentfulAccessToken,
                        contentTypeClasses: [Article.self])
    }
    
    func fetchArticles(completion: @escaping (Result<HomogeneousArrayResponse<Article>, Error>) -> Void) {
        self.client.fetchArray(of: Article.self, then: completion)
    }
    
    func fetchArticle(withId id: String, completion: @escaping (Result<Article, Error>) -> Void) {
        self.client.fetch(Article.self, id: id, then: completion)
    }
}
