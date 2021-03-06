//
//  Copyright (C) 2017 Lukas Schmidt.
//
//  Permission is hereby granted, free of charge, to any person obtaining a 
//  copy of this software and associated documentation files (the "Software"), 
//  to deal in the Software without restriction, including without limitation 
//  the rights to use, copy, modify, merge, publish, distribute, sublicense, 
//  and/or sell copies of the Software, and to permit persons to whom the 
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in 
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
//  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
//  DEALINGS IN THE SOFTWARE.
//
//
//  DataModifying.swift
//  Sourcing
//
//  Created by Lukas Schmidt on 31.01.17.
//

import Foundation

public protocol DataModifying {
    /// Moves item from sourceIndexPath to destinationIndexPath
    ///
    /// - Parameters:
    ///   - sourceIndexPath: Source's IndexPath
    ///   - destinationIndexPath: Destination's IndexPath
    ///   - triggerdByTableView: pass `true` if the action was triggered by UITableView's delegate and the state of
    ///     the tableView has already been updated
    func moveItemAt(sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath, triggerdByTableView: Bool)
    
    func canMoveItem(at indexPath: IndexPath) -> Bool
    
    func deleteItem(at indexPath: IndexPath, triggerdByTableView: Bool)
    
    func canDeleteItem(at indexPath: IndexPath) -> Bool
}
