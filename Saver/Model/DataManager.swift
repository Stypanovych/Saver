//
//  DataManager.swift
//  Saver
//
//  Created by Coder on 7/9/18.
//  Copyright © 2018 Coder. All rights reserved.
//

import Foundation


class DataManeger{
    
    static let defaults = UserDefaults.standard
    static let userDefaultsKey = "key"
    
    static var saver = Saver()
    
    
    func save(firsTextField: String, secondTextField: String, thirdTextField: String) {
        
        let saveData = Saver(firstTextFieldMassage: firsTextField, secondTextFieldMassage: secondTextField, thirdTextFieldMassage: thirdTextField)
        
        do{
            
            let serializedModel = try JSONEncoder().encode(saveData)
            
            DataManeger.defaults.set(serializedModel, forKey: DataManeger.userDefaultsKey)
            
        } catch {
            print("SaverDataModel is not serialized")
        }
    }
    
    
    
    static func restore() {
        
        let encodedData = defaults.object(forKey: userDefaultsKey)
        
        do{
            
            guard let additionalEncodedData = encodedData as? Data else{
                print("Error of changing from Any? to Decoder")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            saver = try jsonDecoder.decode(Saver.self, from: additionalEncodedData)
            
        } catch {
            
        }
    }
}
