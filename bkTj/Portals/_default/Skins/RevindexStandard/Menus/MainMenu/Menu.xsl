<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />
  <xsl:template match="/*">
    <xsl:apply-templates select="root" />
  </xsl:template>
  <xsl:template match="root">
    <ul class="nav navbar-nav">
      <xsl:apply-templates select="node" />
    </ul>
  </xsl:template>
  <xsl:template match="node">
    <li>
      <xsl:attribute name="class">
        <xsl:text>node-pos-</xsl:text>
        <xsl:value-of select="position()" />
        <xsl:text> node-level-</xsl:text>
        <xsl:value-of select="@depth" />
        <xsl:if test="@first = 1">
          <xsl:text> node-first</xsl:text>
        </xsl:if>
        <xsl:if test="@last = 1">
          <xsl:text> node-last</xsl:text>
        </xsl:if>
        <xsl:if test="@selected = 1">
          <xsl:text> active</xsl:text>
        </xsl:if>
        <xsl:if test="@separator = 1">
          <xsl:text> divider</xsl:text>
        </xsl:if>
        <xsl:if test="node">
          <xsl:text> dropdown</xsl:text>
          <xsl:if test="@depth &gt; 0">
            <xsl:text> dropdown-submenu</xsl:text>
          </xsl:if>
        </xsl:if>
        <!-- Hide first level nodes if more than 10 items to prevent overflowing and pushing Storefront menu out of view -->
        <xsl:if test="@depth = 0 and position() &gt; 8">
          <xsl:text> hidden</xsl:text>
        </xsl:if>
      </xsl:attribute>
      <a target="{@target}">
        <xsl:attribute name="href">
          <xsl:choose>
            <xsl:when test="@enabled = 1">
              <xsl:value-of select="@url" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>#</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="class">
          <xsl:if test="node">
            <xsl:text> dropdown-toggle disabled</xsl:text>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="data-toggle">
          <xsl:if test="node">
            <xsl:text>dropdown</xsl:text>
          </xsl:if>
        </xsl:attribute>
        <xsl:if test="@icon">
        </xsl:if>
        <xsl:value-of select="@text" />
        <xsl:if test="node">
          <xsl:text> </xsl:text>
          <em>
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="@depth &gt; 0">
                  <xsl:text>glyphicon glyphicon-menu-right</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>caret</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </em>
        </xsl:if>
      </a>
      <xsl:if test="node">
        <ul class="dropdown-menu">
          <xsl:apply-templates select="node" />
        </ul>
      </xsl:if>
    </li>
  </xsl:template>
</xsl:stylesheet>
