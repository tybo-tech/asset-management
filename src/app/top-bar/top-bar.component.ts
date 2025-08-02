import { Component, EventEmitter, Output } from '@angular/core';
import { Asset } from 'src/models/Asset';
import { User } from 'src/models/user.model';
import { AssetService } from 'src/services/AssetService';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-top-bar',
  templateUrl: './top-bar.component.html',
  styleUrls: ['./top-bar.component.scss'],
})
export class TopBarComponent {
  @Output() toggleMenu = new EventEmitter<any>();
  user?: User;
  query = '';
  loading = false;
  searchResults: Asset[] = [];
  constructor(
    private userService: UserService,
    private assetService: AssetService
  ) {
    this.userService.userObservable?.subscribe((user) => (this.user = user));
    this.search();
  }
  logout() {
    this.userService.logout();
  }

  search() {
    if (!this.query || this.query.length < 2) return;
    this.loading = true;
    this.searchResults = [];
    this.assetService.search(this.query).subscribe((data) => {
      this.loading = false;
      this.searchResults = data || [];
      console.log(this.searchResults, 'Search Results');
    });
  }
}
