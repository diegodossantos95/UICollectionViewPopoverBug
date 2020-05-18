//
//  ViewController.swift
//  CollectionViewPopoverTest
//
//  Created by dos Santos, Diego on 18/10/19.
//  Copyright © 2019 Diego. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var popoverTempView = UIView()

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPopoverTempView()
        self.timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(reloadData), userInfo: nil, repeats: true)
    }

    func setupPopoverTempView() {
        self.collectionView.addSubview(popoverTempView)
        self.popoverTempView.isHidden = true
        self.popoverTempView.backgroundColor = .clear
    }

    @objc
    func reloadData(){
        print("reloadData")
        self.collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            return
        }

        self.presentPopover(from: self, cell: cell)
    }

    func presentPopover(from view: UIViewController, cell: UIView) {
        let popoverView = PopoverViewController(nibName: "PopoverViewController", bundle: nil)
        let popover: UIPopoverPresentationController = popoverView.popoverPresentationController!

        popoverView.delegate = self

        self.popoverTempView.frame = cell.frame
        self.popoverTempView.isHidden = false
        popover.sourceRect = self.popoverTempView.bounds
        popover.sourceView = self.popoverTempView

        view.present(popoverView, animated: true, completion: nil)
    }
}

extension ViewController: PopoverViewControllerDelegate {
    func willDismissPopover() {
        self.popoverTempView.isHidden = true
    }
}

protocol PopoverViewControllerDelegate {
    func willDismissPopover()
}
