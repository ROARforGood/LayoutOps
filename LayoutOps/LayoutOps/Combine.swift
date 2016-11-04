//
//  Created by Pavel Sharanda on 19.10.16.
//  Copyright © 2016 Pavel Sharanda. All rights reserved.
//

import UIKit

private struct CombineOperation : LayoutOperation {
    
    let layoutOperations: [LayoutOperation]
    
    let viewport: Viewport?
    
    func calculateLayouts(inout layouts: ViewLayoutMap, viewport: Viewport) {
        for layoutOperation in layoutOperations {
            layoutOperation.calculateLayouts(&layouts, viewport: self.viewport ?? viewport)
        }
    }
    
    init(layoutOperations: [LayoutOperation], viewport: Viewport? = nil) {
        self.layoutOperations = layoutOperations
        self.viewport = viewport
    }
}

public func Combine(operations: [LayoutOperation]) -> LayoutOperation {
    return CombineOperation(layoutOperations: operations)
}

public func Combine(viewport: Viewport, operations: [LayoutOperation]) -> LayoutOperation {
    return CombineOperation(layoutOperations: operations, viewport: viewport)
}

public func Combine(operations: LayoutOperation...) -> LayoutOperation {
    return CombineOperation(layoutOperations: operations)
}

public func Combine(viewport: Viewport, operations: LayoutOperation...) -> LayoutOperation {
    return CombineOperation(layoutOperations: operations, viewport: viewport)
}