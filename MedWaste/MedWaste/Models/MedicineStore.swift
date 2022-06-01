//
//  RecognizedContent.swift
//  MedWaste
//
//  Created by Irene Fernando on 29/05/22.
//

import Foundation

class MedicineStore : ObservableObject {
    @Published var items :[MedData] = []
    
    
    // using the shared instance of the FileManager class to get the location of the Documents directory for the current user.
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
            .appendingPathComponent("items.data")
    }
    
   // method to populate the medicine array from items.data file
    static func load(completion: @escaping (Result<[MedData], Error>)->Void) {
            DispatchQueue.global(qos: .background).async {
                do {
                    let fileURL = try fileURL()
                    
                    // Because items.data doesn’t exist when a user launches the app for the first time, you call the completion handler with an empty array if there’s an error opening the file handle.
                    guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                        DispatchQueue.main.async {
                            completion(.success([]))
                        }
                        return
                    }
                
                    // Decode the file’s available data into a local constant named medicines.
                    let medicines = try JSONDecoder().decode([MedData].self, from: file.availableData)
                    
                    // longer-running tasks of opening the file and decoding its contents on a background queue. When those tasks complete, switch back to the main queue.
                    DispatchQueue.main.async {
                        completion(.success(medicines))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }
    
    // method to save the user’s medicines to the file system.
    static func save(medicines: [MedData], completion: @escaping (Result<Int, Error>)->Void) {
           DispatchQueue.global(qos: .background).async {
               do {
                   let data = try JSONEncoder().encode(medicines)
                   
                   // create the URL
                   let outfile = try fileURL()
                   
                   // write the encoded data to the file.
                   try data.write(to: outfile)
                   DispatchQueue.main.async {
                       completion(.success(medicines.count))
                   }
               } catch {
                   DispatchQueue.main.async {
                       completion(.failure(error))
                   }
               }
           }
       }
}
