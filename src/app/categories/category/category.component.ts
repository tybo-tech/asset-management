import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { TOAST, toast } from 'src/app/functions';
import { Category, initCategory } from 'src/models/Category';
import { PAGES } from 'src/models/Schema';
import { CategoryService } from 'src/services/CategoryService';
import { DataService } from 'src/services/DataService';

@Component({
  selector: 'app-category',
  templateUrl: './category.component.html',
  styleUrls: ['./category.component.scss'],
})
export class CategoryComponent {
  id = '';
  data?: Category;
  page = PAGES.category;
  isAdd = false;
  loading = false;
  constructor(
    private activatedRoute: ActivatedRoute,
    private dataService: CategoryService,
    private router: Router
  ) {
    activatedRoute.params.subscribe((p) => {
      this.id = p['id'];
      this.get();
    });
  }

  get() {
    if ('add' === this.id) {
      this.isAdd = true;
      this.data = initCategory();
      return;
    }
    this.isAdd = false;
    this.loading = true;
    this.dataService.getById(Number(this.id)).subscribe((data) => {
      this.data = data;
      this.loading = false;
    });
  }
  save() {
    if (!this.data) return;
    if (!this.data.name) {
      toast('Name is required', TOAST.warn);
      return;
    }
    this.isAdd &&
     this.add();
    !this.isAdd &&
      this.dataService.update(
        this.data,
        this.page.listUrl,
        this.page.updateSuccess
      );
  }

  add(){
    if(!this.data) return;
    this.loading = true;
    this.dataService.getByCode(this.data.code).subscribe((existing) => {
      this.loading = false;
      if(existing && existing.id){
        toast('Category with code already exists', TOAST.warn);
        return;
      }else{
        this.loading = true;
        this.data &&
        this.dataService.add(this.data).subscribe((res) => {
          this.loading = false;
          if(res && res.message && res.message.includes('success')){
            toast('Category added successfully', TOAST.success);
            this.page.listUrl && this.router.navigate([this.page.listUrl]);
          }
        });
      }
    });
  }

}
