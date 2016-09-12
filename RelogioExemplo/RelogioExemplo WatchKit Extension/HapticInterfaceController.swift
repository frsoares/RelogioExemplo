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
        ("Notification",   WKHapticType.Notification),
        ("Direction Up",   WKHapticType.DirectionUp),
        ("Direction Down", WKHapticType.DirectionDown),
        ("Success",        WKHapticType.Success),
        ("Failure",        WKHapticType.Failure),
        ("Retry",          WKHapticType.Retry),
        ("Start",          WKHapticType.Start),
        ("Stop",           WKHapticType.Stop),
        ("Click",          WKHapticType.Click)
    ]
    
    @IBOutlet var tabela: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.tabela.setNumberOfRows(tabelaHaptic.count, withRowType: "Linha")
        
        for (index, duplaHaptic) in tabelaHaptic.enumerate() {
            
            let linha = self.tabela.rowControllerAtIndex(index) as! Linha

            // do something with the row
            linha.textLabel.setText(duplaHaptic.0)
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
       
        let haptic = tabelaHaptic[rowIndex].1
        
        // Aqui é a parte que de fato manda executar o feedback háptico
        WKInterfaceDevice.currentDevice().playHaptic(haptic)

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
