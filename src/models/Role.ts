export interface Role {
  id: number;
  name: string;
  description: string;
  features?: { id: number; name: string; featureId?: number }[];
}
