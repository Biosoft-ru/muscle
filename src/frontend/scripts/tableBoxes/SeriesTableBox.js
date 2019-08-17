import React, {Component} from 'react';
import {registerTableBox, processHashUrl, TablePagination} from 'be5-react';


class SeriesTableBox extends Component
{
	componentDidMount() 
	{
		document.getElementsByClassName("table-component__title")[0].innerText = this.title;
  	}
	
	render()
	{
		const series = this.props.value.data.attributes.rows[0];

		this.title = series.PageTitle.value;
    	be5.ui.setTitle(this.title);

		return (
      	<div className="photos">
		  dddd
      	</div>
    );
  }
}

registerTableBox('series', SeriesTableBox);
