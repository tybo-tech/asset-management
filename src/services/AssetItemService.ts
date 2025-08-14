import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface AssetItem {
  id?: number;
  code: string;
  name: string;
  assetTypeId?: number;
  // Add other fields as needed
}

@Injectable({ providedIn: 'root' })
export class AssetItemService {
  private baseUrl = '/api/assetItem';

  constructor(private http: HttpClient) {}

  add(assetItem: AssetItem): Observable<any> {
    return this.http.post(`${this.baseUrl}/add.php`, assetItem);
  }

  getById(id: number): Observable<AssetItem> {
    return this.http.get<AssetItem>(`${this.baseUrl}/getById.php?id=${id}`);
  }

  getByCode(code: string): Observable<AssetItem> {
    return this.http.get<AssetItem>(`${this.baseUrl}/getByCode.php?code=${code}`);
  }

  list(): Observable<AssetItem[]> {
    return this.http.get<AssetItem[]>(`${this.baseUrl}/list.php`);
  }

  update(assetItem: AssetItem): Observable<any> {
    return this.http.post(`${this.baseUrl}/update.php`, assetItem);
  }

  remove(id: number): Observable<any> {
    return this.http.post(`${this.baseUrl}/remove.php`, { id });
  }
}
