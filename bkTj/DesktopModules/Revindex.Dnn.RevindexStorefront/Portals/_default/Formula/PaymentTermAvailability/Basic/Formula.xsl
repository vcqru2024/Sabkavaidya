﻿<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <out>
      <!-- Specify true or false to allow payment method -->
      <allowed>true</allowed>
      <message>
        <locale en-US="My message goes here" />
      </message>
    </out>
  </xsl:template>
</xsl:transform>