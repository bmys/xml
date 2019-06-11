<xsl:stylesheet
  xmlns:date="http://exslt.org/dates-and-times"
  xmlns:math="http://exslt.org/math"
  xmlns:pkp="www.pkp.pl"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="3.0"
  xsi:schemaLocation="http://www.w3.org/2005/xpath-functions ">
  xsi:schemaLocation="www.pkp.pl rozkład.xsd">

  <xsl:output indent="yes"/>

  <xsl:key name="prze" match="pkp:przewoźnik" use="@id"/>

  <xsl:template match="/">
    <pkp:rozkład>
      <xsl:copy-of select="./pkp:rozkład/pkp:nagłówek"/>
      <xsl:apply-templates select="./pkp:rozkład/pkp:połączenia"/>
    </pkp:rozkład>

    <!--    <xsl:value-of select="./pkp:rozkład/pkp:nagłówek" />-->
  </xsl:template>


  <xsl:template match="pkp:połączenia">
    <połączenia>

      <przewoźnicy>
        <przewoźnik id="EIP"/>
        <przewoźnik id="IC"/>
        <przewoźnik id="REG"/>
        <przewoźnik id="TLK"/>
      </przewoźnicy>
      <przyjazdy>
        <xsl:apply-templates select="./pkp:przyjazdy/pkp:połączenie"/>
      </przyjazdy>
    </połączenia>
  </xsl:template>

  <xsl:template match="pkp:połączenie">
    <połączenie>
      <przewoźnik>
        <xsl:attribute name="przewoźnik">
          <xsl:value-of select="./@idref"/>
        </xsl:attribute>
        <xsl:value-of select="key('prze', @idref)"/>
      </przewoźnik>

      <pociąg>
        <xsl:value-of select="./pkp:pociąg"/>
      </pociąg>

      <xsl:copy-of select="./pkp:wyjazd"/>
      <xsl:copy-of select="./pkp:przyjazd"/>
      <xsl:copy-of select="./pkp:stacje"/>
<!--      <xsl:copy-of select="./pkp:informacje"/>-->

      <xsl:apply-templates select="./pkp:informacje"/>


      <czas>
<!--        <xsl:variable name="date1" select="./pkp:wyjazd/pkp:godzina" />-->
<!--        <xsl:variable name="date2" select="./pkp:przyjazd/pkp:godzina" />-->

<!--        <czas-podrózy>-->
<!--          <xsl:variable name="dt" select="date:getNumber(date:dateTime()) - date:getNumber(date:dateTime())"/>-->
<!--          <xsl:value-of select="$dt"/>-->
<!--        </czas-podrózy>-->


<!--        <data-utworzenia>-->
<!--          <xsl:variable name="dt" select="date:dateTime()"/>-->
<!--          <xsl:value-of select="$dt"/>-->
<!--        </data-utworzenia>-->
        <!--        <xsl:value-of select="xs:date($date1)"/>-->

<!--        <xsl:value-of select="days-from-duration()"/>-->

      </czas>
    </połączenie>
  </xsl:template>



  <xsl:template match="pkp:informacje">
    <informacje>
      <najtańsze>
        <xsl:variable name="najtańsze" select="math:min(pkp:cena)"/>
        <xsl:value-of select="$najtańsze"/>
      </najtańsze>

      <xsl:copy-of select="./pkp:dystans"/>
      <xsl:copy-of select="./pkp:cena"/>
    </informacje>
  </xsl:template>

</xsl:stylesheet>