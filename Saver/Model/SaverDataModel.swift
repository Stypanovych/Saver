//
//  SaverDataModel.swift
//  Saver
//
//  Created by Coder on 6/24/18.
//  Copyright © 2018 Coder. All rights reserved.
//

import UIKit


struct Saver {
    
    var firstTextFieldMassage : String?
    var secondTextFieldMassage : String?
    var thirdTextFieldMassage : String?
    
    enum CodingKeys: String, CodingKey {
        case firstField
        case secondField
        case thirdField
    }
    
    
}

extension Saver: Decodable{
    
    init (from decoder: Decoder) throws {
        
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            if let firstTextField: String = try? container.decode(String.self, forKey: .firstField){
                
                firstTextFieldMassage = firstTextField
                print(firstTextField)
            }
            if let secondTextField: String = try? container.decode(String.self, forKey: .secondField){
                
                secondTextFieldMassage = secondTextField
            }
            if let thirdTextField: String = try? container.decode(String.self, forKey: .thirdField){
                
                thirdTextFieldMassage = thirdTextField
            }
            
        } catch{
            
            print("Error of initializing decoder \(error)")
        }
    }
}

extension Saver: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(firstTextFieldMassage, forKey: .firstField)
        try container.encode(secondTextFieldMassage, forKey: .secondField)
        try container.encode(thirdTextFieldMassage, forKey: .thirdField)
        
    }
}



