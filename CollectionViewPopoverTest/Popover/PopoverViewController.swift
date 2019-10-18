//
//  PopoverViewController.swift
//  CollectionViewPopoverTest
//
//  Created by dos Santos, Diego on 18/10/19.
//  Copyright © 2019 Diego. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        modalPresentationStyle = .popover
    }
}
