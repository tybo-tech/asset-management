import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable } from 'rxjs';
import { TOAST, toast } from 'src/app/functions';
import { Transaction, TransactionDetail } from 'src/models/Transaction';
import { API } from 'src/app/constants';

@Injectable({
  providedIn: 'root',
})
export class TransactionService {
  private readonly base = `${API}/transaction`;

  private transactionList = new BehaviorSubject<Transaction[]>([]);
  $transactionList = this.transactionList.asObservable();

  constructor(private http: HttpClient, private router: Router) {}

  // Create
  add(transaction: Transaction) {
    return this.http.post<Transaction>(
      `${this.base}/add.php`,
      transaction
    );
  }

  // Read all
  getAll(): void {
    this.http.get<Transaction[]>(`${this.base}/list.php`).subscribe((data) => {
      if (data && Array.isArray(data)) {
        this.transactionList.next(data);
      }
    });
  }
  // Read all detailed
  detailed(transactionType: 'restock' | 'usage') {
    return this.http.get<TransactionDetail[]>(
      `${this.base}/detailed.php?type=${transactionType}`
    );
  }

  // Read by ID
  getById(id: number): Observable<Transaction> {
    return this.http.get<Transaction>(`${this.base}/getById.php?id=${id}`);
  }

  // Update
  update(transaction: Transaction): Observable<Transaction> {
    return this.http.post<Transaction>(
      `${this.base}/update.php`,
      transaction
    );
  }

  // Delete
  remove(id: number): void {
    this.http.delete<void>(`${this.base}/remove.php?id=${id}`).subscribe(() => {
      this.getAll();
    });
  }
}

// export interface ITransactionResponse {
//   message: string;
//   id: number;
//   transaction: Transaction;
// }
