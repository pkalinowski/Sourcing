//
//  AnyDataProvider.swift
//  Sourcing
//
//  Created by Lukas Schmidt on 02.01.17.
//  Copyright © 2017 Lukas Schmidt. All rights reserved.
//

import Foundation

final public class DataProvider<Object>: DataProviding {
    
    private let objectAtIndexPath: (_ atIndexPath: IndexPath) -> Object
    private let numberOfItems: (_ inSextion: Int) -> Int
    private let numberOfSectionsCallback: () -> Int
    private let prefetchItemsAtIndexPaths: ([IndexPath]) -> Void
    private let cancelPrefetchingForItemsAtIndexPaths: ([IndexPath]) -> Void
    private let moveItemAtIndexPath: (_ sourceIndexPath: IndexPath, _ destinationIndexPath: IndexPath) -> Void
    
    public let sectionIndexTitles: Array<String>?
    
    init<DataProvider: DataProviding>(dataProvider: DataProvider) where Object == DataProvider.Object {
        objectAtIndexPath = { indexPath in
            return dataProvider.object(at: indexPath)
        }
        numberOfItems = { section in
            return dataProvider.numberOfItems(inSection: section)
        }
        numberOfSectionsCallback = {
            return dataProvider.numberOfSections()
        }
        prefetchItemsAtIndexPaths = { indexPaths in
            dataProvider.prefetchItems(at: indexPaths)
        }
        cancelPrefetchingForItemsAtIndexPaths = { indexPaths in
            dataProvider.cancelPrefetchingForItems(at: indexPaths)
        }
        moveItemAtIndexPath = {
            dataProvider.moveItemAt(sourceIndexPath: $0, to: $1)
        }
        sectionIndexTitles = dataProvider.sectionIndexTitles
    }
    
    public func object(at indexPath: IndexPath) -> Object {
        return objectAtIndexPath(indexPath)
    }
    
    public func numberOfItems(inSection section: Int) -> Int {
        return numberOfItems(section)
    }
    
    public func numberOfSections() -> Int {
        return numberOfSectionsCallback()
    }
    
    public func prefetchItems(at indexPaths: [IndexPath]) {
        prefetchItemsAtIndexPaths(indexPaths)
    }
    
    public func cancelPrefetchingForItems(at indexPaths: [IndexPath]) {
        cancelPrefetchingForItemsAtIndexPaths(indexPaths)
    }
    
    public func moveItemAt(sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveItemAtIndexPath(sourceIndexPath, destinationIndexPath)
    }
}
