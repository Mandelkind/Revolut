//
//  Error.swift
//  Revolut
//
//  Created by Marco Betschart on 02.03.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import Foundation

enum Error: Swift.Error, CustomNSError, LocalizedError {
	case badRequest
	case unauthorized
	case forbidden
	case notFound
	case methodNotAllowed
	case notAcceptable
	case tooManyRequests
	case internalServerError
	case serviceUnavailable
	
	static var errorDomain: String {
		return "Revolut"
	}
	
	static func from(errorCode: Int) -> Error{
		switch errorCode{
		case 400: return Error.badRequest
		case 401: return Error.unauthorized
		case 403: return Error.forbidden
		case 404: return Error.notFound
		case 405: return Error.methodNotAllowed
		case 406: return Error.notAcceptable
		case 429: return Error.tooManyRequests
		case 500: return Error.internalServerError
		case 503: return Error.serviceUnavailable
		default:
			fatalError("Unknown error")
		}
	}
	
	var errorCode: Int {
		switch self{
		case .badRequest: return 400
		case .unauthorized: return 401
		case .forbidden: return 403
		case .notFound: return 404
		case .methodNotAllowed: return 405
		case .notAcceptable: return 406
		case .tooManyRequests: return 429
		case .internalServerError: return 500
		case .serviceUnavailable: return 503
		}
	}
	
	var errorDescription: String? {
		switch self{
		case .badRequest: return "Your request is invalid."
		case .unauthorized: return "Your API key is wrong."
		case .forbidden: return "Access to the requested resource or action is forbidden."
		case .notFound: return "The requested resource could not be found."
		case .methodNotAllowed: return "You tried to access an endpoint with an invalid method."
		case .notAcceptable: return "You requested a format that isn't JSON."
		case .tooManyRequests: return "You're sending too many requests."
		case .internalServerError: return "We had a problem with our server. Try again later."
		case .serviceUnavailable: return "We're temporarily offline for maintenance. Please try again later."
		}
	}
	
	var errorUserInfo: [String : Any] { return [:] }
	var failureReason: String? { return nil }
	var recoverySuggestion: String? { return nil }
}
