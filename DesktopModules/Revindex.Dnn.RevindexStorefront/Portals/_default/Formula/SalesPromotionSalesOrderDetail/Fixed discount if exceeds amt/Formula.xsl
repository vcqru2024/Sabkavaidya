<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <out>
      <discountAmount>
        <!-- Sum up all the sales order details amount and test if exceeds $100 -->
        <xsl:variable name="subTotal" select="sum(in/salesOrder/salesOrderDetails/salesOrderDetail/amount)" />
        <xsl:variable name="minSpend" select="100" />
        <xsl:variable name="fixedDiscount" select="10" />

        <xsl:if test="$subTotal &gt; $minSpend" >
          <xsl:value-of select="-1 * $fixedDiscount * in/this/salesOrderDetail/amount div $subTotal" />
        </xsl:if>
      </discountAmount>
    </out>
  </xsl:template>
</xsl:transform>
