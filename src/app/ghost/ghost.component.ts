import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-ghost',
  templateUrl: './ghost.component.html',
  styleUrls: ['./ghost.component.scss'],
})
export class GhostComponent implements OnInit {
  @Input() items = 6;
  list: any[] = [];
  ngOnInit(): void {
    for (let i = 0; i < this.items; i++) this.list.push(i);
  }
}
