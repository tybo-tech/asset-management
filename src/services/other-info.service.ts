import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import {
  OtherInfo,
  OTHER_TYPES,
  OtherInfoSearchModel,
} from 'src/models/other-info.model';
import { SearchModel } from 'src/models/SearchModel';
import { toast } from 'src/app/functions';
import { API } from 'src/app/constants';

@Injectable({
  providedIn: 'root',
})
export class OtherInfoService<T> {
  url: string;

  constructor(private http: HttpClient) {
    this.url = `${API}`;
  }
  //save-range.php
  saveRange(data: OtherInfo<T>[]): Observable<OtherInfo<T>[]> {
    const copy = data.map((d) => this.validate(d)).filter((d) => d);
    if (!copy.length)
      return new BehaviorSubject<OtherInfo<T>[]>(data).asObservable();
    return this.http.post<OtherInfo<T>[]>(
      `${this.url}/other_info/save-range.php`,
      copy
    );
  }
  save(data: OtherInfo<T>): Observable<OtherInfo<T>> {
    const copy = this.validate(data);
    if (!copy) {
      return new BehaviorSubject<OtherInfo<T>>(data).asObservable();
    }
    if (copy.Children && copy.Children.length) {
      delete copy.Children;
    }
    return this.http.post<OtherInfo<T>>(
      `${this.url}/other_info/save.php`,
      copy
    );
  }

  hasVal(val: string, name: string, suffix = 'Please enter') {
    if (!val) {
      toast(`${suffix} ${name}`);
      return false;
    }
    return true;
  }

  validate(data: OtherInfo<T>): OtherInfo<T> | undefined {
    // const { CreateDate, Name } = data;
    // if (
    //   !this.hasVal(CreateDate || '', 'CreateDate') &&
    //   !this.hasVal(Name, 'Name')
    // )
    //   return undefined;
    if (!this.hasVal(data.Status, 'Status')) return undefined;

    data.OwnerId = OTHER_TYPES.Id;
    const copy: OtherInfo<T> = JSON.parse(JSON.stringify(data));
    return copy;
  }

  list(otherId: number): Observable<OtherInfo<T>[]> {
    return this.http.get<OtherInfo<T>[]>(
      `${this.url}/other_info/list.php?OtherId=${otherId}`
    );
  }
  listByName(name: string): Observable<OtherInfo<T>[]> {
    return this.http.get<OtherInfo<T>[]>(
      `${this.url}/other_info/list-by-name.php?name=${name}`
    );
  }
  listByCode(itemType: string, itemCode: string): Observable<OtherInfo<T>[]> {
    return this.http.get<OtherInfo<T>[]>(
      `${this.url}/other_info/list-by-code.php?type=${itemType}&code=${itemCode}`
    );
  }
  // listByType(itemCode: string): Observable<OtherInfo<T>[]> {
  //   return this.http.get<OtherInfo<T>[]>(
  //     `${this.url}/other_info/list.php?ItemCode=${itemCode}`
  //   );
  // }

  get(id: string | number, id2 = ''): Observable<OtherInfo<T>> {
    return this.http.get<OtherInfo<T>>(
      `${this.url}/other_info/get.php?id=${id}&id2=${id2}`
    );
  }
  website(websiteId: string, pageId = ''): Observable<OtherInfo<T>> {
    return this.http.get<OtherInfo<T>>(
      `${this.url}/website/website.php?websiteId=${websiteId}&pageId=${pageId}`
    );
  }
  delete(id: number) {
    return this.http.get<OtherInfo<T>>(
      `${this.url}/other_info/delete.php?Id=${id}`
    );
  }
  search(search: OtherInfoSearchModel) {
    return this.http.get<OtherInfo<T>[]>(
      `${this.url}/other_info/search.php?ParentId=${
        search.ParentId || '1'
      }&ItemType=${search.ItemType}&ProductCount=${search.ProductCount}`
    );
  }
  find(search: SearchModel) {
    return this.http.post<OtherInfo<T>[]>(
      `${this.url}/other_info/find.php`,
      search
    );
  }
  distinct(key: string, type: string) {
    return this.http.get<string[]>(
      `${this.url}/other_info/find-distinct.php?key=${key}&type=${type}`
    );
  }
  distinctByName(type: string) {
    return this.http.get<string[]>(
      `${this.url}/other_info/find-distinct-by-name.php?type=${type}`
    );
  }
}
