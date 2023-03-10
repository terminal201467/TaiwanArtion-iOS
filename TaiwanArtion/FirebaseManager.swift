//
//  FirebaseManager.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/9.
//

import Foundation
import FirebaseFirestore


class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    private let db = Firestore.firestore()
    
    func createDocument(data: [String: Any], inCollection collection: String, withDocumentId documentId: String? = nil, completion: ((Error?) -> Void)? = nil) {
            var docRef: DocumentReference
            if let documentId = documentId {
                docRef = db.collection(collection).document(documentId)
            } else {
                docRef = db.collection(collection).document()
            }
            docRef.setData(data) { error in
                completion?(error)
            }
        }
    
    func readDocument(fromCollection collection: String, withDocumentId documentId: String, completion: @escaping (Result<DocumentSnapshot?, Error>) -> Void) {
        let docRef = db.collection(collection).document(documentId)
        docRef.getDocument { (document, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(document))
            }
        }
    }
    
    func updateDocument(data: [String: Any], inCollection collection: String, withDocumentId documentId: String, completion: ((Error?) -> Void)? = nil) {
        db.collection(collection).document(documentId).setData(data, merge: true) { error in
            completion?(error)
        }
    }
    
    // Delete a document in a collection with a given document ID
    func deleteDocument(inCollection collection: String, withDocumentId documentId: String, completion: ((Error?) -> Void)? = nil) {
        db.collection(collection).document(documentId).delete { error in
            completion?(error)
        }
    }
    
}
