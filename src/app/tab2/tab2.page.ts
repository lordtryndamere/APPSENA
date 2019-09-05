import { NavController } from '@ionic/angular';
import { Platform } from '@ionic/angular';
import { Component } from '@angular/core';
import { File } from '@ionic-native/File/ngx';
import { FileTransfer } from '@ionic-native/file-transfer/ngx';
import { FileOpener } from '@ionic-native/file-opener/ngx';
import { DocumentViewer, DocumentViewerOptions } from '@ionic-native/document-viewer/ngx';





@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss']
})
export class Tab2Page {

  constructor(public navCtrl:NavController,private platform: Platform, private file: File, private ft: FileTransfer, 
    private fileOpener: FileOpener, private document: DocumentViewer) { }

    openLocalPdf() {
      let filePath = this.file.applicationDirectory + 'www/assets';
   
      if (this.platform.is('android')) {
        let fakeName = Date.now();
        this.file.copyFile(filePath, '5-tools.pdf', this.file.dataDirectory, `${fakeName}.pdf`).then(result => {
          this.fileOpener.open(result.nativeURL, 'application/pdf')
            .then(() => console.log('File is opened'))
            .catch(e => console.log('Error opening file', e));
        })
      } else {
        // Use Document viewer for iOS for a better UI
        const options: DocumentViewerOptions = {
          title: 'My PDF'
        }
        this.document.viewDocument(`${filePath}/5-tools.pdf`, 'application/pdf', options);
      }
    }

    downloadAndOpenPdf() {
      
      console.log('entro');
      let downloadUrl = 'https://devdactic.com/html/5-simple-hacks-LBT.pdf';
      let path = this.file.dataDirectory;
      const transfer = this.ft.create();
      console.log(path + 'myfile.pdf');

      transfer.download(downloadUrl, path + 'myfile.pdf').then(entry => {
        let url = entry.toURL();
        console.log('llego');
     
        if (this.platform.is('ios')) {
          this.document.viewDocument(url, 'application/pdf', {});
        } else {
          this.fileOpener.open(url, 'application/pdf')
            .then(() => console.log('File is opened'))
            .catch(e => console.log('Error opening file', e));
        }
      });
    }



}

