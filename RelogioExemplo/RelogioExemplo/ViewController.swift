//
//  ViewController.swift
//  RelogioExemplo
//
//  Created by Francisco Soares on 9/8/16.
//  Copyright © 2016 frsoares. All rights reserved.
//

import UIKit

import WatchConnectivity

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mudançaNoTexto(sender: UITextField){
        
        print(#function, sender.text)
        
        WCSession.defaultSession().sendMessage(["texto":sender.text!], replyHandler: {
            print($0, "enviado...")
            }) { error in
                print(error.localizedDescription)
        }
        
        
    }

}

