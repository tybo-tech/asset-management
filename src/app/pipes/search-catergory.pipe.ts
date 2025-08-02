import { Pipe, PipeTransform } from '@angular/core';
import { Asset } from 'src/models/Asset';
import { Category } from 'src/models/Category';
import { OtherInfo } from 'src/models/other-info.model';
import { Transaction, TransactionDetail } from 'src/models/Transaction';

@Pipe({
  name: 'searchCatergory',
})
export class SearchCatergoryPipe implements PipeTransform {
  transform(value: Category[], query: string): Category[] {
    if (!query) return value;
    return value.filter((category) => {
      return category.name.toLowerCase().includes(query.toLowerCase());
    });
  }
}

  
@Pipe({
  name: 'searchAsset',
})
export class SearchAssetPipe implements PipeTransform {
  transform(value: Asset[], query: string): Asset[] {
    if (!query) return value;
    return value.filter((asset) => {
      return asset.name.toLowerCase().includes(query.toLowerCase()) ||
       asset.code.toLowerCase().includes(query.toLowerCase()) 
    });
  }
}

@Pipe({
  name: 'searchTransaction',
})
export class SearchTransactionPipe implements PipeTransform {
  transform(value: TransactionDetail[], query: string): TransactionDetail[] {
    if (!query) return value;
    return value.filter((asset) => {
      return asset.transactionType.toLowerCase().includes(query.toLowerCase()) ||
      asset.assetName.toLowerCase().includes(query.toLowerCase()) ||
      asset.categoryName.toLowerCase().includes(query.toLowerCase()) ||
      asset.createdBy.toLowerCase().includes(query.toLowerCase()) ||
      asset.lastUpdatedBy.toLowerCase().includes(query.toLowerCase())
    });
  }
}




@Pipe({
  name: 'searchOtherInfo',
})
export class SearchOtherInfoPipe implements PipeTransform {
  transform<T>(value: OtherInfo<T>[], query: string): OtherInfo<T>[] {
    if(!value || !value.length) return [];
    if (!query) return value;
    const first :any = value[0].ItemValue;
    const keys = Object.keys(first);
    return value.filter((otherInfo) => {
      return keys.some(key => {
        return first[key].toString().toLowerCase().includes(query.toLowerCase());
      });
    });

  }
}