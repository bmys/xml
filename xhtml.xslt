<xsl:stylesheet
  xmlns:pkp="www.pkp.pl"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="3.0">

  <xsl:output method="html" indent="yes"/>

  <xsl:key name="prze" match="pkp:przewoźnik" use="@id"/>

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>
          <xsl:value-of select="./pkp:rozkład/pkp:nagłówek/pkp:tytuł"/>
        </title>
      </head>
      <body>
        <table>
<!--          <xsl:value-of select="./pkp:rozkład/połączenia/przyjazdy/połączenie"/>-->
          <xsl:for-each select="./pkp:rozkład/połączenia/przyjazdy/połączenie">
            <tr>
              <td><xsl:value-of select="pociąg"/></td>
              <td><xsl:value-of select="./informacje/pkp:dystans"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>

<!--    <pkp:rozkład>-->
<!--      <xsl:copy-of select="./pkp:rozkład/pkp:nagłówek"/>-->
<!--    </pkp:rozkład>-->

  </xsl:template>
</xsl:stylesheet>