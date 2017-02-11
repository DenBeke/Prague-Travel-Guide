//
//  ViewController.swift
//  Praag
//
//  Created by Mathias Beke on 3/02/17.
//  Copyright © 2017 Mathias Beke. All rights reserved.
//

import UIKit
import WebKit
import Down

class ViewController: UIViewController {

    var webView: WKWebView?
    
    @IBOutlet weak var pageTitle: UINavigationItem!
    var inputPage = Page(name: "", url: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pageTitle.title = inputPage.name
        
        //webView = WKWebView(frame: view.bounds)
        //view.addSubview(webView!)
        //webView?.load(URLRequest(url: pageUrl!))
        
        let content = try? String(contentsOfFile: Bundle.main.path(forResource: "pages/\(inputPage.url)", ofType: "md")!)
        let down = Down(markdownString: content!)
        let html = try? down.toHTML()
        let base = Bundle.main.bundleURL.appendingPathComponent("pages")
        
        webView = WKWebView(frame: self.view.bounds)
        //webView?.loadHTMLString(html!, baseURL: base)

        var template = try? String(contentsOf: base.appendingPathComponent("index.html"))
        template = template?.replacingOccurrences(of: "DOWN_HTML", with: html!)
        _ = webView?.loadHTMLString(template!, baseURL: base)

        
        
        print(Bundle.main.bundleURL.appendingPathComponent("pages"))
        
        //webView = try? DownView(frame: self.view.bounds, markdownString: content!)
        
        view.addSubview(webView!)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var test: UINavigationItem!

}

