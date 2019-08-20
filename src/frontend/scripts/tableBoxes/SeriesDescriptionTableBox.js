import React, {Component} from 'react';
import {registerTableBox, processHashUrl, Navs} from 'be5-react';


class SeriesDescriptionTableBox extends Component
{
  componentDidMount() 
	{
	  document.querySelector('.tab-content').querySelector('.table-component__title').innerText = '';
  	}
	
	render()
	{
		const series = this.props.value.data.attributes.rows[0];

  	return ( <div>
        <p dangerouslySetInnerHTML={{__html: series.Description.value}} />
        
        <h2>Experiment design</h2>
        <p dangerouslySetInnerHTML={{__html: series.Design.value}} />
        
        <h2>References</h2>
        GEO: <a target="_blank" href={"https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc="+series.GSE.value}>{series.GSE.value}</a>
        <br/>
        PMID: <a target="_blank" href={"https://www.ncbi.nlm.nih.gov/pubmed/"+series.PMID.value}>{series.PMID.value}</a>
        
    </div>);
  }
}

registerTableBox('seriesDescription', SeriesDescriptionTableBox);
