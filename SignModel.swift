//
//  SignModel.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 24/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum VisibleSignatureType: String {
    case want = "want"
    case optional = "optional"
}

class SignModel {
    var operation: String?
    var datosInUse: String?
    var signAlgoInUse: String?
    var docId: String?
    var cipherKey: String?
    var urlServlet: String?
    var signFormat: String?
    var extraParams: String?
    var dictExtraParams: [String: Any]?
    var triphasicServerURL: String?
    var fileId: String?
    var rtServlet: String?
    var cloudName: String?
    var returnURL: String?
    /// Indica si hay hacer la firma visible. Puede tener dos valores:
    ///  - "want" la firma es obligatoria y debe introducir las coordenadas de firma visible. Si cancela, se cancela la operación
    ///  - "optional" la firma es opcional, si cancela se continua con la operacion igualmente pero sin firma visible
    var visibleSignature: VisibleSignatureType?
    var appname: String?
    
    init(dictionary: NSMutableDictionary) {
	   self.operation = dictionary[PARAMETER_NAME_OPERATION] as? String
	   self.datosInUse = dictionary[PARAMETER_NAME_DAT] as? String
	   self.signAlgoInUse = dictionary[PARAMETER_NAME_ALGORITHM2] as? String
	   self.docId = dictionary[PARAMETER_NAME_ID] as? String
	   self.cipherKey = dictionary[PARAMETER_NAME_CIPHER_KEY] as? String
	   self.urlServlet = dictionary[PARAMETER_NAME_STSERVLET] as? String
	   self.signFormat = dictionary[PARAMETER_NAME_FORMAT] as? String
	   self.extraParams = dictionary[PARAMETER_NAME_PROPERTIES] as? String
	   self.rtServlet = dictionary[PARAMETER_NAME_RTSERVLET] as? String
	   self.fileId = dictionary[PARAMETER_NAME_FILE_ID] as? String
	   self.returnURL = dictionary[PARAMETER_NAME_RETURN_URL] as? String

	   if let extraParams = self.extraParams {
		  if let dataReceived = Base64Utils.decode(extraParams, urlSafe: true),
			let stringDataReceived = String(data: dataReceived, encoding: .utf8),
			let dict = CADESSignUtils.javaProperties2Dictionary(stringDataReceived) as? [String: Any] {
			 self.dictExtraParams = dict
			 self.triphasicServerURL = dict[PARAMETER_NAME_TRIPHASIC_SERVER_URL] as? String
			 
			 if let triphasicServerURL = self.triphasicServerURL, triphasicServerURL.last != "e" {
				self.triphasicServerURL = String(triphasicServerURL.dropLast())
			 }
			 
			 if let visibleSignatureString = dict[PARAMETER_NAME_VISIBLE_SIGNATURE] as? String {
                    if let visibleSignature = VisibleSignatureType(rawValue: visibleSignatureString) {
                        self.visibleSignature = visibleSignature
                    }
			 }
                self.visibleSignature = VisibleSignatureType.optional
		  }
	   }

	   if let extraParams2 = dictionary[PARAMETER_NAME_TARGET] as? String {
		  if let decodedTarget = String(data: Base64Utils.decode(extraParams2, urlSafe: true)!, encoding: .utf8) {
			 var aux = self.dictExtraParams ?? [:]

			 if decodedTarget != PARAMETER_NAME_TARGET_TREE && decodedTarget != PARAMETER_NAME_TARGET_LEAFS {
				
			 } else {
				aux[PARAMETER_NAME_TARGET] = decodedTarget
				self.dictExtraParams = aux
			 }
		  }
	   }
	   
	   if let appNameString = dictionary[PARAMETER_NAME_APP_NAME] as? String {
		  self.appname = appNameString
	   }
    }
    
    func updateExtraParams(dict: [String: Any]?) {
	   guard let dict = dict else { return }
	   
	   if dictExtraParams == nil {
		  dictExtraParams = [:]
	   }
	   
	   for (key, value) in dict {
		  dictExtraParams?[key] = value
	   }
	   
	   if let updatedDict = dictExtraParams {
		  let updatedString = CADESSignUtils.dictionary2JavaProperties(updatedDict)
		  if let updatedString = updatedString {
			 extraParams = updatedString
		  }
	   }
    }
}
