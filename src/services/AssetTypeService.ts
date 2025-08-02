import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable } from 'rxjs';
import { TOAST, toast } from 'src/app/functions';
import { AssetType } from 'src/models/AssetType';
import { API } from 'src/app/constants';
import { IResponse } from 'src/models/IResponse';

@Injectable({
  providedIn: 'root',
})
export class AssetTypeService {
  private readonly base = `${API}/asset-types`;

  private assetTypeList = new BehaviorSubject<AssetType[]>([]);
  $assetTypeList = this.assetTypeList.asObservable();

  constructor(private http: HttpClient, private router: Router) {}

  // Create
  add(assetType: AssetType) {
    return this.http.post<IResponse<AssetType>>(
      `${this.base}/add.php`,
      assetType
    );
  }
  addMany(assetType: AssetType) {
    return this.http.post<AssetType>(`${this.base}/aadd-many.php`, assetType);
  }

  // Read all
  getAll() {
    return this.http.get<AssetType[]>(`${this.base}/list.php`);
  }

  // Read by ID
  getById(id: number): Observable<AssetType> {
    return this.http.get<AssetType>(`${this.base}/getById.php?id=${id}`);
  }

  getByCode(code: string): Observable<AssetType> {
    return this.http.get<AssetType>(`${this.base}/getByCode.php?code=${code}`);
  }

  getByCategory(categoryId: number): Observable<AssetType[]> {
    return this.http.get<AssetType[]>(
      `${this.base}/getByCategory.php?categoryId=${categoryId}`
    );
  }

  // Update
  update(assetType: AssetType) {
    return this.http.put<IResponse<AssetType>>(`${this.base}/update.php`, assetType);
  }

  // Delete
  remove(id: number) {
    return this.http.delete<void>(`${this.base}/remove.php?id=${id}`);
  }

  // Status stats
  counts(): Observable<{ Label: string; Value: number }[]> {
    return this.http.get<{ Label: string; Value: number }[]>(
      `${this.base}/counts.php`
    );
  }
}
