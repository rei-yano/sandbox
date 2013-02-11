<xsl:stylesheet 
	version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	exclude-result-prefixes="xs">

<xsl:output indent="yes" encoding="UTF-8" />
<xsl:param name="file" />
<xsl:variable name="separator" select="'\r\n'" />

<xsl:template match="/">
<xsl:variable name="ltsv" select="unparsed-text($file)" />
<xsl:variable name="rows" select="tokenize($ltsv, $separator)" as="xs:string+" />
<root>
<xsl:for-each select="$rows">
	<xsl:variable name="values" select="tokenize(., '\t')" as="xs:string+" />
	<row>
	<xsl:for-each select="$values">
		<value label="{substring-before(., ':')}"><xsl:value-of select="substring-after(., ':')" /></value>
	</xsl:for-each>
	</row>
</xsl:for-each>
</root>

</xsl:template>

</xsl:stylesheet>
