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

    @IBOutlet var lblTexto: WKInterfaceLabel!
    
    @IBOutlet var imagem: WKInterfaceImage!
    
    var imageSelected : Int = 1
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Adicinando um dos itens do menu via código
        // outros dois devem estar no Storyboard
        addMenuItem(with: .play, title: "Alertar", action: #selector(InterfaceController.showAlert))
        
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
        
        let ação1 = WKAlertAction(title: "Sim", style: .default) {
            // código para ação de "Sim" aqui
        }
        
        let ação2 = WKAlertAction(title: "Não", style: .destructive){
            // código para ação de "Não" aqui
        }
        
        let ação3 = WKAlertAction(title: "Cancelar", style: .cancel){
            print("oi")
        }
        
        // Estilo do alerta está como ActionSheet. Poderia ser também Alert ou SideBySideButtonsAlert
        presentAlert(withTitle: "Hey", message: "Woo loo loo", preferredStyle: .actionSheet, actions: [ação1, ação2, ação3])
        
    }
    
    @IBAction func mudarTexto() {
        
        self.lblTexto.setText("Novo texto")
        
    }
    
    @IBAction func mudarImagem() {
        
        imageSelected = (imageSelected % 2) + 1
        
        self.imagem.setImageNamed("Swift_logo_\(imageSelected)")
        
    }
    
    @IBAction func aceitar() {

        print("aceitou")

    }
    
    @IBAction func rejeitar() {

        print("rejeitou")
        
    }
}
