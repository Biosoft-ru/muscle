import React, {Component} from 'react';
import {registerTableBox, processHashUrl, Navs} from 'be5-react';


class GeneTableBox extends Component
{
  componentDidMount()
  {
  }
  
  render()
  {
    const gene = this.props.value.data.attributes.rows[0];

    this.title = gene.PageTitle.value;
    be5.ui.setTitle(this.title);

  	const steps = [
		{title: "Expression", 		  url: '#!table/_genes_/Details2/ID=' + gene.ID.value},
		{title: "Signatures", 		  url: '#!table/_genes_/Details2/ID=' + gene.ID.value},
  	];

  	return (
      	<div className="geneInfo">

		<h1>{gene.PageTitle.value}</h1>

      	<Navs steps={steps} tabs startAtStep={0} />
      	</div>
    );
  }
}

registerTableBox('gene', GeneTableBox);
