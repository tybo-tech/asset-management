import { Component, OnInit, OnDestroy } from '@angular/core';
import { Observable, Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import { Module } from 'src/models/ModuleNavigation';
import { ModuleNavigationService } from 'src/services/ModuleNavigationService';

@Component({
  selector: 'app-module-selector',
  templateUrl: './module-selector.component.html',
  styleUrls: ['./module-selector.component.scss']
})
export class ModuleSelectorComponent implements OnInit, OnDestroy {
  
  currentModule$: Observable<Module> = this.moduleNavService.currentModule$;
  availableModules$: Observable<Module[]> = this.moduleNavService.getAvailableModules();
  
  private destroy$ = new Subject<void>();
  isDropdownOpen = false;

  constructor(private moduleNavService: ModuleNavigationService) {}

  ngOnInit(): void {
    // Initialize module from storage
    this.moduleNavService.initializeFromStorage();
  }

  ngOnDestroy(): void {
    this.destroy$.next();
    this.destroy$.complete();
  }

  switchModule(moduleId: string): void {
    const success = this.moduleNavService.switchModule(moduleId);
    if (success) {
      this.isDropdownOpen = false;
      // Optionally show success message
      console.log(`Switched to ${moduleId} module`);
    } else {
      // Show error message
      console.error(`Failed to switch to ${moduleId} module`);
    }
  }

  toggleDropdown(): void {
    this.isDropdownOpen = !this.isDropdownOpen;
  }

  closeDropdown(): void {
    this.isDropdownOpen = false;
  }
}
