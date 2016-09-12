//
//  TabelaInterfaceController.swift
//  RelogioExemplo
//
//  Created by Francisco Soares on 9/12/16.
//  Copyright © 2016 frsoares. All rights reserved.
//

import WatchKit
import Foundation


class TabelaInterfaceController: WKInterfaceController {
    
    @IBOutlet var tabela: WKInterfaceTable!
    
    let professores = ["Kiev Alfa", "Kiev Beta", "Kiev Gama", "Kiev Delta", "Kiev Épsilon", "Kiev Zeta", "Kiev Eta"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        self.tabela.setNumberOfRows(professores.count, withRowType: "Linha")
        
        for (index, name) in professores.enumerate() {
            
            let linha = self.tabela.rowControllerAtIndex( index) as! Linha
            
            linha.textLabel.setText(name)
        }
    }
    
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        // faz qualquer coisa com a informação do índice da linha que foi selecionada
        print(professores[rowIndex])
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
