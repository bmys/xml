<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
  xmlns:pkp="www.pkp.pl"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="3.0">

  <xsl:output method="html" indent="yes" encoding="utf-8"/>

  <xsl:key name="prze" match="pkp:przewoźnik" use="@id"/>

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
      <head>
        <title>
          <xsl:value-of select="./pkp:rozkład/pkp:nagłówek/pkp:tytuł"/>
        </title>
      </head>

      <body>
        <table border="1">
          <tr>
            <th>Numer</th>
            <th>Przewoźnik</th>
            <th>Pociąg</th>
            <th>Czas wyjazdu</th>
            <th>Stacja wyjazdu</th>
            <th>Czas przyjazdu</th>
            <th>Stacja przyjazdu</th>
            <th>Dystans</th>
            <th>Ceny</th>
            <th>stacje</th>
          </tr>
          <xsl:for-each select="./pkp:rozkład/połączenia/przyjazdy/połączenie">
            <tr>
              <td><xsl:number/></td>
              <td><xsl:value-of select="przewoźnik"/></td>
              <td><xsl:value-of select="pociąg"/></td>
              <td><xsl:value-of select="pkp:wyjazd/pkp:godzina"/></td>
              <td><xsl:value-of select="pkp:wyjazd/pkp:stacja"/></td>
              <td><xsl:value-of select="pkp:przyjazd/pkp:godzina"/></td>
              <td><xsl:value-of select="pkp:przyjazd/pkp:stacja"/></td>
              <td><xsl:value-of select="./informacje/pkp:dystans"/></td>
              <td>
                <ul>
                  <xsl:for-each select="./informacje/pkp:cena">
                    <li>
                      typ:
                        <xsl:value-of select="@typ"/>

                      cena:
                        <xsl:value-of select="."/>
                      zł

                    </li>
                  </xsl:for-each>
                </ul>

              </td>
              <td>
                <ul>
                  <xsl:for-each select="./pkp:stacje/pkp:stacja">
                    <li><xsl:value-of select="."/></li>
                  </xsl:for-each>
                </ul>
              </td>
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