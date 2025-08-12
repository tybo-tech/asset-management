import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { API } from 'src/app/constants';

@Injectable({
  providedIn: 'root',
})
export class CountService {
    private readonly base = `${API}/counts`;


  constructor(private http: HttpClient, private router: Router) {}
  all() {
    return this.http.get<ICountResponse>(`${this.base}/all.php`);
  }
  formatNumber(count: number): string {
    if (count < 9) return `00${count}`;
    return count + '';
  }
}

export interface ICount {
  url: string;
  icon: string;
  Label: string;
  Value: number;
}

export interface ICountResponse {
  topIssuedAssets: ITopIssuedAsset[];
  user: ICount[];
  other: ICount[];
  restock: ICount[];
  usage: ICount[];
  asset: ICount[];
  category: ICount[];
  lowStock: ILowStock[];
  Location:ILocationCount[];
  stockLevels: IStockLevel[];
}

export interface ITopIssuedAsset {
  name: string;
  count: number;
  assetId?: number;
  category?: string;
  url?: string;
  icon?: string;
}

export interface ILowStock {
  name: string;
  stockInHand: number;
  minimumStockAlert: number;
  id: number;
}

export interface ILocationCount {
  totalTransactions: number;
  location: string;
}

export interface IStockLevel {
  category: string;
  id: number;
  name: string;
  stockInHand: number;
}
