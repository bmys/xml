<xsl:stylesheet
  version="3.0"
  xmlns:pkp="www.pkp.pl"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
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
        <!--      <xsl:value-of select="key('prze', ./@idref)"/>-->
        <xsl:value-of select="./@idref"/>
      </przewoźnik>
      <pociąg>
        <xsl:value-of select="./pkp:pociąg"/>
      </pociąg>
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