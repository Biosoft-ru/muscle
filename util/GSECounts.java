import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

import java.util.ArrayList;
import java.util.StringTokenizer;

/**
 * Parse counts file in format:
 * <pre>
 * ID	SRR7967699	SRR7967700 ...
 * </pre>
 * 
 * and generates SQL statements to :
 * - CREATE temporary table
 * - COPY data to table
 */
public class GSECounts
{
	public static void main(String[] args) throws Exception
	{
		if( args.length != 1)
		{
			System.out.println("Specify CSV file name with counts: \r\njava GSECounts file.csv");
			System.exit(-1);
		}
		
		File file = new File(args[0]);
		if( !file.exists() )
		{
			System.out.println("Can not find file: " + file.getAbsolutePath());
			System.exit(-1);
		}
		
		String header = (new BufferedReader(new FileReader(file))).readLine();

		ArrayList fields = new ArrayList();
		StringTokenizer tokens = new StringTokenizer(header, ", \t\r\n");
		
		while( tokens.hasMoreTokens() )
		{
			fields.add( tokens.nextToken() );
		}
		
		String name = file.getName().replaceAll(".csv", "");
		StringBuffer result = new StringBuffer("DROP table IF EXISTS counts." + name + ";\r\n" + 
				                               "CREATE TABLE counts." + name + "\r\n" +
				                               "(" + "\r\n" +
				                               "  ID character(15) NOT NULL, PRIMARY KEY (ID),\r\n  ");
		for(int i=1; i<fields.size(); i++)
		{
			result.append(fields.get(i) + " INT" + (i < fields.size()-1 ? ", " : " ") );
		}
		
		result.append(");" + "\r\n");
		result.append("ALTER TABLE counts." + name + " OWNER TO muscle; \r\n");
		
		result.append("COPY counts." + name + "(ID, ");
		for(int i=1; i<fields.size(); i++)
		{
			result.append(fields.get(i) + (i < fields.size()-1 ? ", " : " ") );
		}
		result.append(")" + "\r\n");
		result.append("FROM '" + file.getAbsolutePath() + "' CSV HEADER;\r\n");
		
		
		System.out.println(result.toString());
	}
	
}