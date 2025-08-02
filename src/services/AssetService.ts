import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable } from 'rxjs';
import { TOAST, toast } from 'src/app/functions';
import { Asset, AssetListParams, initAssetListParams } from 'src/models/Asset';
import { API } from 'src/app/constants';

@Injectable({
  providedIn: 'root',
})
export class AssetService {
  private readonly base = `${API}/asset`;
  private assetList = new BehaviorSubject<Asset[]>([]);
  $assetList = this.assetList.asObservable();

  constructor(private http: HttpClient, private router: Router) {}

  // Create
  add(asset: Asset) {
    return this.http.post<Asset>(`${this.base}/add.php`, asset);
  }

  // Read all

  // $category = isset($_GET['category']) ? $_GET['category'] : null;
  // $orderBy  = isset($_GET['orderBy']) ? $_GET['orderBy'] : 'createdDate';
  // $order    = isset($_GET['order']) ? $_GET['order'] : 'DESC';
  // $limit    = isset($_GET['limit']) ? (int)$_GET['limit'] : 10000;
  // $offset   = isset($_GET['offset']) ? (int)$_GET['offset'] : 0;
getAll(params: AssetListParams = initAssetListParams()): void {
  const searchParams = new URLSearchParams({
    category: params.category ?? '',
    orderBy: params.orderBy ?? 'createdDate',
    order: params.order ?? 'DESC',
    limit: params.limit !== undefined ? String(params.limit) : '10000',
    offset: params.offset !== undefined ? String(params.offset) : '0',
  }).toString();

  this.http
    .get<Asset[]>(`${this.base}/list.php?${searchParams}`)
    .subscribe((data) => {
      if (Array.isArray(data)) {
        this.assetList.next(data);
      }
    });
}


  // Read by ID
  getById(id: number): Observable<Asset> {
    return this.http.get<Asset>(`${this.base}/getById.php?id=${id}`);
  }

  // get assets range
  getAssetsRange(ids: number[]): Observable<Asset[]> {
    return this.http.post<Asset[]>(`${this.base}/getByIds.php`, [...ids]);
  }

  getByCode(assetCode: string): Observable<Asset> {
    return this.http.get<Asset>(`${this.base}/getByCode.php?code=${assetCode}`);
  }

  // Search
  search(query: string): Observable<Asset[]> {
    return this.http.get<Asset[]>(`${this.base}/search.php?query=${query}`);
  }

  // Update
  update(asset: Asset) {
    return this.http.post<{ asset: Asset; message: string }>(
      `${this.base}/update.php`,
      asset
    );
  }

  // adjustStock.php
  adjustStock(assetId: number, stockValue: number): Observable<Asset> {
    return this.http.post<Asset>(`${this.base}/adjustStock.php`, {
      assetId,
      stockValue,
    });
  }

  // Delete
  remove(id: number): void {
    this.http.post<void>(`${this.base}/remove.php`, { id }).subscribe(() => {
      this.getAll();
      toast('Asset deleted successfully', TOAST.success);
    });
  }

  // adjustStock(assetId: number, stockValue: number): void {
  //   this.getById(Number(assetId)).subscribe((asset) => {
  //     if (asset && asset.id) {
  //       if (!asset.stockInHand) {
  //         asset.stockInHand = 0;
  //       }
  //       asset.stockInHand = Number(asset.stockInHand);
  //       stockValue = Number(stockValue);
  //       asset.stockInHand += stockValue;
  //       this.http
  //         .post<{
  //           message: string;
  //           success: boolean;
  //           asset: Asset;
  //         }>(`${this.base}/update.php`, asset)
  //         .subscribe(() => {});
  //     }
  //   });
  // }

  download(url: string, filename: string) {
    this.http
      .get<Blob>(url, { responseType: 'blob' as 'json' })
      .subscribe((response) => {
        console.log(response);
        let dataType = response.type;
        let binaryData = [];
        binaryData.push(response);
        let downloadLink = document.createElement('a');
        downloadLink.href = window.URL.createObjectURL(
          new Blob(binaryData, { type: dataType })
        );
        if (filename) downloadLink.setAttribute('download', filename);
        document.body.appendChild(downloadLink);
        downloadLink.click();
      });
  }
}


export interface IAssetResponse {
  message: string;
  id: number;
  asset: Asset;
}