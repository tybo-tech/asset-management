import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Location {
  id?: number;
  name: string;
  building?: string;
  floor?: string;
  type: string;
  metadata?: any;
  updated_at?: string;
}

@Injectable({ providedIn: 'root' })
export class LocationService {
  private baseUrl = '/api/location';

  constructor(private http: HttpClient) {}

  add(location: Location): Observable<any> {
    return this.http.post(`${this.baseUrl}/add.php`, location);
  }

  getById(id: number): Observable<Location> {
    return this.http.get<Location>(`${this.baseUrl}/getById.php?id=${id}`);
  }

  list(): Observable<Location[]> {
    return this.http.get<Location[]>(`${this.baseUrl}/list.php`);
  }

  update(location: Location): Observable<any> {
    return this.http.post(`${this.baseUrl}/update.php`, location);
  }

  remove(id: number): Observable<any> {
    return this.http.post(`${this.baseUrl}/remove.php`, { id });
  }
}
