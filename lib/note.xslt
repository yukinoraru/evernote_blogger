<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="en-note">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="en-media">
    <xsl:choose>
      <xsl:when test="contains(@type, 'image/png')">
        <img>
          <xsl:attribute name="class">attach_img</xsl:attribute>
          <xsl:attribute name="src">
            <xsl:value-of select="concat('/resource/', @hash, '.png')" />
          </xsl:attribute>
        </img>
      </xsl:when>
      <xsl:when test="contains(@type, 'image/jpeg')">
        <img>
          <xsl:attribute name="class">attach_img</xsl:attribute>
          <xsl:attribute name="src">
            <xsl:value-of select="concat('/resource/', @hash, '.jpg')" />
          </xsl:attribute>
          <xsl:attribute name="width">
            <xsl:value-of select="@width" />
          </xsl:attribute>
          <xsl:attribute name="height">
            <xsl:value-of select="@width" />
          </xsl:attribute>
        </img>
      </xsl:when>
      <xsl:otherwise>
        <div class="resource">
          <xsl:attribute name="data-hash">
            <xsl:value-of select="@hash" />
          </xsl:attribute>
          <xsl:attribute name="data-type">
            <xsl:value-of select="@type" />
          </xsl:attribute>
          <span></span>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="* | @* | text()">
    <xsl:copy>
      <xsl:apply-templates select="* | @* | text()" />
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>