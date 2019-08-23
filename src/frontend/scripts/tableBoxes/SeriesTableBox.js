import React, {Component} from 'react';
import {registerTableBox, processHashUrl, Navs} from 'be5-react';


class SeriesTableBox extends Component
{
  componentDidMount() 
	{
		document.getElementsByClassName("table-component__title")[0].innerText = this.title;

//		document.querySelector('.tab-content').querySelector('.table-component__title').innerText = '';
	}
	
	render()
	{
		const series = this.props.value.data.attributes.rows[0];

		this.title = series.PageTitle.value;
    	be5.ui.setTitle(this.title);

  	const steps = [
		{title: "Description", 		url: '#!table/series/Description/ID=' + series.ID.value},
		{title: "Individs", 		url: '#!table/series/Individs/ID='    + series.ID.value},
		{title: "Conditions", 		url: '#!table/series/Conditions/ID='  + series.ID.value},
		{title: "Samples", 			url: '#!table/series/Samples/ID='     + series.ID.value},
		{title: "Comparisons (DEGs)",		url: '#!table/entity/view'},
		{title: "Quality control",	url: '#!table/entity/view'}
  	];

  	return (
      	<div className="seriesInfo">
      	
      	<p>{series.Organism.value}, {series.Type.value}</p>
      	<h2 className="seriesTitle">{series.Title.value}</h2>
      	
      	<Navs steps={steps} tabs startAtStep={0} />
      	</div>
    );
  }
}

registerTableBox('series', SeriesTableBox);
