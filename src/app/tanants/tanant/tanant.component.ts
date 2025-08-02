import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { toast } from 'src/app/functions';
import {
  initOtherInfo,
  initTenant,
  IRoom,
  ITenant,
  OTHER_TYPES,
  OtherInfo,
} from 'src/models/other-info.model';
import { PAGES } from 'src/models/Schema';
import { OtherInfoService } from 'src/services/other-info.service';

@Component({
  selector: 'app-tanant',
  templateUrl: './tanant.component.html',
  styleUrls: ['./tanant.component.scss'],
})
export class TanantComponent {
  page = PAGES.tanant;
  data?: OtherInfo<ITenant>;
  rooms: OtherInfo<IRoom>[] = [];

  id = '';
  constructor(
    private tenantService: OtherInfoService<ITenant>,
    private roomService: OtherInfoService<IRoom>,
    private activatedRoute: ActivatedRoute
  ) {
    activatedRoute.params.subscribe((params) => {
      this.id = params['id'];
      this.get();
      this.getRooms();
    });
  }
  get() {
    if ('add' === this.id) {
      this.data = initOtherInfo<ITenant>(
        OTHER_TYPES.Tanants,
        '1',
        initTenant()
      );
      return;
    }

    this.tenantService.get(this.id).subscribe((data) => {
      this.data = data;
    });
  }

  save() {
    if (!this.data) return;
    this.data.Name = this.data.ItemValue.Name;
    this.data.Status = 'Active';
    this.tenantService.save(this.data).subscribe((data) => {
      if (data && data.Id) {
        toast('Saved');
      } else {
        toast('Error saving');
      }
    });
  }

  getRooms() {
    this.roomService
      .search({ ItemType: OTHER_TYPES.Rooms })
      .subscribe((data) => {
        this.rooms = data || [];
      });
  }
  onRoomChange() {
    if (!this.data) return;
    this.data.ItemValue.Room =
      this.rooms.find((r) => r.Id === Number(this.data?.ItemValue.RoomId))
        ?.ItemValue.RoomNo || '';
    // toast(this.data.ItemValue.Room + ' selected');
  }
}
