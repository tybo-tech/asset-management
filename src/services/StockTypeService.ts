import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { StockType } from 'src/models/AssetType';
import { API } from 'src/app/constants';



@Injectable({ providedIn: 'root' })
export class StockTypeService {
    private readonly baseUrl = `${API}/stockType`;

  constructor(private http: HttpClient) {}

  add(stockType: StockType): Observable<any> {
    return this.http.post(`${this.baseUrl}/add.php`, stockType);
  }

  getById(id: number): Observable<StockType> {
    return this.http.get<StockType>(`${this.baseUrl}/getById.php?id=${id}`);
  }

  list(): Observable<StockType[]> {
    return this.http.get<StockType[]>(`${this.baseUrl}/list.php`);
  }

  update(stockType: StockType): Observable<any> {
    return this.http.post(`${this.baseUrl}/update.php`, stockType);
  }

  remove(id: number): Observable<any> {
    return this.http.post(`${this.baseUrl}/remove.php`, { id });
  }
}
