<xsl:stylesheet
  version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" />
  <xsl:key name="occ" match="profession" use="@code" />
  <xsl:template match="/">
    <summary>
      <xsl:apply-templates select="/people/person" />
      <generated>
        <xsl:value-of select="current-date()" />
      </generated>
    </summary>
  </xsl:template>
  <xsl:template match="person">
    <Person>
      <Name>
        <xsl:value-of select="./name/normalize-space(
concat(first_name,
' '
,last_name))" />
      </Name>
      <xsl:apply-templates select="occupation"/>
    </Person>
  </xsl:template>
  <xsl:template match="occupation">
    <Occupation>
      <xsl:value-of select="@profid"/>
    </Occupation>
  </xsl:template>
</xsl:stylesheet>