<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:template match="/">
    <!-- The following rule varies the price by the number of booking inventory unit -->
    <out>
      <price>
        <xsl:choose>
          <xsl:when test="in/this/salesOrderDetail/bookingStartDate != '' and in/this/salesOrderDetail/bookingStopDate != '' and xs:dateTime(in/this/salesOrderDetail/bookingStopDate) &gt; xs:dateTime(in/this/salesOrderDetail/bookingStartDate)">
            <xsl:choose>
              <!-- Per year -->
              <xsl:when test="in/product/productVariant/inventoryUnitType = 2">
                <xsl:value-of select="in/product/productVariant/basePrice * (year-from-dateTime(xs:dateTime(in/this/salesOrderDetail/bookingStopDate)) - year-from-dateTime(xs:dateTime(in/this/salesOrderDetail/bookingStartDate)))" />
              </xsl:when>
              
              <!-- Per month -->
              <xsl:when test="in/product/productVariant/inventoryUnitType = 3">
                <xsl:value-of select="in/product/productVariant/basePrice * (year-from-dateTime(xs:dateTime(in/this/salesOrderDetail/bookingStopDate)) - year-from-dateTime(xs:dateTime(in/this/salesOrderDetail/bookingStartDate))) * 12 + (month-from-dateTime(xs:dateTime(in/this/salesOrderDetail/bookingStopDate)) - month-from-dateTime(xs:dateTime(in/this/salesOrderDetail/bookingStartDate)))" />
              </xsl:when>
            
               <!-- Per week -->
               <xsl:when test="in/product/productVariant/inventoryUnitType = 4">
                 <xsl:value-of select="in/product/productVariant/basePrice * floor(days-from-duration(xs:dateTime(in/this/salesOrderDetail/bookingStopDate) - xs:dateTime(in/this/salesOrderDetail/bookingStartDate)) div 7)" />
               </xsl:when>
            
               <!-- Per day -->
               <xsl:when test="in/product/productVariant/inventoryUnitType = 5">
                 <xsl:value-of select="in/product/productVariant/basePrice * days-from-duration(xs:dateTime(in/this/salesOrderDetail/bookingStopDate) - xs:dateTime(in/this/salesOrderDetail/bookingStartDate))" />
               </xsl:when>
            
                <!-- Per hour -->
               <xsl:when test="in/product/productVariant/inventoryUnitType = 6">
                 <xsl:value-of select="in/product/productVariant/basePrice * (xs:dateTime(in/this/salesOrderDetail/bookingStopDate) - xs:dateTime(in/this/salesOrderDetail/bookingStartDate)) div xs:dayTimeDuration('PT1H')" />
               </xsl:when>
            
               <!-- Constant -->
               <xsl:otherwise>
                 <xsl:value-of select="in/product/productVariant/basePrice" />
               </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="in/product/productVariant/basePrice" />
          </xsl:otherwise>
        </xsl:choose>
      </price>
    </out>
  </xsl:template>
</xsl:transform>
