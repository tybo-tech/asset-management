import { Injectable } from '@angular/core';
import { Asset } from 'src/models/Asset';
import { TransactionDetail } from 'src/models/Transaction';

@Injectable({
  providedIn: 'root',
})
export class CsvService {
  exportRequisitionsToCsv(arg0: string, list: import("../models/Requisition").Requisition[]) {
    throw new Error('Method not implemented.');
  }
  exportTransactionsToCsv(filename: string, rows: TransactionDetail[]) {
    if (!rows || !rows.length) {
      return;
    }

    const separator = ',';
    // Define the CSV headers specific to WalkIn fields
    const csvHeaders = [
      'Asset',
      'Category',
      'Quantity',
      'Status',
      'Transaction Date',
      'Room',
      'Requested By',
      'Reason Code',
      'Completed By',
    ].join(separator);

    const csvContent =
      csvHeaders +
      '\n' +
      rows
        .map((row) => {
          // Extract fields specific to WalkIn and format them
          return [
            row.assetName,
            row.categoryName,
            row.quantity,
            row.status,
            row.transactionDate,
            row.metadata.room || '',
            row.metadata.requestedBy || '',
            row.metadata.reasonCode || '',
            row.createdByName || '',
          ]
            .map((value) => value.toString().replace(/"/g, '""')) // Escape quotes
            .map((value) => `"${value}"`) // Wrap in quotes
            .join(separator);
        })
        .join('\n');

    this.downloadCsvFile(filename, csvContent);
  }

  exportAssetsToCsv(filename: string, rows: Asset[]) {
    if (!rows || !rows.length) {
      return;
    }

    const separator = ',';
    // Define the CSV headers specific to WalkIn fields
    const csvHeaders = [
      'Code',
      'Name',
      'Status',
      'Stock',
      'Category',
      'Type',
      'Date Added',
    ].join(separator);

    const csvContent =
      csvHeaders +
      '\n' +
      rows
        .map((row) => {
          // Extract fields specific to WalkIn and format them
          return [
            row.code,
            row.name,
            row.status,
            row.stockInHand || '0',
            row.categoryName || '',
            row.metadata.assetType || '',
            row.createdDate || '',
          ]
            .map((value) => value.toString().replace(/"/g, '""')) // Escape quotes
            .map((value) => `"${value}"`) // Wrap in quotes
            .join(separator);
        })
        .join('\n');

    this.downloadCsvFile(filename, csvContent);
  }

  // Helper function to trigger CSV download
  private downloadCsvFile(filename: string, csvContent: string): void {
    const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement('a');
    if (link.download !== undefined) {
      const url = URL.createObjectURL(blob);
      link.setAttribute('href', url);
      link.setAttribute('download', filename);
      link.style.visibility = 'hidden';
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    }
  }
}
