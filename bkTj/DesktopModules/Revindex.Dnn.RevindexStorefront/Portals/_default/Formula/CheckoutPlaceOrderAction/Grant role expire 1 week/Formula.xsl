﻿<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:template match="/">
    <out>
      <grantSecurityRole>
        <roleName>Role 1</roleName>
        <expire>
          <xsl:value-of select="current-date() + xs:dayTimeDuration('P7D')" />
        </expire>
      </grantSecurityRole>
    </out>
  </xsl:template>
</xsl:transform>