<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <out>
      <!-- This simple rule packs each product separately. -->
      <shippingPackages>
        <xsl:for-each select="/in/salesOrder/salesOrderDetails/salesOrderDetail[requireShipping='true']">
          <xsl:variable name="sod" select="."/>
          <xsl:for-each select="1 to quantity">
            <shippingPackage>
              <name>Separate box</name>
              <packageType>1</packageType>
              <weight>
                <xsl:value-of select="$sod/weight"/>
              </weight>
              <width>
                <xsl:value-of select="$sod/width" />
              </width>
              <depth>
                <xsl:value-of select="$sod/depth" />
              </depth>
              <height>
                <xsl:value-of select="$sod/height" />
              </height>
              <insurredAmount>
                <xsl:value-of select="$sod/totalAmount div $sod/quantity"/>
              </insurredAmount>
              <shippingCode>50</shippingCode>
              <products>
                <product>
                  <salesOrderDetailID>
                    <xsl:value-of select="$sod/salesOrderDetailID"/>
                  </salesOrderDetailID>
                  <quantity>
                    <xsl:value-of select="1"/>
                  </quantity>
                  <insurredAmount>
                    <xsl:value-of select="$sod/totalAmount div $sod/quantity" />
                  </insurredAmount>
                </product>
              </products>
            </shippingPackage>
          </xsl:for-each>
        </xsl:for-each>
      </shippingPackages>
    </out>
  </xsl:template>
</xsl:transform>

