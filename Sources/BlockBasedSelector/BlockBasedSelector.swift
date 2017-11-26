//
//  BlockBasedSelector.swift
//
//  Created by Charlton Provatas on 11/2/17.
//  Copyright © 2017 CharltonProvatas. All rights reserved.

import Foundation
import UIKit

func Selector(_ block: @escaping () -> Void) -> Selector {
    let selector = NSSelectorFromString("\(CACurrentMediaTime())")
    class_addMethodWithBlock(_Selector.self, selector) { (_) in block() }
    return selector
}

let Selector = _Selector.shared
@objc class _Selector: NSObject {
    static let shared = _Selector()
}
