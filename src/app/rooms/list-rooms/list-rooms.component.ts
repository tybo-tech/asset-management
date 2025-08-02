import { Component } from '@angular/core';
import { IRoom, OTHER_TYPES, OtherInfo } from 'src/models/other-info.model';
import { PAGES } from 'src/models/Schema';
import { OtherInfoService } from 'src/services/other-info.service';

@Component({
  selector: 'app-list-rooms',
  templateUrl: './list-rooms.component.html',
  styleUrls: ['./list-rooms.component.scss'],
})
export class ListRoomsComponent {
  page = PAGES.room;
  rooms: OtherInfo<IRoom>[] = [];
  search = '';
  constructor(private roomService: OtherInfoService<IRoom>) {
    this.getRooms();
  }
  getRooms() {
    this.roomService
      .search({ ItemType: OTHER_TYPES.Rooms })
      .subscribe((data) => {
        this.rooms = data || [];
      });
  }
}
