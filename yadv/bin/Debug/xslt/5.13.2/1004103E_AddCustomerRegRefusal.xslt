<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:addcrr="urn:customs.ru:Information:ExchangeDocuments:AddCustomerRegRefusal:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="addcrr:AddCustomerRegRefusal">
      <html>
         <head>
            <title>Отказ в принятии дополнения к договору поручительства должностным лицом</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 10pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>
                              <i>Отказ в принятии дополнения к договору поручительства <br/>должностным лицом
					</i>
                           </b>
                        </font>
                     </td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td align="right" class="graph" colspan="100%" style="border:solid 0pt">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="addcrr:RefusalDate"/>
                        </xsl:call-template>
                     </td>
                  </tr>
                  <xsl:if test="addcrr:GRN">
                     <tr>
                        <td class="graph" colspan="100%" style="border:solid 0pt">
                           <u>Cсылочный номер гарантии в транзите <xsl:value-of select="addcrr:GRN"/>
                           </u>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="addcrr:DestinationCustoms">
                     <tr>
                        <td class="graph" style="border:solid 0pt" width="50%">Таможенный орган назначения</td>
                        <td class="graph" style="border:solid 0pt" width="50%">
                           <xsl:apply-templates select="addcrr:DestinationCustoms"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td class="graph" style="border:solid 0pt" width="50%">Должностное лицо таможенного органа</td>
                     <td class="graph" style="border:solid 0pt" width="50%">
                        <xsl:apply-templates select="addcrr:CustomsPerson"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt" width="50%">Присвоенный номер дополнения к договору поручительства</td>
                     <td class="graph" style="border:solid 0pt" width="50%">
                        <xsl:apply-templates select="addcrr:AdditionalNumber"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="100%" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt">
                        <u>Причины отказа</u>:<br/>
                        <xsl:for-each select="addcrr:RefuseReason">
                           <xsl:value-of select="addcrr:RefusalReasonCode"/> 
					<xsl:for-each select="addcrr:RefusalReasonDescription">
                              <xsl:value-of select="."/>
                              <xsl:if test="position()!=last()"> </xsl:if>
                           </xsl:for-each>
                           <xsl:if test="position()!=last()">
                              <br/>
                           </xsl:if>
                        </xsl:for-each>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="addcrr:DestinationCustoms">
      <!--ТО-->
      <!-- Таможенный орган -->
      <xsl:choose>
         <xsl:when test="cat_ru:OfficeName">
            <xsl:value-of select="cat_ru:OfficeName"/> 
					(код ТО - <xsl:value-of select="cat_ru:Code"/>
            <xsl:if test="cat_ru:CustomsCountryCode">
							, код государства - <xsl:value-of select="cat_ru:CustomsCountryCode"/>
            </xsl:if>)
				</xsl:when>
         <xsl:otherwise>
					код ТО - <xsl:value-of select="cat_ru:Code"/>
            <xsl:if test="cat_ru:CustomsCountryCode">
						, код государства - <xsl:value-of select="cat_ru:CustomsCountryCode"/>
            </xsl:if>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="addcrr:CustomsPerson">
      <xsl:value-of select="cat_ru:PersonName"/>
      <xsl:if test="cat_ru:LNP"> (<xsl:value-of select="cat_ru:LNP"/>)</xsl:if>
   </xsl:template>
   <xsl:template match="addcrr:AdditionalNumber">
      <!--код/дата/номер-->
      <xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
</xsl:stylesheet>
