import { Component, OnInit } from '@angular/core';
import { Router } from  "@angular/router";
import { NavController } from '@ionic/angular';
import { ToastController } from '@ionic/angular';
import {Platform} from '@ionic/angular';




@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {

 s_user:string;
 s_pass:string;

 

 

 isValid: boolean = true;
 error: string = '';
 splash = true;
 tabBarElement:any;
  subscribe:any;
  constructor(private  router:  Router,private navCtrl: NavController,public toastController: ToastController,public platform:Platform) {
    this.tabBarElement = document.querySelector('.tabbar');
    this.subscribe = this.platform.backButton.subscribeWithPriority(666666, ()=> {
        if (this.constructor.name =="LoginPage") {
            if (window.confirm("Quieres salir de la app ?")) {
              navigator["app"].exitApp();
            }
         }
      })  
    this.ionViewDidLoad();
   }
   ionViewDidLoad(){
    setTimeout ( ()=> {
      this.splash = false;
    },4000);
   }
  ngOnInit() {}


  login(formData) 
  {
    this.error="";
    this.s_user = formData.value.username.toString();
    this.s_pass = formData.value.password.toString();
    
    
    
    
  
    console.log(formData.value);
      if (this.s_user == "Aprendiz" && this.s_pass == "sena") 
      {
        this.navCtrl.navigateRoot('tabs');
      }
      else 
      {
        this.error="Usuario o Password Invalido Verique..."
        this.isValid=false;
        this.presentToast();
      }
  }

  async presentToast() {
    const toast = await this.toastController.create({
      message: 'Usuario o Password Invalido Verique...',
      duration: 2000,
      position: 'bottom',
      showCloseButton: true,
      closeButtonText: 'Ok',
      });
    toast.present();
  }
  


}
