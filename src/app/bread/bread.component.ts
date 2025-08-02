import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-bread',
  templateUrl: './bread.component.html',
  styleUrls: ['./bread.component.scss'],
})
export class BreadComponent implements OnInit {
  @Input() pageName = 'categories';
  @Input() links = [
    {
      name: 'Dashboard',
      link: '/dashboard',
    },
    {
      name: 'categories',
      link: '',
    },
  ];
  ngOnInit(): void {
    // Set last link to pageName
    this.links[this.links.length - 1].name = this.pageName;
  }
}
