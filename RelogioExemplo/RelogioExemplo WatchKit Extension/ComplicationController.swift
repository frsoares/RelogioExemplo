//
//  ComplicationController.swift
//  RelogioExemplo WatchKit Extension
//
//  Created by Francisco Soares on 9/8/16.
//  Copyright © 2016 frsoares. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        //funciona para trás ou para a frente.
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        //        handler(Date(timeInterval: -(60*60*24), sinceDate: NSDate()))
        handler(Date(timeIntervalSinceNow: -60*60*24))
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        
        handler(Date(timeIntervalSinceNow: 24*60*60))
    }
    
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        
        
        var entry : CLKComplicationTimelineEntry? = nil
        
        
        let textProvider = CLKSimpleTextProvider(text: "12 bruffles", shortText: "12bruf")
        
        if complication.family == .modularLarge {
            
            let lf = CLKComplicationTemplateModularLargeStandardBody()
            
            lf.headerTextProvider = textProvider
            lf.body1TextProvider = CLKSimpleTextProvider(text: "relógio exemplo")
            lf.body2TextProvider = CLKSimpleTextProvider(text: "5 draffles", shortText: "5draf")
            
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: lf)
        }
        
        if complication.family == .utilitarianLarge {
            let a : CLKComplicationTemplateUtilitarianLargeFlat =
                CLKComplicationTemplateUtilitarianLargeFlat()
            a.textProvider = textProvider
            
            entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: a)
        }
        
        handler(entry)
    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
    
        // Call the handler with the timeline entries prior to the given date
        
        var entries : [CLKComplicationTimelineEntry]? = nil
        
        if complication.family == .modularLarge {
            entries = []
            
            for i : Int in 1...limit {
                let newDate = date.addingTimeInterval(-Double(i)*10*60)
                let lf = CLKComplicationTemplateModularLargeStandardBody()
                
                let numero = 12 - i
                
                let textProvider = CLKSimpleTextProvider(text: "\(numero) bruffles", shortText: "\(numero)bruf")
                
                lf.headerTextProvider = textProvider
                lf.body1TextProvider = CLKSimpleTextProvider(text: "relógio exemplo")
                lf.body2TextProvider = CLKSimpleTextProvider(text: "5 draffles", shortText: "5 draf")
                
                entries?.append(CLKComplicationTimelineEntry(date: newDate, complicationTemplate: lf))
            }
            
            //            entries = []
        }
        
        if complication.family == .utilitarianLarge {
            entries = []
            
            for i : Int in 1...limit {
                let newDate = date.addingTimeInterval(-Double(i)*10*60)
                let a : CLKComplicationTemplateUtilitarianLargeFlat =
                    CLKComplicationTemplateUtilitarianLargeFlat()
                let numero = 12 - i
                
                let textProvider = CLKSimpleTextProvider(text: "\(numero) bruffles", shortText: "\(numero)bruf")
                
                a.textProvider = textProvider
                
                entries?.append(CLKComplicationTimelineEntry(date: newDate, complicationTemplate: a))
            }
            
        }
        
        handler(entries?.reversed())
        
        
        //        handler(nil)
    }
    
    
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        //        handler(nil)
        var entries : [CLKComplicationTimelineEntry]? = nil
        
        if complication.family == .modularLarge {
            entries = []
            
            for i : Int in 1...limit {
                let newDate = date.addingTimeInterval(Double(i)*10*60)
                let lf = CLKComplicationTemplateModularLargeStandardBody()
                
                let numero = 12 + i
                
                let textProvider = CLKSimpleTextProvider(text: "\(numero) bruffles", shortText: "\(numero)bruf")
                
                lf.headerTextProvider = textProvider
                lf.body1TextProvider = CLKSimpleTextProvider(text: "relógio exemplo")
                lf.body2TextProvider = CLKSimpleTextProvider(text: "5 draffles", shortText: "5draf")
                
                entries?.append(CLKComplicationTimelineEntry(date: newDate, complicationTemplate: lf))
            }
            
            //            entries = []
        }
        
        if complication.family == .utilitarianLarge {
            entries = []
            
            for i : Int in 1...limit {
                let newDate = date.addingTimeInterval(Double(i)*10*60)
                let a : CLKComplicationTemplateUtilitarianLargeFlat =
                    CLKComplicationTemplateUtilitarianLargeFlat()
                let numero = 12 + i
                
                let textProvider = CLKSimpleTextProvider(text: "\(numero) bruffles", shortText: "\(numero)bruf")
                
                a.textProvider = textProvider
                
                entries?.append(CLKComplicationTimelineEntry(date: newDate, complicationTemplate: a))
            }
            
        }
        
        handler(entries)
    }
    
    // MARK: - Update Scheduling
    
    func getNextRequestedUpdateDate(handler: @escaping (Date?) -> Void) {
    
        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
        
        handler(Date(timeIntervalSinceNow: 10*60))//;
    }
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
    
        // This method will be called once per supported complication, and the results will be cached
        //handler(nil)
        
        
        var goThings : CLKComplicationTemplate? = nil
        if complication.family == .utilitarianLarge {
            
            
            let a : CLKComplicationTemplateUtilitarianLargeFlat =
                CLKComplicationTemplateUtilitarianLargeFlat()
            a.textProvider = CLKSimpleTextProvider(text: "Existem 12 bruffles", shortText: "12 bruf")
            
            goThings = a
            
        }
        
        if complication.family == .modularLarge {
            let setimaB = CLKComplicationTemplateModularLargeStandardBody()
            
            setimaB.headerTextProvider = CLKSimpleTextProvider(text: "2 bruffles")
            setimaB.body1TextProvider = CLKSimpleTextProvider(text: "Relógio exemplo")
            setimaB.body2TextProvider = CLKSimpleTextProvider(text: "0 draffles")
            //            handler(setimaB)
            goThings = setimaB
        }
        
        
        
        handler(goThings)
        
    }
    
}
