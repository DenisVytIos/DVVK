//
//  CustomErrors.swift
//  DVVK
//
//  Created by Denis on 6/5/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Foundation

enum Result<Value> {
  case success(Value)
  case failure(Error)
}

enum CustomErrors {
  case invalidEmail
  case unknownError
  case serverError
  case keychainError
  case biometricAuthError(String)
}

extension CustomErrors: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .invalidEmail:
      return NSLocalizedString("email_is_not_valid", comment: "")
    case .unknownError:
      return NSLocalizedString("server_error", comment: "")
    case .serverError:
      return NSLocalizedString("server_error", comment: "")
    case .keychainError:
      return NSLocalizedString("keychain_error", comment: "")
    case .biometricAuthError(let error):
      return error
    }
  }
}
