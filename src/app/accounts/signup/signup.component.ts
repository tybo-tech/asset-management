import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { User, initUser } from 'src/models/user.model';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss'],
})
export class SignupComponent {
  new_user: User;
  typeOfUser = 'Customer';
  returnUrl = '';
  errors = {
    email: '',
    password: '',
    name: '',
  };
  user?: User;
  constructor(
    private userServcice: UserService,
    private route: ActivatedRoute,
    private router: Router
  ) {
    this.new_user = initUser(this.typeOfUser);
    this.user = this.userServcice.getUser;
    // Get return url from query parameters or default to home
    this.route.params.subscribe((params) => {
      this.returnUrl = params['id'] || '';
    });
  }

  sign_up() {
    if (!this.validate()) return;
    this.userServcice.save(this.new_user).subscribe((user) => {
      if (user && user.CreateDate) {
        this.userServcice.updateUserState(user);
        if(this.returnUrl){
          this.router.navigate(['/add-event-basic']);
          return;
        }
        // this.router.navigate([this.returnUrl]);
      } else {
        alert('Sign up failed');
      }
    });
  }
  validate() {
    let valid = true;
    this.errors = {
      email: '',
      password: '',
      name: '',
    };
    if (!this.new_user.Email) {
      this.errors.email = 'Email is required';
      valid = false;
    }
    if (!this.new_user.Password) {
      this.errors.password = 'Password is required';
      valid = false;
    }
    if (!this.new_user.Name) {
      this.errors.name = 'Name is required';
      valid = false;
    }

    return valid;
  }
}
