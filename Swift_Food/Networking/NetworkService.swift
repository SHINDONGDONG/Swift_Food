//
//  NetworkService.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/13.
//

import Foundation

struct NetworkService {
    //싱글톤 만들기
    static let shard = NetworkService()
    
    private init(){}
    
    func myFirstRequest(completion: @escaping(Result<[Dish],Error>)-> Void){
        request(route: .temp, method: .get, completion: completion)
    }
    
    private func handleResponse<T:Codable>(result: Result<Data,Error>?, completion: (Result<T,Error>)-> Void) {
        
        guard let result = result else {
            completion(.failure(AppError.unkownError))
            return
        }
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                print("ERRRRRRRRRRR")
                completion(.failure(AppError.errorDecoding))
                return
            }
            
            if let error =  response.error {
                completion(.failure(AppError.serverError(error)))
                return
            }
            
            if let decodeData = response.data {
                completion(.success(decodeData))
            }else {
                completion(.failure(AppError.unkownError))
            }
            
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    
    private func request<T:Codable>(
        route: Route,
        method: Method,
        parameters:[String: Any]? = nil,
//        type: T.Type,
        completion: @escaping (Result<T,Error>) -> Void) {
    
            guard let request = createRequest(route: route, method: method, parameters: parameters) else {
                completion(.failure(AppError.unkownError))
                return
            }
                //url session으로 데이터를받아서 success일때 데이터를 넘긴다.
            URLSession.shared.dataTask(with: request) { data, response, error in
                var result: Result<Data,Error>?
                if let data = data {
                    result = .success(data)
//                    let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
//                    print("The response is:\n\(responseString)")
                }else if let error = error {
                    result = .failure(error)
                    print("the error is: \n\(error.localizedDescription)")
                }
                DispatchQueue.main.async {
                    ///TODO decode our result and send back to the user
                    self.handleResponse(result: result, completion: completion)
                }
            }.resume()
    }
    
    
    ///  function helps us to generate a urlRequest
    /// - Parameters:
    ///   - route: 리소스 경로를 백엔드로 관리
    ///   - method: 타입을 결정해준다
    ///   - parameters:
    /// - Returns: URLRequest
    private func createRequest(
        //경로가 될 것이다. 백엔드에서 리소스를 가져온다.
        route: Route,
        //get,put,post등 타입을 정함.
        method: Method,
        //get을 하려면 url등, 이미지등 여러가지 정보를 가져온다.
        parameters: [String:Any]?) -> URLRequest? {
        
            //baseurl을 받고 그 뒤에 description으로 경로를 정해준다.
            let urlString = Route.baseUrl + route.description
            //완전한 url로 만들어준다.
            guard let url = urlString.asUrl else { return nil}
            //urlRequest를 받아주고 거기에 addvalue를 해주어야함.
            var urlRequest = URLRequest(url: url)
            //request에 addvalue로 값을 추가한다 추가하고싶은 컨텐트타입을 추가함.
            //application/json으로 데이터를 받고 content-type으로 받는다.
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            urlRequest.httpMethod = method.rawValue
            
            if let params = parameters {
                switch method {
                case .get:
                    var urlComponent = URLComponents(string: urlString)
                    urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
                    urlRequest.url = urlComponent?.url
                case .post,.delete,.patch:
                    let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                    urlRequest.httpBody = bodyData
                }
            }
            return urlRequest
    }
    
    
}
