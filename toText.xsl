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
  <xsl:variable name='newline'><xsl:text>
</xsl:text></xsl:variable>

<!--  <xsl:template name="pad">-->
<!--    <xsl:param name="element" />-->
<!--    <xsl:value-of select="$element"/>-->
<!--  </xsl:template>-->

  <!--    <xsl:variable name="padding" select="50-string-length($element)"/>-->
  <!--    <xsl:variable name="padd" select="substring($spacje, $padding)"/>-->
<!--  <xsl:value-of select="concat($element, substring($spacje, 50-string-length($element)))"/>-->

<xsl:template name="pad">
  <xsl:param name="element" />
    <xsl:variable name="padding" select="50-string-length($element)"/>
    <xsl:variable name="padd" select="substring($spacje, 1, $padding)"/>
    <xsl:value-of select="concat($element, $padd)"/>
</xsl:template>

<xsl:template match="/">
<!--      <xsl:value-of select="$spacje"/>-->

<xsl:for-each select="./pkp:rozkład/połączenia/przyjazdy/połączenie">
<!--  <xsl:variable name="padding" select="50-string-length(pociąg)"/>-->
<!--  <xsl:variable name="padd" select="substring($spacje, $padding)"/>-->
<!--  <xsl:value-of select="concat(pociąg, $padd)"/>-->
  <xsl:call-template name="pad">
    <xsl:with-param name="element" select="./pociąg"/>
  </xsl:call-template>
  <xsl:call-template name="pad">
    <xsl:with-param name="element" select="./przewoźnik"/>
  </xsl:call-template>
  <xsl:value-of select="$newline"/>
</xsl:for-each>



<!--      <xsl:value-of select="$padding"/>-->

<!--      <xsl:value-of select="./pkp:rozkład/pkp:nagłówek/pkp:tytuł"/>-->

<!--11<xsl:value-of select="substring($spacje, $padding)"/>11-->

</xsl:template>


</xsl:stylesheet>