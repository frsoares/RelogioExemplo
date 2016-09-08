//
//  InterfaceController.swift
//  RelogioExemplo WatchKit Extension
//
//  Created by Francisco Soares on 9/8/16.
//  Copyright © 2016 frsoares. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func showAlert() {
        
        let ação1 = WKAlertAction(title: "Sim", style: .Default) {
            // código para ação de "Sim" aqui
        }
        
        let ação2 = WKAlertAction(title: "Não", style: .Destructive){
            // código para ação de "Não" aqui
        }
        
        let ação3 = WKAlertAction(title: "Cancelar", style: .Cancel){
            print("oi")
        }
        
        // Estilo do alerta está como ActionSheet. Poderia ser também Alert ou SideBySideButtonsAlert
        presentAlertControllerWithTitle("Hey", message: "Woo loo loo", preferredStyle: .ActionSheet, actions: [ação1, ação2, ação3])
        
    }
}
