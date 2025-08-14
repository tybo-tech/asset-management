import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface AssetType {
  id?: number;
  name: string;
  code: string;
  // Add other fields as needed
}

@Injectable({ providedIn: 'root' })
export class AssetTypeService {
  private baseUrl = '/api/assetType';

  constructor(private http: HttpClient) {}

  add(assetType: AssetType): Observable<any> {
    return this.http.post(`${this.baseUrl}/add.php`, assetType);
  }

  getById(id: number): Observable<AssetType> {
    return this.http.get<AssetType>(`${this.baseUrl}/getById.php?id=${id}`);
  }

  list(): Observable<AssetType[]> {
    return this.http.get<AssetType[]>(`${this.baseUrl}/list.php`);
  }

  update(assetType: AssetType): Observable<any> {
    return this.http.post(`${this.baseUrl}/update.php`, assetType);
  }

  remove(id: number): Observable<any> {
    return this.http.post(`${this.baseUrl}/remove.php`, { id });
  }
}
