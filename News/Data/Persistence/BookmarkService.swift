//
//  BookmarkService.swift
//  News
//
//  Created by Эдуард Кудянов on 28.04.25.
//

import CoreData
import UIKit

final class BookmarkService {
    
    private let context = CoreDataManager.shared.context
    
    func save(news: News) {
        let bookmark = BookmarkEntity(context: context)
        bookmark.title = news.title
        bookmark.content = news.content ?? ""
        bookmark.url = news.url
        bookmark.urlToImage = news.urlToImage
        bookmark.author = news.author
        bookmark.publishedAt = news.publishedAt
        bookmark.sourceName = news.sourceName
        
        CoreDataManager.shared.saveContext()
    }
    
    func fetchBookmarks() -> [News] {
        let request: NSFetchRequest<BookmarkEntity> = BookmarkEntity.fetchRequest()
        
        do {
            let bookmarks = try context.fetch(request)
            return bookmarks.map { entity in
                News(
                    title: entity.title ?? "",
                    description: entity.content ?? "",
                    content: entity.content,
                    author: entity.author,
                    publishedAt: entity.publishedAt ?? Date(),
                    url: entity.url ?? "",
                    urlToImage: entity.urlToImage,
                    sourceName: entity.sourceName ?? ""
                )
            }
        } catch {
            print("Failed to fetch bookmarks: \(error)")
            return []
        }
    }
    
    func delete(news: News) {
        let request: NSFetchRequest<BookmarkEntity> = BookmarkEntity.fetchRequest()
        request.predicate = NSPredicate(format: "url == %@", news.url)
        
        do {
            let bookmarks = try context.fetch(request)
            for bookmark in bookmarks {
                context.delete(bookmark)
            }
            CoreDataManager.shared.saveContext()
        } catch {
            print("Failed to delete bookmark: \(error)")
        }
    }
    
    func isBookmarked(news: News) -> Bool {
        let request: NSFetchRequest<BookmarkEntity> = BookmarkEntity.fetchRequest()
        request.predicate = NSPredicate(format: "url == %@", news.url)
        
        do {
            let count = try context.count(for: request)
            return count > 0
        } catch {
            return false
        }
    }
}
