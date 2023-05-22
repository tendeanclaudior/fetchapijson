//
//  Post.swift
//  FetchAPIJSON
//
//  Created by Claudio Tendean on 22/05/23.
//

import Foundation
import SwiftUI

struct Post : Codable, Identifiable {
    public var id: Int
    public var title: String
    public var body: String
}
