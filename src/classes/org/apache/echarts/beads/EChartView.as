package classes.org.apache.echarts.beads
{
    import org.apache.royale.core.IStrand;
    import org.apache.royale.html.beads.GroupView;
    import org.apache.royale.html.elements.Div;
    import org.apache.royale.jewel.Group;

	public class EChartView extends GroupView 
	{
		public function EChartView()
		{
			super();
		}
		
		protected var chartDiv:Div;
		protected var chart:Object;
		
		override public function set strand(value:IStrand):void
		{
			super.strand = value;
			        
	        chartDiv = new Div();
	        chartDiv.percentHeight = 100;
	        chartDiv.percentWidth = 100;
	        
	        (this.host as Group).addElement(chartDiv);
	        
	        chart = window["echarts"].init(chartDiv.element);
			chart.on("finished", onChartFinished);
		}
		
		protected function onChartFinished(event:Event):void
		{
			chart.resize();
			host.dispatchEvent(new Event("echartFinished"));
			
			chart.off("finished", onChartFinished);
		}
	}
}