//
//  DetailViewController.swift
//  WebViewExamples
//
//  Created by Aarin Smith on 2015-02-25.
//  Copyright (c) 2015 AarinSmith. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var myWebContent: UIWebView!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let content = self.myWebContent {
                let link = detail[0] as String
                let type = detail[1] as String
                
                println( "got link: " + link )
                println( "and type: " + type )
                
                if( type == "URL" || type == "PDF" || type == "STREAM" )
                {
                    println("loading url, pdf, or stream")
                    let url = NSURL(string: link)
                    let request = NSURLRequest(URL: url!)
                    content.scalesPageToFit = true
                    content.loadRequest(request)
                }
                else if( type == "STR" )
                {
                    content.loadHTMLString(link, baseURL: nil)
                }
                else
                {
                    let url = NSBundle.mainBundle().URLForResource(link, withExtension: "html")
                    let request = NSURLRequest(URL: url!)
                    content.scalesPageToFit = true
                    content.loadRequest(request)
                    
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

