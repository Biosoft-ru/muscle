import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 * Parse MINiML file for GEO series (GSE)
 * and generates some stub to insert this data using ftl.
 */
public class ParseMINiML
{
	public static String fileName = "GSE120862_family.xml";
	
	public static void main(String[] args)
	{
		try
		{
			SAXParserFactory factory = SAXParserFactory.newInstance();
			SAXParser saxParser = factory.newSAXParser();
  	        saxParser.parse(fileName, new MINiMLHandler());

		}
		catch (Exception e) 
		{
	       e.printStackTrace();
	    }

	}
		
	static class Individ
	{
		String id;
		String age;
		String sex;
	}
	
	static class Sample
	{
		String id;
		String individ;
		
	}
	
	static class MINiMLHandler extends DefaultHandler 
	{
		Sample sample;
		Individ individ;
		
		String tag;
		
		public void startElement(String uri, String localName,String qName, Attributes attributes) throws SAXException 
		{
			if (qName.equalsIgnoreCase("Sample")) 
			{
				sample = new Sample();
				sample.id = attributes.getValue("iid");
					
				individ = new Individ();
			}
			else if( qName.equalsIgnoreCase("Characteristics") )
			{
				tag = attributes.getValue("tag");
			}
		}

        public void characters(char[] ch, int start, int length) throws SAXException
        {
        	String value = new String(ch, start, length).trim();	
        
            if( "individual".equals(tag) )
            {
            	individ.id = value;
            	sample.individ = value;
            }
        }
		
		public void endElement(String uri, String localName, String qName) throws SAXException 
		{
			if( qName.equalsIgnoreCase("Characteristics") )
			{
				tag = null;
			}
			else if (qName.equalsIgnoreCase("Sample"))
			{
				System.out.println("Sample:" + sample.id + ", individ=" + sample.individ);
			}

//			<@sample id=1 GSM='GSM3417304' condition='untrained_baseline_NE' individ=1  platform=Illumina_HiSeq_2500 SRA='SRX4801195' biosample='SAMN10180041' />
		}
	}

}

/**
 Example (truncated):
 
   <Sample iid="GSM3417304">
    <Title>untrained_baseline_NE_1</Title>
    <Accession database="GEO">GSM3417304</Accession>
    <Type>SRA</Type>
    <Channel-Count>1</Channel-Count>
    <Channel position="1">
      <Source>muscle vastus lateralis</Source>
      <Organism taxid="9606">Homo sapiens</Organism>
      <Characteristics tag="tissue">skeletal muscle</Characteristics>
      <Characteristics tag="individual">1</Characteristics>
      <Characteristics tag="age">21</Characteristics>
      <Characteristics tag="training status">untrained</Characteristics>
      <Characteristics tag="time point">baseline</Characteristics>
      <Characteristics tag="exercised/non-exercised muscle">non-exercised (NE)</Characteristics>
      <Characteristics tag="Sex">male</Characteristics>
      <Treatment-Protocol>An exercise session (60 min, one-legged knee extension, ... </Treatment-Protocol>
      <Molecule>polyA RNA</Molecule>
      <Extract-Protocol>Samples from the vastus lateralis muscle were taken using ... </Extract-Protocol>
    </Channel>
    <Description>1D0_S1_L001</Description>
    <Platform-Ref ref="GPL16791" />
    <Library-Strategy>RNA-Seq</Library-Strategy>
    <Library-Source>transcriptomic</Library-Source>
    <Library-Selection>cDNA</Library-Selection>
    <Instrument-Model>
      <Predefined>Illumina HiSeq 2500</Predefined>
    </Instrument-Model>
    <Relation type="BioSample" target="https://www.ncbi.nlm.nih.gov/biosample/SAMN10180041" />
    <Relation type="SRA" target="https://www.ncbi.nlm.nih.gov/sra?term=SRX4801195" />
  </Sample>
*/
