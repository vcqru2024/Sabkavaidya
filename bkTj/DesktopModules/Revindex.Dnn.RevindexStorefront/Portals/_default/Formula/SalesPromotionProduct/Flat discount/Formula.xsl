﻿<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <out>
      <!-- 10% on all products -->
      <promotionPrice>
        <xsl:value-of select="0.90 * in/product/productVariant/price" />
      </promotionPrice>
    </out>
  </xsl:template>
</xsl:transform>