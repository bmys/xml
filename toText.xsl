<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
  xmlns:pkp="www.pkp.pl"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="3.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.w3.org/2005/xpath-functions ">
  <xsl:output method="text" indent="no" encoding="utf-8"/>

  <xsl:variable
    name="spacje"
    select="'                                                                                 '">
  </xsl:variable>

<xsl:template match="/">
<xsl:template match="/">
<!--      <xsl:value-of select="$spacje"/>-->

<xsl:for-each select="./pkp:rozkład/połączenia/przyjazdy/połączenie">

  <xsl:variable name="padding" select="50-string-length(pociąg)"/>
  <xsl:variable name="padd" select="substring($spacje, $padding)"/>
  <xsl:value-of select="concat(pociąg, $padd)"/>


</xsl:for-each>



<!--      <xsl:value-of select="$padding"/>-->

<!--      <xsl:value-of select="./pkp:rozkład/pkp:nagłówek/pkp:tytuł"/>-->

<!--11<xsl:value-of select="substring($spacje, $padding)"/>11-->

</xsl:template>
</xsl:template>

</xsl:stylesheet>