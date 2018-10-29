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
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
        self.tabela.setNumberOfRows(professores.count, withRowType: "Linha")
        
        for (index, name) in professores.enumerated() {
            
            let linha = self.tabela.rowController(at: index) as! Linha
            
            linha.textLabel.setText(name)
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
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
