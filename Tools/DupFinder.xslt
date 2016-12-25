<?xml version="1.0" encoding="utf-8"?>

<!-- origin: https://gist.github.com/st-gwerner/6675196 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" version="5.0" indent="yes" />
  <!-- input parameters -->
  <xsl:param name="BuildNumber" select="0.1" />

  <xsl:template match="/">
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous" />
      </head>
      <body>
        <div class="container">
          <h1>Statistics for build <xsl:value-of select="$BuildNumber"/></h1>
          <p>Total codebase size: <b><xsl:value-of select="//CodebaseCost" /></b>
          </p>
          <p>Code to analyze: <b><xsl:value-of select="//TotalDuplicatesCost" /></b>
          </p>
          <p>Total size of duplicated fragments: <b><xsl:value-of select="//TotalFragmentsCost" /></b>
          </p>

          <h1>Detected Duplicates</h1>

          <xsl:for-each select="//Duplicates/Duplicate">
            <xsl:variable name="d" select="position()" />
            <hr />
            <h2>Duplicated Code. Size: <xsl:value-of select="@Cost" /></h2>
            <h3>Duplicated Fragments:</h3>
            <ul class="nav nav-pills">
              <xsl:for-each select="Fragment">
                <xsl:variable name="i" select="position()" />
                <xsl:element name="li">
                  <xsl:if test="$i = 1">
                    <xsl:attribute name="class">active</xsl:attribute>
                  </xsl:if>
                  <xsl:element name="a">
                    <xsl:attribute name="href">#A<xsl:value-of select="$d" />_<xsl:value-of select="$i" />
                    </xsl:attribute>
                    <xsl:attribute name="data-toggle">tab</xsl:attribute>
                    Fragment <xsl:value-of select="$i" />
                  </xsl:element>
                </xsl:element>
              </xsl:for-each>
            </ul>
            <div class="tab-content">
              <xsl:for-each select="Fragment">
                <xsl:variable name="i" select="position()" />
                <xsl:element name="div">
                  <xsl:choose>
                    <xsl:when test="$i = 1">
                      <xsl:attribute name="class">active tab-pane</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:attribute name="class">tab-pane</xsl:attribute>
                    </xsl:otherwise>
                  </xsl:choose>
                  <xsl:attribute name="id">A<xsl:value-of select="$d" />_<xsl:value-of select="$i" />
                  </xsl:attribute>
                  <p style='margin-top: 10px;'>
                    <xsl:value-of select="FileName" /> lines <xsl:value-of select="LineRange/@Start" /> -
                    <xsl:value-of select="LineRange/@End" />
                  </p>
                  <pre>
                    <xsl:value-of select="Text" />
                  </pre>
                </xsl:element>
              </xsl:for-each>
            </div>
          </xsl:for-each>

        </div>
        <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous" />
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>