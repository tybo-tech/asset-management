export class SearchModel {
  ParentId: string;
  filters: Filter[];

  constructor(ParentId: string, filters: Filter[] = []) {
    this.ParentId = ParentId;
    this.filters = filters;
  }
}

export class Filter {
  field: string;
  operator: FilterOperator;
  value: any; // Use 'any' for flexibility or define a more specific type if possible

  constructor(field: string, operator: FilterOperator, value: any) {
    this.field = field;
    this.operator = operator;
    this.value = value;
  }
}

export enum FilterOperator {
  Equals = 'equals',
  Contains = 'contains',
  In = 'in',
  LessThan = 'less_than',
  GreaterThan = 'greater_than',
}
