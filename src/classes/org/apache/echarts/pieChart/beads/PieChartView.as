package classes.org.apache.echarts.pieChart.beads
{
    import classes.org.apache.echarts.IEChart;
    import classes.org.apache.echarts.beads.EChartView;
    import classes.org.apache.echarts.pieChart.PieChart;
    import classes.org.apache.echarts.pieChart.interfaces.IPieChartModel;

    import org.apache.royale.core.IStrand;

	public  class PieChartView extends EChartView 
	{
		public function PieChartView()
		{
			super();
		}
		
		private var _model:IPieChartModel;
		
		override public function set strand(value:IStrand):void
	    {
	        super.strand = value;

	        this._model = (host as IEChart).model as IPieChartModel;
        }
        
        override protected function onChartFinished(event:Event):void
        {  		
        		refreshSeries();
        		
        		super.onChartFinished(event);
        }
        
        private function refreshSeries():void
        {
        		var pieChart:PieChart = (host as PieChart);
        		for each (var s:Object in pieChart.series)
        		{
        			s.type = pieChart.chartType;
        		}
        		
        		pieChart.options.series = pieChart.series;
        		chart.setOption(pieChart.options);
        }
	}
}