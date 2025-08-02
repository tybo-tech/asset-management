import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable } from 'rxjs';
import { API } from 'src/app/constants';
import { TOAST, toast } from 'src/app/functions';

@Injectable({
  providedIn: 'root',
})
export class DataService<T> {
  private readonly base = `${API}`;
  loading = false;
  private baseUrl = '';
  private dataList = new BehaviorSubject<T[]>([]);
  $dataList = this.dataList.asObservable();
  constructor(private http: HttpClient, private router: Router) {}

  setBaseUrl(folder: string) {
    this.baseUrl = `${this.base}/${folder}`;
  }
  // Create
  add(item: T, returlUrl: string, addSuccess: string): void {
    this.loading = true;
    this.http.post<T>(`${this.baseUrl}/add.php`, item).subscribe((data) => {
      // this.getAll();
      this.loading = false;
      addSuccess && toast(addSuccess, TOAST.success);
      returlUrl && this.router.navigate([returlUrl]);
    });
  }

  // Read all
  getAll(): void {
    this.loading = true;
    this.http.get<T[]>(`${this.baseUrl}/list.php`).subscribe((data) => {
      this.loading = false;
      if (data && Array.isArray(data)) {
        this.setDataList(data);
      }
    });
  }

  // Read by ID
  getById(id: number): Observable<T> {
    return this.http.get<T>(`${this.baseUrl}/getById.php?id=${id}`);
  }
  // List by status
  getByStatus(status: string): Observable<T> {
    return this.http.get<T>(`${this.baseUrl}/getByStatus.php?status=${status}`);
  }

  // Update
  update(item: T, returlUrl: string, success: string) {
    this.loading = true;
    this.http.put<T>(`${this.baseUrl}/update.php`, item).subscribe((data) => {
      // this.getAll();
      this.loading = false;
      success && toast(success, TOAST.success);
      returlUrl && this.router.navigate([returlUrl]);
    });
  }

  // Delete
  remove(id: number): void {
    this.loading = true;
    this.http
      .delete<void>(`${this.baseUrl}/remove.php?id=${id}`)
      .subscribe(() => {
        this.loading = false;
        this.getAll();
      });
  }

  //Set data list
  setDataList(data: T[]) {
    this.dataList.next(data);
  }
}
