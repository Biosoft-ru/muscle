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
		{title: "Description", 		url: '#!table/series/description/ID=' + series.ID.value},
		{title: "Individs", 		url: '#!table/entity/view'},
		{title: "Conditions", 		url: '#!table/entity/view'},
		{title: "Samples", 			url: '#!table/entity/view'},
		{title: "Comparisons (DEGs)",		url: '#!table/entity/view'},
		{title: "Quality control",	url: '#!table/entity/view'}
  	];

//    s.GSE AS "GSE",
//	o.title AS "Organism",
//    s.type AS "Type",
//    s.description AS "Description"
  	

  	return (
      	<div className="seriesInfo">
      	
      	<p>{series.Organism.value}, {series.Type.value}</p>
      	<h2 className="seriesTitle">{series.Title.value}</h2>

        <p dangerouslySetInnerHTML={{__html: series.Description.value}} />
      	
      	<Navs steps={steps} tabs startAtStep={0} />
      	</div>
    );
  }
}

registerTableBox('series', SeriesTableBox);
