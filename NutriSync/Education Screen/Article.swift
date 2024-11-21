//
//  Article.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/18/24.
//

import Contentful

final class Article: Resource, EntryDecodable, FieldKeysQueryable {
    let sys: Sys
    
    
    static let contentTypeId: String = "article"
    static let categoryOrder: [String: Int] = [
        "Featured": 0,
        "Sad": 1,
        "Angry": 2
    ]
    
    let title: String?
    let content: RichTextDocument? // figure out type
    let categories: [String]?
    
    var thumbnail: Asset?
    
    public required init(from decoder: Decoder) throws {
        sys = try decoder.sys()
        
        let fields = try decoder.contentfulFieldsContainer(keyedBy: FieldKeys.self)
        
        self.title = try fields.decodeIfPresent(String.self, forKey: .title)
        self.content = try fields.decodeIfPresent(RichTextDocument.self, forKey: .content)
        self.categories = try fields.decodeIfPresent(Array<String>.self, forKey: .categories)
        
        try fields.resolveLink(forKey: .thumbnail, decoder: decoder) { [weak self] thumbnail in
            self?.thumbnail = thumbnail as? Asset
        }
    }
    
    enum FieldKeys: String, CodingKey {
        case thumbnail
        case title, content, categories
    }
}
