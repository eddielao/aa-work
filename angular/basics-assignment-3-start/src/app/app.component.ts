import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  displayParagraph: boolean;
  catCount: number = 5;
  dateTime: Date;
  timeStamps: string[] = [];

  constructor() {
    this.displayParagraph = false;
  }

  

  GiveBirth() {
    this.catCount++;
    this.displayParagraph = !this.displayParagraph;
    this.dateTime = new Date(Date.now());
    this.timeStamps.push(this.dateTime.toTimeString());
  }
}
