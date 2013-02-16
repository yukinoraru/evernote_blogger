<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="en-note">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="div">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="br">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="en-media">
    <div class="resource">
      <xsl:attribute name="data-hash">
        <xsl:value-of select="@hash" />
      </xsl:attribute>
      <xsl:attribute name="data-type">
        <xsl:value-of select="@type" />
      </xsl:attribute>
      <span></span>
    </div>
  </xsl:template>

  <xsl:template match="* | @* | text()">
    <xsl:copy>
      <xsl:apply-templates select="* | @* | text()" />
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
