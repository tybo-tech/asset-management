import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { toast } from 'src/app/functions';
import { IKeyValue } from 'src/models/IKeyValue';
import {
  OtherInfo,
  ILocation,
  OTHER_TYPES,
  initLocation,
  initOtherInfo,
} from 'src/models/other-info.model';
import { PAGES } from 'src/models/Schema';
import { OtherInfoService } from 'src/services/other-info.service';

@Component({
  selector: 'app-location',
  templateUrl: './location.component.html',
  styleUrls: ['./location.component.scss'],
})
export class LocationComponent {
  page = PAGES.location;
  showLocationTypes = false;
  data?: OtherInfo<ILocation>;
  locationTypes: OtherInfo<IKeyValue>[] = [];
  statuses = ['Active', 'Inactive', 'Occupied', 'Vacant', 'Under Maintenance'];
  id = '';
  constructor(
    private service: OtherInfoService<ILocation>,
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private locationTypeService: OtherInfoService<IKeyValue>
  ) {
    activatedRoute.params.subscribe((params) => {
      this.id = params['id'];
      this.get();
      this.getTypes();
    });
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
  get() {
    if ('add' === this.id) {
      this.data = initOtherInfo<ILocation>(
        OTHER_TYPES.Locations,
        '1',
        initLocation()
      );
      return;
    }

    this.service.get(this.id).subscribe((data) => {
      this.data = data;
    });
  }

  save() {
    if (!this.data) return;
    this.data.Name = this.data.ItemValue.Name;
    if (!this.data.Status) this.data.Status = 'Active';
    this.service.save(this.data).subscribe((data) => {
      if (data && data.Id) {
        toast('Saved');
        this.router.navigate(['/locations']);
      } else {
        toast('Error saving');
      }
    });
  }
}
