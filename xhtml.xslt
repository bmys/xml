<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
  xmlns:pkp="www.pkp.pl"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="3.0"
  exclude-result-prefixes="pkp">

  <xsl:output omit-xml-declaration="yes" method="html" indent="yes" encoding="utf-8"
    doctype-public="-//W3C//DTD XHTML 1.1//EN"
    doctype-system= "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"/>

  <xsl:key name="prze" match="pkp:przewoźnik" use="@id"/>

  <xsl:template match="/">

    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl">
      <head>
        <title>
          <xsl:value-of select="./pkp:rozkład/pkp:nagłówek/pkp:tytuł"/>
        </title>
      </head>

      <body style="margin: 0">
        <div style="width: 100vw">
          <h2>Rozkład jazdy</h2>
        <table>
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
        </div>
        <div style="width: 100vw; margin-top: 50px; border: 1px solid black;">
          <h2>Podsumowanie</h2>
          <table style="width: 100vw">
            <tr>
              <th>Data utworzenia</th>
              <th>Suma cen</th>
              <th>Ilość połączeń</th>
            </tr>
            <tr>
              <td>
                <xsl:value-of select="./pkp:rozkład/podsumowanie/data-utworzenia"/>
              </td>
              <td> <xsl:value-of select="./pkp:rozkład/podsumowanie/suma-cen"/></td>
              <td> <xsl:value-of select="./pkp:rozkład/podsumowanie/ilość-połączeń"/></td>
            </tr>
          </table>
        </div>
      </body>
    </html>

<!--    <pkp:rozkład>-->
<!--      <xsl:copy-of select="./pkp:rozkład/pkp:nagłówek"/>-->
<!--    </pkp:rozkład>-->

  </xsl:template>
</xsl:stylesheet>