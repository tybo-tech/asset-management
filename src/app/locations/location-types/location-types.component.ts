import { Component, EventEmitter, Output } from '@angular/core';
import { toast } from 'src/app/functions';
import { IKeyValue } from 'src/models/IKeyValue';
import {
  initOtherInfo,
  OTHER_TYPES,
  OtherInfo,
} from 'src/models/other-info.model';
import { OtherInfoService } from 'src/services/other-info.service';

@Component({
  selector: 'app-location-types',
  templateUrl: './location-types.component.html',
  styleUrls: ['./location-types.component.scss'],
})
export class LocationTypesComponent {
  locationTypes: OtherInfo<IKeyValue>[] = [];
  @Output() close = new EventEmitter();
  statuses = ['Active', 'Inactive', 'Occupied', 'Vacant', 'Under Maintenance'];
  newLocationType = '';
  newLocationStatus = 'Active';
  constructor(private locationTypeService: OtherInfoService<IKeyValue>) {
    this.getTypes();
  }
  getTypes() {
    this.locationTypeService
      .search({
        ItemType: OTHER_TYPES.LocationTypes,
        ParentId: OTHER_TYPES.Id,
      })
      .subscribe((data) => {
        this.locationTypes = data || [];
      });
  }
  addLocationType() {
    const cms = initOtherInfo<IKeyValue>(
      OTHER_TYPES.LocationTypes,
      OTHER_TYPES.Id,
      {
        key: '',
        value: this.newLocationType,
      }
    );
    cms.Status = this.newLocationStatus;
    cms.Name = this.newLocationType;
    this.locationTypeService.save(cms).subscribe((data) => {
      if (data && data.Id) {
        this.locationTypes.push(data);
        this.newLocationType = '';
        this.newLocationStatus = 'Active';
        toast('Saved');
      }
    });
  }

  update(item: OtherInfo<IKeyValue>) {
    item.Name = item.ItemValue.value;
    this.locationTypeService.save(item).subscribe((data) => {
      toast('Saved');
    });
  }

  delete(item: OtherInfo<IKeyValue>) {
    if (!confirm('Are you sure you want to delete this item?')) return;
    this.locationTypeService.delete(item.Id).subscribe((data) => {
      this.getTypes();
      toast('Deleted');
    });
  }
}
