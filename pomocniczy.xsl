<xsl:stylesheet
  version="3.0"
  xmlns:pkp="www.pkp.pl"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:fn="http://www.w3.org/2005/xpath-functions"
  xmlns:date="http://exslt.org/dates-and-times"
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

      <czas>
        <xsl:variable name="date1" select="./pkp:wyjazd/pkp:godzina" />
        <xsl:variable name="date2" select="./pkp:przyjazd/pkp:godzina" />

        <czas-podrózy>
          <xsl:variable name="dt" select="date:dayInWeek(date:dateTime())"/>
          <xsl:value-of select="$dt"/>
        </czas-podrózy>
<!--        <data-utworzenia>-->
<!--          <xsl:variable name="dt" select="date:dateTime()"/>-->
<!--          <xsl:value-of select="$dt"/>-->
<!--        </data-utworzenia>-->
        <!--        <xsl:value-of select="xs:date($date1)"/>-->

<!--        <xsl:value-of select="days-from-duration()"/>-->

      </czas>


<!--      <czas_podróży>-->
<!--        <xsl:call-template name="xs:date:difference">-->
<!--          <xsl:with-param name="start" select="string"/>-->
<!--          <xsl:with-param name="end" select="string"/>-->
<!--        </xsl:call-template>-->
<!--      </czas_podróży>-->

    </połączenie>
  </xsl:template>

  <!--  <xsl:template match="person">-->
  <!--    <Person>-->
  <!--      <Name>-->
  <!--        <xsl:value-of select="." />-->
  <!--      </Name>-->
  <!--      <xsl:apply-templates select="occupation"/>-->
  <!--    </Person>-->
  <!--  </xsl:template>-->

  <!--  <xsl:template match="occupation">-->
  <!--    <Occupation>-->
  <!--      <xsl:value-of select="key('occ', ./@profid)"/>-->
  <!--    </Occupation>-->
  <!--  </xsl:template>-->
  <!--  -->
</xsl:stylesheet>