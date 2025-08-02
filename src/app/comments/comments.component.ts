import { Component, EventEmitter, Input, Output } from '@angular/core';
import { IComment, initComment } from 'src/models/Transaction';
import { User } from 'src/models/user.model';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-comments',
  templateUrl: './comments.component.html',
  styleUrls: ['./comments.component.scss'],
})
export class CommentsComponent {
  comment = '';
  @Input() comments: IComment[] = [];
  @Output() onSave = new EventEmitter<IComment[]>();
  user?: User;
  constructor(private userService: UserService) {
    userService.userObservable?.subscribe((user) => {
      this.user = user;
    });
  }
  addComment() {
    if (!this.comment || !this.user) return;
    this.comments.push(initComment(this.user.Name, this.comment.trim()));
    this.onSave.emit(this.comments);
    this.comment = '';
  }
}
