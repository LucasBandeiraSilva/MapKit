//
//  ContentView.swift
//  lucas
//
//  Created by Student16 on 06/09/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    struct Location: Identifiable {
        let id = UUID()
        let name: String
        let coordinate: CLLocationCoordinate2D
        let descricao: String
        
    }
    
    
    
    @State var sheet = false;
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Location(name: "São Paulo", coordinate: CLLocationCoordinate2D(latitude: -23.557, longitude: -46.654), descricao: "São Paulo é um estado brasileiro da região Sudeste. Trata-se da unidade de federação mais populosa do país, com 46 milhões de pessoas, e abriga também a cidade com maior concentração de habitantes do Brasil, que é a sua capital"),
        
        Location(name: "Bruxelas", coordinate: CLLocationCoordinate2D(latitude: 50.849, longitude: 4.354),descricao: "Bruxelas é um importante centro político da Europa e do mundo. Com a sede do Parlamento Europeu e da OTAN (Organização do Tratado do Atlântico), possui a maior área urbana da Bélgica. A região metropolitana de Bruxelas, conta com uma população de 1,8 milhões de habitantes."),
        Location(name: "Batman", coordinate: CLLocationCoordinate2D(latitude: 37.889, longitude: 41.129),descricao: "Batman ou Batmane é uma cidade e distrito (em turco: ilçe) da província homónima, da qual é capital. Faz parte da região do Sudeste da Anatólia da Turquia. Tem 563,6 km² de área e em 2012 a sua população era de 381 990 habitantes (densidade: 677,8 hab./km²), dos quais 348 963 moravam na cidade."),
        Location(name: "Liverpool", coordinate: CLLocationCoordinate2D(latitude: 53.405, longitude: -3.006),descricao: "No século XX, Liverpool também ganhou fama mundial por ser o berço dos Beatles, a banda de rock mais influente da história! A música, a arte e a cultura são aspectos marcantes da cidade, que possui vários museus, galerias, teatros e monumentos históricos"),
        
        Location(name: "Florença", coordinate: CLLocationCoordinate2D(latitude: 43.77, longitude: 11.255),descricao: "Florença (em italiano Firenze) é a capital e maior cidade da região da Toscana. A cidade é considerada o berço do Renascimento italiano, e uma das cidades mais belas do mundo. Então é de se imaginar que não faltam atrações para ver e o que fazer em Florença! Afinal, a cidade é um museu a céu aberto, a cada esquina tem algo incrível para ver. Eu amo visitar a cidade e sempre volto de lá deixando muita coisa sem ver. Pois a lista de atrações de Florença é gigante!"),
        
        
    ]
    
@State var aux = Location(name: "Florença", coordinate: CLLocationCoordinate2D(latitude: 43.77, longitude: 11.255),descricao: "Florença (em italiano Firenze) é a capital e maior cidade da região da Toscana. A cidade é considerada o berço do Renascimento italiano, e uma das cidades mais belas do mundo. Então é de se imaginar que não faltam atrações para ver e o que fazer em Florença! Afinal, a cidade é um museu a céu aberto, a cada esquina tem algo incrível para ver. Eu amo visitar a cidade e sempre volto de lá deixando muita coisa sem ver. Pois a lista de atrações de Florença é gigante!")

    
    var body: some View {
        VStack(alignment: .center) {
            
            Text("World Map")
                .multilineTextAlignment(.leading)
            
                Map(coordinateRegion: $mapRegion, annotationItems: locations) {  location in
                    MapAnnotation(coordinate: location.coordinate) {
                         
                            Circle()
                                .stroke(.red, lineWidth: 3)
                                .frame(width: 44, height: 44).onTapGesture {
                                    
                                    aux = location
                                    sheet = true

                                }
                        
                        
                    }
                }.sheet(isPresented: $sheet){
                    Text(aux.descricao)
                }
                
                
          
 
            ScrollView(.horizontal){
                
            
            HStack(){

                
                ForEach(locations){ btn in
                    Button(btn.name){
                        
                        aux = btn
                        mapRegion = MKCoordinateRegion(center: btn.coordinate,span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
                    }.frame(width: 158.0).background(.blue).foregroundColor(.white).cornerRadius(3.1)
                    
                }
                
                
                }.padding()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
