//
//  HTMLTAG.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/5/23.
//

import Foundation

extension String {
    var strippedHTMLTags: String {
        return replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
