//
//  DitadoInterfaceController.swift
//  RelogioExemplo
//
//  Created by Francisco Soares on 9/9/16.
//  Copyright © 2016 frsoares. All rights reserved.
//

import WatchKit
import Foundation


class DitadoInterfaceController: WKInterfaceController {

    @IBOutlet var lblTexto: WKInterfaceLabel!
    
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

    @IBAction func cliqueFalar() {
        // .Plain não inclui emojis, mas há opção de emojis estáticos e animados.
        self.presentTextInputControllerWithSuggestions(["Oi","Olá", "Tchau", "Swift", "Sim", "Não"]
        , allowedInputMode: .Plain) { (results) in
            
            self.lblTexto.setText(results?.first as? String)
            
            if let result = results?.first as? String {
                if(result == "Swift"){
                    self.pushControllerWithName("Picker", context: nil)
                }
            }
            
        }
        
    }
}
