//
//  FileStorage.swift
//  MovieHouse
//
//  Created by Vladimir Fibe on 30.08.2022.
//

import UIKit

class FileStorage {
  class func downloadImage(fileName: String, completion: @escaping (_ image: UIImage?) -> Void) {
    
    if fileExistsAtPath(path: fileName) {
      if let contentsOfFile = UIImage(contentsOfFile: fileInDocumentsDirectory(fileName: fileName)) {
        completion(contentsOfFile)
      } else {
        print("couldnt convert local image")
        completion(UIImage(named: "avatar"))
      }
      
    } else {
      if let documentUrl = URL(string: "https://image.tmdb.org/t/p/original/\(fileName)")  {
        let downloadQueue = DispatchQueue(label: "imageDownloadQueue")
        downloadQueue.async {
          let data = NSData(contentsOf: documentUrl)
          if data != nil {
            FileStorage.saveFileLocally(fileData: data!, fileName: fileName)
            DispatchQueue.main.async {
              completion(UIImage(data: data! as Data))
            }
          } else {
            DispatchQueue.main.async {
              completion(nil)
            }
          }
        }
      } else {
        completion(nil)
      }
      
    }
  }
  //MARK: - Save Locally
  class func saveFileLocally(fileData: NSData, fileName: String) {
    let docUrl = getDocumentsURL().appendingPathComponent(fileName, isDirectory: false)
    fileData.write(to: docUrl, atomically: true)
  }
  
  
}

//Helpers
func fileInDocumentsDirectory(fileName: String) -> String {
  return getDocumentsURL().appendingPathComponent(fileName).path
}

func getDocumentsURL() -> URL {
  return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
}

func fileExistsAtPath(path: String) -> Bool {
  return FileManager.default.fileExists(atPath: fileInDocumentsDirectory(fileName: path))
}
