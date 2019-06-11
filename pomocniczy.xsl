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

      <podsumowanie>
          <data-utworzenia>
            <xsl:variable name="dt" select="date:date()"/>
            <xsl:value-of select="$dt"/>
          </data-utworzenia>

      <suma-cen>
        <xsl:value-of select="sum(./pkp:rozkład/pkp:połączenia/pkp:przyjazdy/pkp:połączenie/pkp:informacje/pkp:cena)"/>
      </suma-cen>

        <ilość-połączeń>
          <xsl:value-of select="count(./pkp:rozkład/pkp:połączenia/pkp:przyjazdy/pkp:połączenie)"/>
        </ilość-połączeń>


<!--        <suma-cen>-->
<!--          <xsl:value-of select="sum(./pkp:rozkład/pkp:połączenia/pkp:informacje//pkp:cena)"/>-->
<!--        </suma-cen>-->

      </podsumowanie>
    </pkp:rozkład>

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
        <xsl:apply-templates select="./pkp:przyjazdy/pkp:połączenie">
          <xsl:sort select="@idref" data-type="text" order="descending"/>
        </xsl:apply-templates>
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

      <xsl:apply-templates select="./pkp:informacje"/>

    </połączenie>
  </xsl:template>



  <xsl:template match="pkp:informacje">
    <informacje>
      <najtańsze>
        <xsl:variable name="najtańsze" select="math:min(pkp:cena)"/>
        <xsl:value-of select="$najtańsze"/>
      </najtańsze>

      <suma-cen>
          <xsl:value-of select="sum(./pkp:cena)"/>
      </suma-cen>

      <xsl:copy-of select="./pkp:dystans"/>
      <xsl:copy-of select="./pkp:cena"/>
    </informacje>
  </xsl:template>

</xsl:stylesheet>