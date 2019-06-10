<xsl:stylesheet
  version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output indent="yes" />

  <xsl:key name="occ" match="profession" use="@code" />

  <xsl:template match="/">
    <summary>
      <xsl:apply-templates select="/people/person" />

    </summary>
  </xsl:template>
  <xsl:template match="person">
    <Person>
      <Name>
        <xsl:value-of select="." />
      </Name>
      <xsl:apply-templates select="occupation"/>
    </Person>
  </xsl:template>
  <xsl:template match="occupation">
    <Occupation>
      <xsl:value-of select="key('occ', ./@profid)"/>
    </Occupation>
  </xsl:template>
</xsl:stylesheet>