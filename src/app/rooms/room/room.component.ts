import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { toast } from 'src/app/functions';
import {
  initOtherInfo,
  initRoom,
  IRoom,
  OTHER_TYPES,
  OtherInfo,
} from 'src/models/other-info.model';
import { PAGES } from 'src/models/Schema';
import { OtherInfoService } from 'src/services/other-info.service';

@Component({
  selector: 'app-room',
  templateUrl: './room.component.html',
  styleUrls: ['./room.component.scss'],
})
export class RoomComponent {
  page = PAGES.room;
  data?: OtherInfo<IRoom>;
  id = '';
  constructor(
    private service: OtherInfoService<IRoom>,

    private activatedRoute: ActivatedRoute
  ) {
    activatedRoute.params.subscribe((params) => {
      this.id = params['id'];
      this.get();
    });
  }
  get() {
    if ('add' === this.id) {
      this.data = initOtherInfo<IRoom>(OTHER_TYPES.Rooms, '1', initRoom());
      return;
    }

    this.service.get(this.id).subscribe((data) => {
      this.data = data;
    });
  }

  save() {
    if (!this.data) return;
    this.data.Name = this.data.ItemValue.RoomNo;
    this.data.Status = 'Active';
    this.service.save(this.data).subscribe((data) => {
      if (data && data.Id) {
        toast('Saved successfully');
      } else {
        toast('Error saving');
      }
    });
  }
}
