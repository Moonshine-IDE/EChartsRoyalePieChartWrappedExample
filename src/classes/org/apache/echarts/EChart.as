package classes.org.apache.echarts
{
    import classes.org.apache.echarts.IEChart;

    import org.apache.royale.jewel.Group;

    [Event(name="echartFinished", type="org.apache.royale.events.Event")]
	public class EChart extends Group implements IEChart
	{
		public function EChart()
		{
			super();
		}
		
		public function get chartType():String
		{
			return "";
		}
		
		private var _options:Object = {};

		public function get options():Object
		{
			return _options;
		}
		
		public function set options(value:Object):void
		{
			if (_options != value)
			{
				this.setOptions(value);
			}	
		}
		
		public function setOptions(opt:Object):void
		{
			if (!opt) return;
			
			var optionsChanged:Boolean = false;
			for (var o:String in opt)
			{
				_options[o] = opt[o];
				
				optionsChanged = true;
			}
			
			if (optionsChanged)
			{
				this.dispatchEvent(new Event("optionsChanged"));
			}
		}
		
		private var _series:Array = [];

		[Bindable]
		public function get series():Array
		{
			return _series;
		}

		public function set series(value:Array):void
		{
			if (_series != value)
			{
				_series = value;
				
				this.dispatchEvent(new Event("seriesChanged"));
			}
		}
		
		public function resetOptionsToDefault():void
		{
			_options = {};
		}
	}
}