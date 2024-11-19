//
//  Article.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/18/24.
//

import Contentful

final class Article: EntryDecodable, FieldKeysQueryable {
    
    static let contentTypeId: String = "article"
    
    // FlatResource members
    let id: String
    let localeCode: String?
    let updatedAt: Date?
    let createdAt: Date?
    
    let title: String?
    let content: RichTextDocument? // figure out type
    let categories: [String]?
    
    var backgroundImage: Asset?
    
    public required init(from decoder: Decoder) throws {
        let sys = try decoder.sys()
        
        id = sys.id
        localeCode = sys.locale
        updatedAt = sys.updatedAt
        createdAt = sys.createdAt
        
        let fields = try decoder.contentfulFieldsContainer(keyedBy: Article.FieldKeys.self)
        
        self.title = try fields.decodeIfPresent(String.self, forKey: .title)
        self.content = try fields.decodeIfPresent(RichTextDocument.self, forKey: .content)
        self.categories = try fields.decodeIfPresent(Array<String>.self, forKey: .categories)
        
        try fields.resolveLink(forKey: .backgroundImage, decoder: decoder) { [weak self] backgroundImage in
            self?.backgroundImage = backgroundImage as? Asset
        }
    }
    
    enum FieldKeys: String, CodingKey {
        case backgroundImage
        case title, content, categories
    }
}
