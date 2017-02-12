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
        
        do {
            pageTitle.title = inputPage.name
            
            // Load markdown file
            let md =  Bundle.main.path(forResource: "pages/\(inputPage.url)", ofType: "md")
            if md == nil {
                print("Couldn't load input page: " + "pages/\(inputPage.url)")
                throw Exception.FileError
            }
            let content = try String(contentsOfFile: md!)
            
            // Convert markdown to html
            let down = Down(markdownString: content)
            let html = try down.toHTML()
            let base = Bundle.main.bundleURL.appendingPathComponent("pages")
            
            
            // Create webview and add html to it
            webView = WKWebView(frame: self.view.bounds)
            webView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            var template = try String(contentsOf: base.appendingPathComponent("index.html"))
            template = template.replacingOccurrences(of: "DOWN_HTML", with: html)
            _ = webView?.loadHTMLString(template, baseURL: base)
            
            if webView == nil {
                print("Couldn't render view")
                throw Exception.RenderError
            }
            view.addSubview(webView!)

        } catch {
            alert(title: "Ooops", message: "Couldn't load this page")
        }
        
    }
    
    
    func alert(title: String, message: String = "") {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Create default action
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: { (action) in
            _ = self.navigationController?.popToRootViewController(animated: true)
        })
        
        // Add action
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

