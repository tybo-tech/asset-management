import { Component } from '@angular/core';
import { IKeyValue } from 'src/models/IKeyValue';
import { ILocation, OTHER_TYPES, OtherInfo } from 'src/models/other-info.model';
import { PAGES } from 'src/models/Schema';
import { OtherInfoService } from 'src/services/other-info.service';

@Component({
  selector: 'app-list-location',
  templateUrl: './list-location.component.html',
  styleUrls: ['./list-location.component.scss'],
})
export class ListLocationComponent {
  page = PAGES.location;
  locations: OtherInfo<ILocation>[] = [];
  locationTypes: OtherInfo<IKeyValue>[] = [];
  search = '';
  constructor(
    private service: OtherInfoService<ILocation>,
    private service2: OtherInfoService<IKeyValue>
  ) {
    service2
      .search({ ItemType: OTHER_TYPES.LocationTypes })
      .subscribe((locationTypes) => {
        this.locationTypes = locationTypes;
        service
          .search({ ItemType: OTHER_TYPES.Locations })
          .subscribe((locations) => {
            this.locations = locations;
          });
      });
  }

  locationTypeName(id: number) {
    const type = this.locationTypes.find((t) => Number(t.Id) === Number(id));
    return type ? type.Name : '';
  }
}
