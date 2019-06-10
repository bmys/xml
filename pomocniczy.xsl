<xsl:stylesheet
  version="3.0"
  xmlns:pkp="www.pkp.pl"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="www.pkp.pl rozkład.xsd">

  <xsl:output indent="yes" />

<!--  <xsl:key name="occ" match="profession" use="@code" />-->

  <xsl:template match="/">
    <xsl:apply-templates select="/pkp:rozkład/pkp:nagłówek"/>
    <!--    <xsl:value-of select="./pkp:rozkład/pkp:nagłówek" />-->
  </xsl:template>

    <xsl:template match="pkp:nagłówek">
      <nagłówek>
        <tytuł>
          <xsl:value-of select="./pkp:tytuł" />
        </tytuł>

      </nagłówek>
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