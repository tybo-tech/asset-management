import { Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
  selector: 'app-confirm-box',
  templateUrl: './confirm-box.component.html',
  styleUrls: ['./confirm-box.component.scss']
})
export class ConfirmBoxComponent {
  @Input() title: string = 'Confirm Action'; // Default title
  @Input() message: string = 'Delete'; // Default message
  @Output() confirmResult = new EventEmitter<boolean>();

  onCancel(): void {
    this.confirmResult.emit(false);
  }

  onConfirm(): void {
    this.confirmResult.emit(true);
  }
}
