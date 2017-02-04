//
//  ViewController.swift
//  Praag
//
//  Created by Mathias Beke on 3/02/17.
//  Copyright © 2017 Mathias Beke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageView: UIWebView!
    @IBOutlet weak var pageTitle: UINavigationItem!
    var inputPage = Page(name: "", url: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pageTitle.title = inputPage.name
        let pageUrl = Bundle.main.url(forResource: "pages/\(inputPage.url)", withExtension: "html")
        pageView.loadRequest(URLRequest(url: pageUrl!))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var test: UINavigationItem!

}

