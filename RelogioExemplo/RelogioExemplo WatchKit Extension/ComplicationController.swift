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
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        //funciona para trás ou para a frente.
        handler([.Forward, .Backward])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        //        handler(NSDate(timeInterval: -(60*60*24), sinceDate: NSDate()))
        handler(NSDate(timeIntervalSinceNow: -60*60*24))
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(NSDate(timeIntervalSinceNow: 24*60*60))
    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.ShowOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        // Call the handler with the current timeline entry
        
        
        var entry : CLKComplicationTimelineEntry? = nil
        
        
        let textProvider = CLKSimpleTextProvider(text: "12 bruffles", shortText: "12bruf")
        
        if complication.family == .ModularLarge {
            
            let lf = CLKComplicationTemplateModularLargeStandardBody()
            
            lf.headerTextProvider = textProvider
            lf.body1TextProvider = CLKSimpleTextProvider(text: "relógio exemplo")
            lf.body2TextProvider = CLKSimpleTextProvider(text: "5 draffles", shortText: "5draf")
            
            entry = CLKComplicationTimelineEntry(date: NSDate(), complicationTemplate: lf)
        }
        
        if complication.family == .UtilitarianLarge {
            let a : CLKComplicationTemplateUtilitarianLargeFlat =
                CLKComplicationTemplateUtilitarianLargeFlat()
            a.textProvider = textProvider
            
            entry = CLKComplicationTimelineEntry(date: NSDate(), complicationTemplate: a)
        }
        
        handler(entry)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries prior to the given date
        
        var entries : [CLKComplicationTimelineEntry]? = nil
        
        if complication.family == .ModularLarge {
            entries = []
            
            for i : Int in 1...limit {
                let newDate = date.dateByAddingTimeInterval(-Double(i)*10*60)
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
        
        if complication.family == .UtilitarianLarge {
            entries = []
            
            for i : Int in 1...limit {
                let newDate = date.dateByAddingTimeInterval(-Double(i)*10*60)
                let a : CLKComplicationTemplateUtilitarianLargeFlat =
                    CLKComplicationTemplateUtilitarianLargeFlat()
                let numero = 12 - i
                
                let textProvider = CLKSimpleTextProvider(text: "\(numero) bruffles", shortText: "\(numero)bruf")
                
                a.textProvider = textProvider
                
                entries?.append(CLKComplicationTimelineEntry(date: newDate, complicationTemplate: a))
            }
            
        }
        
        handler(entries?.reverse())
        
        
        //        handler(nil)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries after to the given date
        //        handler(nil)
        var entries : [CLKComplicationTimelineEntry]? = nil
        
        if complication.family == .ModularLarge {
            entries = []
            
            for i : Int in 1...limit {
                let newDate = date.dateByAddingTimeInterval(Double(i)*10*60)
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
        
        if complication.family == .UtilitarianLarge {
            entries = []
            
            for i : Int in 1...limit {
                let newDate = date.dateByAddingTimeInterval(Double(i)*10*60)
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
    
    func getNextRequestedUpdateDateWithHandler(handler: (NSDate?) -> Void) {
        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
        
        handler(NSDate(timeIntervalSinceNow: 10*60))//;
    }
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        //handler(nil)
        
        
        var goThings : CLKComplicationTemplate? = nil
        if complication.family == .UtilitarianLarge {
            
            
            let a : CLKComplicationTemplateUtilitarianLargeFlat =
                CLKComplicationTemplateUtilitarianLargeFlat()
            a.textProvider = CLKSimpleTextProvider(text: "Existem 12 bruffles", shortText: "12 bruf")
            
            goThings = a
            
        }
        
        if complication.family == .ModularLarge {
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