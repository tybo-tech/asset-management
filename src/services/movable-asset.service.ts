import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { API } from 'src/app/constants';
import { Observable } from 'rxjs';
import { IResponse } from 'src/models/IResponse';
import {
  IAssetType,
  IAssetTransfer,
  IAssetLocation,
  ILocation,
} from 'src/models/movable-assets';

@Injectable({
  providedIn: 'root',
})
export class MovableAssetService {
  private readonly base = `${API}/movable-asset`;

  constructor(private http: HttpClient) {}

  // 🚀 Asset Type Endpoints

  addAssetType(asset: IAssetType): Observable<IResponse<IAssetType>> {
    return this.http.post<IResponse<IAssetType>>(
      `${this.base}/addAssetType.php`,
      asset
    );
  }

  updateAssetType(asset: IAssetType): Observable<IAssetType> {
    return this.http.put<IAssetType>(`${this.base}/updateAssetType.php`, asset);
  }

  listAssetTypes(): Observable<IAssetType[]> {
    return this.http.get<IAssetType[]>(`${this.base}/listAssetTypes.php`);
  }

  getAssetTypeById(id: number): Observable<IAssetType> {
    return this.http.get<IAssetType>(
      `${this.base}/getAssetTypeById.php?id=${id}`
    );
  }

  // 🔁 Transfer Assets

  transferAsset(transfer: IAssetTransfer): Observable<any> {
    return this.http.post<any>(`${this.base}/transferAsset.php`, transfer);
  }

  getTransferLogs(asset_type_id?: number): Observable<IAssetTransfer[]> {
    const url = asset_type_id
      ? `${this.base}/getTransferLogs.php?asset_type_id=${asset_type_id}`
      : `${this.base}/getTransferLogs.php`;
    return this.http.get<IAssetTransfer[]>(url);
  }

  // 📍 Distribution View

  getLocationDistribution(asset_type_id: number): Observable<IAssetLocation[]> {
    return this.http.get<IAssetLocation[]>(
      `${this.base}/getLocationDistribution.php?asset_type_id=${asset_type_id}`
    );
  }

  //getLocations.php
  getLocations(): Observable<ILocation[]> {
    return this.http.get<ILocation[]>(`${this.base}/getLocations.php`);
  }

  // 🔍 Data Consistency & Validation

  validateConsistency(asset_type_id: number): Observable<any> {
    return this.http.get<any>(
      `${this.base}/validateConsistency.php?asset_type_id=${asset_type_id}`
    );
  }

  reconcileDistribution(asset_type_id: number): Observable<any> {
    return this.http.post<any>(`${this.base}/reconcileDistribution.php`, {
      asset_type_id: asset_type_id,
    });
  }
}
