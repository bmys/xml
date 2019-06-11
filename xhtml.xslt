<xsl:stylesheet
  xmlns:pkp="www.pkp.pl"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="3.0">

  <xsl:output method="html" indent="yes"/>

  <xsl:key name="prze" match="pkp:przewoźnik" use="@id"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:value-of select="./pkp:rozkład/pkp:nagłówek/pkp:tytuł"/>
        </title>
      </head>
      <body>

      </body>
    </html>

<!--    <pkp:rozkład>-->
<!--      <xsl:copy-of select="./pkp:rozkład/pkp:nagłówek"/>-->
<!--    </pkp:rozkład>-->

  </xsl:template>
</xsl:stylesheet>