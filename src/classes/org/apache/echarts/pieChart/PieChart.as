package classes.org.apache.echarts.pieChart
{
	import classes.org.apache.echarts.EChart;

	public class PieChart extends EChart
	{
		public function PieChart()
		{
			super();
			
			className = "echartPieChart";
		}
		
		override public function get chartType():String
		{
			return "pie";
		}
	}
}