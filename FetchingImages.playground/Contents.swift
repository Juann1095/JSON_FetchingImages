import Foundation
import UIKit

let jsonString = """
{
    "name":"John",
    "picture":
    "https://github.com/Meta-Mobile-Developer-PC/working-with-Data-API/blob/main/little-lemon-logo.png?raw=true"
}
"""

struct Profile:Decodable {
    let name:String
    let picture:String
}

let jsonData = Data(jsonString.utf8)
let decoder = JSONDecoder()
let profile = try! decoder.decode(Profile.self,from: jsonData)

let pictureUrl = URL(string: profile.picture)
guard let pictureUrl = pictureUrl else {
    throw NSError()
}

let request = URLRequest(url: pictureUrl)
let task = URLSession.shared.dataTask(with: request) {data, response, error in
    if let data = data{
//After recieving the image data it must be converted from the data object to a UI image object
        let image=UIImage(data: data)
//Confirm that the image was created successfully
        print(image)
    }
}
//To start the task execution, i call the resume method on the task constant,
//It will start the request to the little lemon API to fetch the image of the user
task.resume()

//Running the code, the user profile image is recieved and UIImage object is outputted to console



