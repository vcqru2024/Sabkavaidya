<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <!-- Set order status completed, payment status paid, shipping status shipped if payment is received -->
    <out>
      <setData>
        <xsl:if test="sum(/in/salesOrder/salesPayments/salesPayment[responseCode = 1 and transactionType = (2,6)]/amount) &gt;= /in/salesOrder/totalAmount">
          <salesOrder>
            <status>4</status>
            <salesPaymentStatus>2</salesPaymentStatus>
            <shippingStatus>3</shippingStatus>
          </salesOrder>
        </xsl:if>
      </setData>
    </out>
  </xsl:template>
</xsl:transform>