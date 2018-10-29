//
//  HapticInterfaceController.swift
//  RelogioExemplo
//
//  Created by Francisco Soares on 9/12/16.
//  Copyright © 2016 frsoares. All rights reserved.
//

import WatchKit
import Foundation


class HapticInterfaceController: WKInterfaceController {

    //: Tipos de feedback háptico organizados pelos seus nomes
    let tabelaHaptic : [(String, WKHapticType)] = [
        ("Notification",   WKHapticType.notification),
        ("Direction Up",   WKHapticType.directionUp),
        ("Direction Down", WKHapticType.directionDown),
        ("Success",        WKHapticType.success),
        ("Failure",        WKHapticType.failure),
        ("Retry",          WKHapticType.retry),
        ("Start",          WKHapticType.start),
        ("Stop",           WKHapticType.stop),
        ("Click",          WKHapticType.click)
    ]
    
    @IBOutlet var tabela: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        self.tabela.setNumberOfRows(tabelaHaptic.count, withRowType: "Linha")
        
        for (index, duplaHaptic) in tabelaHaptic.enumerated() {
            
            let linha = self.tabela.rowController(at: index) as! Linha

            // do something with the row
            linha.textLabel.setText(duplaHaptic.0)
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
       
        let haptic = tabelaHaptic[rowIndex].1
        
        // Aqui é a parte que de fato manda executar o feedback háptico
        WKInterfaceDevice.current().play(haptic)

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
