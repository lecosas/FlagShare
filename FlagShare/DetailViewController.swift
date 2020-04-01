//
//  DetailViewController.swift
//  FlagShare
//
//  Created by user163948 on 4/1/20.
//  Copyright © 2020 lecosas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var ivFlagDetail: UIImageView!
    var flagName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let flagNameWrapped = flagName {
            ivFlagDetail.image = UIImage(named: flagNameWrapped)
        }
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    /*
    // MARK: - Methods
    */
    @objc func shareTapped() {
        guard let image = ivFlagDetail.image?.jpegData(compressionQuality: 80.0) else {
            print("Image not found")
            return
        }
        
        let av = UIActivityViewController(activityItems: [image], applicationActivities: [])
        av.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(av, animated: true)
        
    }

}
