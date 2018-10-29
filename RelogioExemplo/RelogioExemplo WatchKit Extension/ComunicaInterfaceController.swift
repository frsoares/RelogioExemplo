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

class ComunicaInterfaceController: WKInterfaceController {


    @IBOutlet var messageLabel : WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        

        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
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
    
}


extension ComunicaInterfaceController : WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("ActivationCompleted with state: \(activationState); error: \(error?.localizedDescription ?? "no error")")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print(#function, "entered")
        self.messageLabel.setText(message["texto"] as? String ?? "")
    }
}
