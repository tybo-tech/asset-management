import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { TOAST, toast } from 'src/app/functions';
import { Requisition, RequisitionItem } from 'src/models/Requisition';
import { API } from 'src/app/constants';

@Injectable({
  providedIn: 'root',
})
export class RequisitionService {
  private readonly base = `${API}/requisition`;
  private requisitionList = new BehaviorSubject<Requisition[]>([]);
  $requisitionList = this.requisitionList.asObservable();

  constructor(private http: HttpClient) {}

  // Create a new requisition
  add(requisition: Requisition): Observable<Requisition> {
    return this.http.post<Requisition>(`${this.base}/add.php`, requisition);
  }

  // Update an existing requisition
  update(requisition: Requisition): Observable<Requisition> {
    return this.http.post<Requisition>(`${this.base}/update.php`, requisition);
  }

  // Fetch all requisitions
  getAll(params = ''): void {
    this.http
      .get<Requisition[]>(`${this.base}/list.php?${params}`)
      .subscribe((data) => {
        if (data && Array.isArray(data)) {
          this.requisitionList.next(data);
        }
      });
  }

  // Fetch requisition by ID
  getById(id: number): Observable<Requisition> {
    return this.http.get<Requisition>(`${this.base}/getById.php?id=${id}`);
  }

  // Update requisition status
  updateStatus(
    id: number,
    status: string,
    approvedBy: string
  ): Observable<Requisition> {
    return this.http.post<Requisition>(
      `${this.base}/update-status.php`,
      { id, status, approvedBy }
    );
  }

  // Upadte Update requisition item room Id

  updatItem(item: RequisitionItem): Observable<RequisitionItem> {
    return this.http.post<RequisitionItem>(
      `${this.base}/update-item.php`,
      item
    );
  }

  // Delete requisition
  remove(id: number): void {
    this.http.post<void>(`${this.base}/remove.php`, { id }).subscribe(() => {
      this.getAll();
      toast('Requisition deleted successfully', TOAST.success);
    });
  }

  // Download requisition PDF
  download(url: string, filename: string): void {
    this.http
      .get<Blob>(url, { responseType: 'blob' as 'json' })
      .subscribe((response) => {
        let binaryData = [];
        binaryData.push(response);
        let downloadLink = document.createElement('a');
        downloadLink.href = window.URL.createObjectURL(
          new Blob(binaryData, { type: response.type })
        );
        if (filename) downloadLink.setAttribute('download', filename);
        document.body.appendChild(downloadLink);
        downloadLink.click();
      });
  }
}
