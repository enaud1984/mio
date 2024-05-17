<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:cbi="urn:CBI:xsd:CBIBdyBkToCstmrStmtReq.00.01.02"
  xmlns:camt="urn:iso:std:iso:20022:tech:xsd:camt.053.001.02">

  <!-- Copy the root element and namespace declarations -->
  <xsl:template match="/">
    <xsl:element name="camt:Document">
      <xsl:attribute name="xmlns:camt">urn:iso:std:iso:20022:tech:xsd:camt.053.001.02</xsl:attribute>
      <xsl:apply-templates select="cbi:CBIBdyBkToCstmrStmtReq"/>
    </xsl:element>
  </xsl:template>

  <!-- Transform CBIBdyBkToCstmrStmtReq to Document -->
  <xsl:template match="cbi:CBIBdyBkToCstmrStmtReq">
    <xsl:element name="camt:BkToCstmrStmt">
      <!-- Map other fields here -->

      <!-- Map MsgId -->
      <xsl:element name="camt:MsgId">
        <xsl:value-of select="cbi:PhyMsgInf/cbi:MsgId"/>
      </xsl:element>

      <!-- Map Stmt -->
      <xsl:for-each select="cbi:Stmt">
        <xsl:element name="camt:Stmt">
          <!-- Map StmtId -->
          <xsl:element name="camt:StmtId">
            <xsl:value-of select="cbi:StmtId"/>
          </xsl:element>

          <!-- Map Acct -->
          <xsl:for-each select="cbi:Acct">
            <xsl:element name="camt:Acct">
              <!-- Map Id -->
              <xsl:element name="camt:Id">
                <xsl:value-of select="cbi:Id"/>
              </xsl:element>

              <!-- Map Bal -->
              <xsl:for-each select="cbi:Bal">
                <xsl:element name="camt:Bal">
                  <!-- Map Amt -->
                  <xsl:element name="camt:Amt">
                    <xsl:value-of select="cbi:Amt"/>
                  </xsl:element>
                  <!-- Map CdtDbtInd -->
                  <xsl:element name="camt:CdtDbtInd">
                    <xsl:value-of select="cbi:CdtDbtInd"/>
                  </xsl:element>
                </xsl:element>
              </xsl:for-each>
            </xsl:element>
          </xsl:for-each>
        </xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
