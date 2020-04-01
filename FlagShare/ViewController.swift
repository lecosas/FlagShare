//
//  ViewController.swift
//  FlagShare
//
//  Created by user163948 on 3/31/20.
//  Copyright © 2020 lecosas. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFlagImages()
        
        title = "Flags"
        navigationItem.largeTitleDisplayMode = .always
    }

    // MARK:- Methods
    private func loadFlagImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("png") || item.hasSuffix("jpg") || item.hasSuffix("gif") {
                flags.append(item)
            }
        }
        print(flags)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(flags.count)
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFlag", for: indexPath)
        cell.imageView?.image = UIImage(named: flags[indexPath.row])
        cell.textLabel?.text = flags[indexPath.row]
        //cell.prepare(with: flags[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "flagDetail") as? DetailViewController {
            vc.flagName = flags[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

 
