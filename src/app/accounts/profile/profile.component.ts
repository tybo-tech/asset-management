import { Component } from '@angular/core';
import { User } from 'src/models/user.model';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss'],
})
export class ProfileComponent {
  user?: User;
  constructor(private userService: UserService) {
    this.getUser();
  }
  getUser() {
    this.userService.userObservable?.subscribe((user) => {
      this.user = user;
    });
  }
}
