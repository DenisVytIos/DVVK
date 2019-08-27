//
//  BiometricAuthManager.swift
//  DVVK
//
//  Created by Denis on 6/3/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Foundation
import LocalAuthentication

enum BiometricType {
  case none
  case touchID
  case faceID
}

class BiometricAuthManager {
  static let shared = BiometricAuthManager()
  
  let context = LAContext()
  let loginReason = "Loggin in with Touch ID"
  
  private init() {}
  
  func isBiometricAuthSupported() -> Bool {
    return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
  }
  
  func biometricType() -> BiometricType {
    let _ = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    switch context.biometryType {
    case .none:
      return .none
    case .touchID:
      return .touchID
    case .faceID:
      return .faceID
    @unknown default:
      fatalError()
    }
  }
  
  //  func authenticateUser(completion: @escaping ItemClosure<CustomErrors?>){
  //
  //    guard isBiometricAuthSupported() else {
  //      completion(CustomErrors.biometricAuthError("Biometric auth isn't available"))
  //      return
  //    }
  
  func authenticateUser(completion: @escaping ItemClosure<CustomErrors?>) {
    
    guard isBiometricAuthSupported() else {
      completion(CustomErrors.biometricAuthError("Biometric auth isn't available"))
      return
    }
    
    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: loginReason)
    { (success, evaluateError) in
      
      onMain {
        
        guard success else {
          
          let message: String
          
          switch evaluateError {
          case LAError.authenticationFailed?:
            message = "There was a problem verifying your identity."
          case LAError.userCancel?:
            message = "You pressed cancel."
          case LAError.userFallback?:
            message = "You pressed password."
          case LAError.biometryNotAvailable?:
            message = "Face ID/Touch ID is not available."
          case LAError.biometryNotEnrolled?:
            message = "Face ID/Touch ID is not set up."
          case LAError.biometryLockout?:
            message = "Face ID/Touch ID is locked."
          default:
            message = "Face ID/Touch ID may not be configured"
          }
          
          completion(CustomErrors.biometricAuthError(message))
          return
        }
        
        completion(nil)
      }
    }
  }
}
