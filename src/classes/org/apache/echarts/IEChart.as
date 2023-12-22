package classes.org.apache.echarts
{
	import org.apache.royale.charts.core.IChart;

	public interface IEChart extends IChart
	{
		function get model():Object;
		function get options():Object;
		function get chartType():String;
		function setOptions(options:Object):void;
		function resetOptionsToDefault():void;
	}
}