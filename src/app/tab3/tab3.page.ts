import { Component } from '@angular/core';
import { AlertController } from '@ionic/angular';

@Component({
  selector: 'app-tab3',
  templateUrl: 'tab3.page.html',
  styleUrls: ['tab3.page.scss']
})
export class Tab3Page {

  constructor(public alertController: AlertController) {}

  async presentAlert() {
    const alert = await this.alertController.create({
      header: 'Bienvenido Al Gestor de Ayuda Sena',
      subHeader: 'Informacion de Contacto Sena CEET',
      message: 'Sena Cra 30 CEET  Lunes-Domingos',
      buttons: ['OK']
    });

    await alert.present();
  }

}
