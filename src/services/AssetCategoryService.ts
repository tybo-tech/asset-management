import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface AssetCategory {
  id?: number;
  name: string;
  // Add other fields as needed
}

@Injectable({ providedIn: 'root' })
export class AssetCategoryService {
  private baseUrl = '/api/assetCategory';

  constructor(private http: HttpClient) {}

  add(assetCategory: AssetCategory): Observable<any> {
    return this.http.post(`${this.baseUrl}/add.php`, assetCategory);
  }

  getById(id: number): Observable<AssetCategory> {
    return this.http.get<AssetCategory>(`${this.baseUrl}/getById.php?id=${id}`);
  }

  list(): Observable<AssetCategory[]> {
    return this.http.get<AssetCategory[]>(`${this.baseUrl}/list.php`);
  }

  update(assetCategory: AssetCategory): Observable<any> {
    return this.http.post(`${this.baseUrl}/update.php`, assetCategory);
  }

  remove(id: number): Observable<any> {
    return this.http.post(`${this.baseUrl}/remove.php`, { id });
  }
}
