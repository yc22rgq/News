//
//  InMemoryCoreDataStack.swift
//  NewsTests
//
//  Created by Эдуард Кудянов on 4.05.25.
//

import CoreData

final class InMemoryCoreDataStack {
    static func makeContainer() -> NSPersistentContainer {
        let container = NSPersistentContainer(name: "NewsApp")
        let description = NSPersistentStoreDescription()
        description.url = URL(fileURLWithPath: "/dev/null") // no disk
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { _, error in
            if let error = error { fatalError("Failed to load: \(error)") }
        }
        return container
    }
}
