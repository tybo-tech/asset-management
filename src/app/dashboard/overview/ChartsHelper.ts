import { IBarChart, IDoughnutChart, initBarChart } from 'src/models/Charts';
import { ILocationCount } from 'src/services/count.service';

export class ChartsHelper {
  static locationCountsToDoughnutChart(data: ILocationCount[]): IDoughnutChart {
    return {
      labels: data.map((d) => d.location),
      datasets: [
        {
          label: 'Issued by Location',
          data: data.map((d) => d.totalTransactions),
          backgroundColor: this.getColours(data),
          hoverOffset: 4,
        },
      ],
    };
  }

  static getColours(data: any[]): string[] {
    return data.map(() => {
      return `rgba(${Math.floor(Math.random() * 255)}, ${Math.floor(
        Math.random() * 255
      )}, ${Math.floor(Math.random() * 255)}, 0.7)`; // Adjust alpha as needed
    });
  }

  static stockLevelsToBarChart(data: IStockLevel[]): IBarChart {
    const bar = initBarChart();
    bar.labels = data.map((d) => d.name);
    bar.datasets[0].data = data.map((d) => d.stockInHand);
    bar.datasets[0].backgroundColor = this.getColours(data);
    bar.datasets[0].borderColor = this.getColours(data);
    bar.datasets[0].borderWidth = 1;
    return bar;
  }
}

export interface IStockLevel {
  category: string;
  id: number;
  name: string;
  stockInHand: number;
}
