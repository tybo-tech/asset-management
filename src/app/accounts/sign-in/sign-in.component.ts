import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { LOGO } from 'src/app/constants';
import { User } from 'src/models/user.model';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.scss'],
})
export class SignInComponent implements OnInit {
  signInForm: FormGroup;
  returnUrl = '';
  logo = LOGO;
  constructor(
    private fb: FormBuilder,
    private userServcice: UserService,
    private route: ActivatedRoute,
    private router: Router
  ) {
    this.signInForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
    });
    this.route.params.subscribe((params) => {
      this.returnUrl = params['id'] || '';
    });
  }

  ngOnInit(): void {
    if (this.userServcice.getUser?.UserType) {
      this.after_sign_in(this.userServcice.getUser);
    }
  }

  login(): void {
    if (this.signInForm.valid) {
      const { email, password } = this.signInForm.value;
      this.userServcice
        .login({ Email: email, Password: password })
        .subscribe((user) => {
          if (user && user.UserId) {
            this.userServcice.updateUserState(user);
            this.after_sign_in(user);
          }
        });
    }
  }
  after_sign_in(user: User) {
    // this.router.navigate(['/dashboard']);
    // location.reload();
    location.href = '/dashboard';
  }
}
