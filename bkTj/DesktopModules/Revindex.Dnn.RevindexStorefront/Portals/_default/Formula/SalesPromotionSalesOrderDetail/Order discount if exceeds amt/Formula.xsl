<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:template match="/">
    <out>
      <!-- Give $10 discount on the entire order if order exceeds $50. Discount must be applied to each sales order detail line item. We must split the discount proportionally -->
      <xsl:variable name="SubTotalExclDiscounts" select="sum(in/salesOrder/salesOrderDetails/salesOrderDetail/amount)"/>
      <xsl:if test="$SubTotalExclDiscounts &gt; 50">
        <discountAmount>
          <xsl:value-of select="-10 * (/in/this/salesOrderDetail/amount div $SubTotalExclDiscounts)"/>
        </discountAmount>
      </xsl:if>
    </out>
  </xsl:template>
</xsl:transform>

