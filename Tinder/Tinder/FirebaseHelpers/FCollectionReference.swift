//
//  FCollectionReference.swift
//  Tinder
//
//  Created by Ellen_Kapii on 09.12.22.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
}

func firebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    Firestore.firestore().collection(collectionReference.rawValue)
}
