//
//  ComunicaInterfaceController.swift
//  RelogioExemplo
//
//  Created by Francisco Soares on 9/12/16.
//  Copyright © 2016 frsoares. All rights reserved.
//

import WatchKit
import Foundation

import WatchConnectivity

class ComunicaInterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet var messageLabel : WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        

        if WCSession.isSupported() {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        // Faz alguma coisa com a mensagem recebida. Exemplo abaixo
        self.messageLabel.setText(message["texto"] as? String)
    }
    
    
}
