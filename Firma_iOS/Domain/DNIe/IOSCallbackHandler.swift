//
//  IOSCallbackHandler.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 24/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class IOSCallbackHandler: JavaxSecurityAuthCallbackCallbackHandler {
    var can: String
    var pin: String
    
    func handle(withJavaxSecurityAuthCallbackCallbackArray callbacks: IOSObjectArray!) {
	   for i in 0..<callbacks.length() {
		  guard let callback = callbacks.object(at: UInt(i)) as? JavaxSecurityAuthCallbackCallback else {
			 continue
		  }
		  
		  print("Executing handle of custom IOSCallbackHandler")
		  print(callback.debugDescription as Any)
		  
		  if let passwordCallback = callback as? JavaxSecurityAuthCallbackPasswordCallback {
			 let passwordCharArray = IOSCharArray(nsString: pin)
			 print("Set PIN")
			 passwordCallback.setPasswordWith(passwordCharArray)
			 break
		  } else
		  if let textInputCallback = callback as? EsGobJmulticardCallbackCustomTextInputCallback {
			 print("Set CAN")
			 textInputCallback.setTextWith(can)
		  }
	   }
    }
    
    func java_clone() -> Any! {
	   return self
    }

    func java_getClass() -> IOSClass! {
	   return IOSClass(forIosName: "IOSCallbackHandler")
    }

    func java_notify() {}
    func java_notifyAll() {}
    func java_wait() {}
    func java_wait(withLong timeout: Int64) {}
    func java_wait(withLong timeout: Int64, with nanos: Int32) {}
    func java_finalize() {}

    func isEqual(_ object: Any?) -> Bool {
	   return false
    }

    var hash: Int = 0
    var superclass: AnyClass?

    func `self`() -> Self {
	   return self
    }

    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
	   return nil
    }

    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
	   return nil
    }

    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
	   return nil
    }

    func isProxy() -> Bool {
	   return false
    }

    func isKind(of aClass: AnyClass) -> Bool {
	   return false
    }

    func isMember(of aClass: AnyClass) -> Bool {
	   return false
    }

    func conforms(to aProtocol: Protocol) -> Bool {
	   return false
    }

    func responds(to aSelector: Selector!) -> Bool {
	   return false
    }

    var description: String {
	   return "IOSCallbackHandler"
    }
    
    init(can: String, pin: String) {
	   self.can = can
	   self.pin = pin
    }
}
