import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.util.Map;
import java.util.HashMap;

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
		String condition;
		String platform;
		String SRA;
		String biosample;
	}
	
	static class MINiMLHandler extends DefaultHandler 
	{
		Map<String, Individ> individs = new HashMap<String, Individ>();
		
		int n = 0;
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

			else if (qName.equalsIgnoreCase("Title"))
			{
				tag = "Title";
			}

			else if (qName.equalsIgnoreCase("Predefined"))
			{
				tag = "Predefined";
			}
			
			else if( qName.equalsIgnoreCase("Characteristics") )
			{
				tag = attributes.getValue("tag");
			}

			else if( qName.equalsIgnoreCase("Relation") )
			{
				String type   = attributes.getValue("type");
				String target =  attributes.getValue("target");
				int len = target.length();
				
				if( "SRA".equals(type))
					sample.SRA = target.substring(len-10, len);
				else if( "BioSample".equals(type))
					sample.biosample = target.substring(len-12, len);

			}
		}

        public void characters(char[] ch, int start, int length) throws SAXException
        {
        	if( sample == null )
        		return;
        	
        	String value = new String(ch, start, length).trim();	

            if( "Title".equalsIgnoreCase(tag) && value.length()>3 )
            {
            	sample.condition = value.substring(0, value.length()-2);
            	tag = null;
            }

            if( "Predefined".equalsIgnoreCase(tag) )
            {
            	sample.platform = value.replace(' ', '_');
            	tag = null;
            }
            
            else if( "individual".equalsIgnoreCase(tag) )
            {
            	individ.id = value;
            	sample.individ = value;
            }

            else if( "age".equalsIgnoreCase(tag) )
            {
            	individ.age = value;
            }
            
            else if( "sex".equalsIgnoreCase(tag) )
            {
            	individ.sex = value;
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
				n++;
				
			//	<@sample id=1 GSM='GSM3417304' condition='untrained_baseline_NE' individ=1  platform=Illumina_HiSeq_2500 SRA='SRX4801195' biosample='SAMN10180041' />
				String out = "<@sample id=" + n  
						+ " GSM='" + sample.id
						+ "' condition='" + sample.condition
						+ "' individ=" + sample.individ
						+ " platform=" + sample.platform
						+ " SRA='" + sample.SRA
						+ "' biosample='" + sample.biosample
						+ "' />";
				
				System.out.println(out);
				
				if( !individs.containsKey(sample.individ) )
				{
					individs.put(individ.id,  individ);
				}
			}
			
			else if (qName.equalsIgnoreCase("MINiML"))
			{
				System.out.println("Individs:");

				for(Individ i : individs.values() ) 
				{
					// <@individ id=1 code=1 age=21 sex='male' />
					String out = "<@individ id=" + i.id
							+ " code=" + i.id
							+ " age=" + i.age
							+ " sex='" + i.sex
							+ "' />";
					System.out.println(out);
	
				}
			}

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
