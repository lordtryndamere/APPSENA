import { Component, OnInit } from '@angular/core';
import { Geolocation } from '@ionic-native/geolocation/ngx';

declare var google;
@Component({
  selector: 'app-mapa',
  templateUrl: './mapa.page.html',
  styleUrls: ['./mapa.page.scss'],
})
export class MapaPage implements OnInit {

  constructor(private geolocation: Geolocation) { }

  ngOnInit() {
    this.CargarMapa();
  }
  async CargarMapa() {
    const  rta = await this.geolocation.getCurrentPosition();
    const Milati = {
      lat:rta.coords.latitude,
      lng:rta.coords.longitude
    }
    console.log(Milati);
    const mapEle: HTMLElement = document.getElementById('map');
    const map = new google.maps.Map(mapEle, {
      center: Milati,
      zoom: 12
    });
    
    google.maps.event
    .addListenerOnce(map, 'idle', () =>{
      const marker = new google.maps.Marker({
        position:{
          lat: Milati.lat,
          lng: Milati.lng
        },
        zoom: 8,
        map: map,
        title: ''
      });
    });

}

}
