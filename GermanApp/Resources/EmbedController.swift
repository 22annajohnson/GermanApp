//
//  EmbedController.swift
//  Learning
//
//  Created by Anna Johnson on 10/13/22.
//

import UIKit

class WeakObject {
    weak var object: AnyObject?
    init(object: AnyObject) { self.object = object}
}

class EmbedController {

    private weak var rootViewController: UIViewController?
    private var controllers = [WeakObject]()
    init (rootViewController: UIViewController) { self.rootViewController = rootViewController }

    func append(viewController: UIViewController) {
        guard let rootViewController = rootViewController else { return }
        controllers.append(WeakObject(object: viewController))
        rootViewController.addChild(viewController)
        rootViewController.view.addSubview(viewController.view)
    }

    deinit {
        if rootViewController == nil || controllers.isEmpty { return }
        for controller in controllers {
            if let controller = controller.object {
                controller.view.removeFromSuperview()
                controller.removeFromParent()
            }
        }
        controllers.removeAll()
    }
}
