import React, {Component} from 'react';
import {registerTableBox, processHashUrl, Navs} from 'be5-react';


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

  	const steps = [
		{title: "Description", 		url: '#!table/entity/view'},
		{title: "Individs", 		url: '#!table/entity/view'},
		{title: "Conditions", 		url: '#!table/entity/view'},
		{title: "Samples", 			url: '#!table/entity/view'},
		{title: "Comparisons (DEGs)",		url: '#!table/entity/view'},
		{title: "Quality control",	url: '#!table/entity/view'}
  	];


  	return (
      	<div className="photos">
        <Navs steps={steps} tabs startAtStep={0} />
      	</div>
    );
  }
}

registerTableBox('series', SeriesTableBox);
