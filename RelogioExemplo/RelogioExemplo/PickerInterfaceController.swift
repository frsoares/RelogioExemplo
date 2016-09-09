//
//  PickerInterfaceController.swift
//  RelogioExemplo
//
//  Created by Francisco Soares on 9/9/16.
//  Copyright © 2016 frsoares. All rights reserved.
//

import WatchKit
import Foundation


class PickerInterfaceController: WKInterfaceController {

    
    let imageNames = ["Swift_logo_1", "Swift_logo_2"]
    
    @IBOutlet var picker: WKInterfacePicker!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        
        let pickerItems : [WKPickerItem] = imageNames.map {
            let item = WKPickerItem()
            item.contentImage = WKImage(imageName: "\($0)")
            return item
        }
        
        picker.setItems(pickerItems)
        
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
