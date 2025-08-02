import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { IKeyValue } from 'src/models/IKeyValue';
import { Role } from 'src/models/Role';
import { RoleService } from 'src/services/RoleService';

@Component({
  selector: 'app-role-feature-picker',
  templateUrl: './role-feature-picker.component.html',
  styleUrls: ['./role-feature-picker.component.scss'],
})
export class RoleFeaturePickerComponent implements OnInit {
  @Input() data?: Role;
  loading = false;
  showPicker = false;

  columns: IKeyValue[] = [
    {
      value: 'Feature Name',
      key: 'name',
    },
  ];
  allFeatures?: { id: number; name: string }[];
  constructor(private dataService: RoleService) {}
  ngOnInit(): void {
    this.loading = true;
    this.dataService.getAllFeatures().subscribe((data) => {
      this.allFeatures = data;
      this.loading = false;
    });
  }

  isFeatureAllowed(input: { id: number; name: string }) {
    return this.data?.features?.some((x) => x.name === input.name);
  }
  toggleFeature(input: { id: number; name: string }) {
    if (!this.data) return;
    if (this.isFeatureAllowed(input)) {
      this.data.features = this.data.features?.filter((x) => x.name !== input.name);
      this.loading = true;
      this.dataService
        .removeFeatureFromRole(this.data.id, input.id)
        .subscribe((data) => {
          this.loading = false;
        });
    } else {
      this.data.features = [...(this.data.features || []), input];
      this.loading = true;
      this.dataService
        .addFeatureToRole(this.data.id, input.id)
        .subscribe((data) => {
          this.loading = false;
        });
    }
  }
  onClose() {
    this.showPicker = false;
  }
}
