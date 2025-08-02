import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable } from 'rxjs';
import { TOAST, toast } from 'src/app/functions';
import { Category } from 'src/models/Category';
import { API } from 'src/app/constants';
import { IResponse } from 'src/models/IResponse';

@Injectable({
  providedIn: 'root',
})
export class CategoryService {
  private readonly base = `${API}/category`;

  private categoryList = new BehaviorSubject<Category[]>([]);
  $categoryList = this.categoryList.asObservable();

  constructor(private http: HttpClient, private router: Router) {}

  // Create
  add(category: Category) {
    return this.http.post<IResponse<Category>>(
      `${this.base}/add.php`,
      category
    );
  }

  // Read all
  getAll() {
    return this.http.get<Category[]>(`${this.base}/list.php`);
  }

  // Read by ID
  getById(id: number): Observable<Category> {
    return this.http.get<Category>(`${this.base}/getById.php?id=${id}`);
  }
  getByCode(code: string): Observable<Category> {
    return this.http.get<Category>(`${this.base}/getByCode.php?code=${code}`);
  }

  // Update
  update(category: Category, returnUrl: string, successMessage: string): void {
    this.http
      .put<Category>(`${this.base}/update.php`, category)
      .subscribe(() => {
        successMessage && toast(successMessage, TOAST.success);
        returnUrl && this.router.navigate([returnUrl]);
      });
  }

  // Delete
  remove(id: number) {
    return this.http.post<any>(`${this.base}/remove.php?id=${id}`,{id});
  }
}
