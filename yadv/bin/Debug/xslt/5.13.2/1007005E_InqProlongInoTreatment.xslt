<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ipi="urn:customs.ru:Information:TreatmentDocuments:InqProlongInoTreatment:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 4.7.0.0 от 25.02.2009.   -->
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
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
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="ipi:InqProlongInoTreatment">
      <html>
         <head>
            <title>Заявление на продление сроков переработки товаров вне таможенной территории</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						width: 210mm;
						height: 297mm;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding:	10mm;
						padding-left:	20mm;
						background: #ffffff;
						border: solid 1pt #000000;
						}
						
					.bordered {
						border: solid 1pt #000000;
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
						
					.underlined {
						border-bottom: solid 0.8pt #000000;
						}
						
					p.NumberDate {
						font-weight: bold;
						}
						
					.graph {
						font-family: Arial;
						font-size: 8pt;
						}
					td {
						font-family:Courier;
						}
	
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						
						.graphNo {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <h4 align="left">	Дата направления запроса: 
									<xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="ipi:SendDate"/>
                  </xsl:call-template>
                  <xsl:text> </xsl:text>
               </h4>
               <h2>Заявление на продление сроков переработки товаров вне таможенной территории
					</h2>
               <h4>
                  <u>
                     <xsl:value-of select="ipi:Customs/cat_ru:Code"/> 
					<xsl:value-of select="ipi:Customs/cat_ru:OfficeName"/>
                  </u>
                  <br/>
                  <font class="graphLittle"> (код и наименование таможенного органа)</font>
               </h4>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">Заявитель </span>
                           <xsl:apply-templates select="ipi:Applicant"/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:180mm;">
									Прошу продлить срок переработки товаров вне таможенной территории до 
									<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ipi:ChangeDate/ipi:NewDate"/>
                           </xsl:call-template>, связи с 
									
									<xsl:value-of select="ipi:ChangeDate/ipi:Motivation"/>
                        </td>
                     </tr>
                     <xsl:if test="ipi:DocumentBase">
                        <tr>
                           <td class="graph" style="width:60mm;">
									Дополнительные документы: 
									
								</td>
                           <xsl:for-each select="ipi:DocumentBase[position()=1]">
                              <td class="graph" style="width:130mm;">
                                 <xsl:value-of select="cat_ru:PrDocumentName"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:if test="cat_ru:PrDocumentNumber"> №
									<xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                    <xsl:text> </xsl:text>
                                 </xsl:if>
                                 <xsl:if test="cat_ru:PrDocumentDate"> от
									<xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                 </xsl:if>
                              </td>
                           </xsl:for-each>
                        </tr>
                        <tr>
                           <td class="graph" style="width:60mm;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <xsl:for-each select="ipi:DocumentBase[position()>1]">
                              <td class="graph" style="width:130mm;">
                                 <xsl:value-of select="cat_ru:PrDocumentName"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:if test="cat_ru:PrDocumentNumber"> №
									<xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                    <xsl:text> </xsl:text>
                                 </xsl:if>
                                 <xsl:if test="cat_ru:PrDocumentDate"> от
									<xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                 </xsl:if>
                              </td>
                           </xsl:for-each>
                        </tr>
                     </xsl:if>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="ipi:Applicant">
      <xsl:value-of select="./cat_ru:OrganizationName"/>
      <xsl:if test="./cat_ru:ShortName">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:value-of select="./cat_ru:ShortName"/>)
									</xsl:if>
      <br/>
      <xsl:if test="./cat_ru:OKPOID">
										ОКПО 
										<xsl:value-of select="./cat_ru:OKPOID"/>
      </xsl:if>
      <xsl:if test="./cat_ru:OKATOCode">
										ОКАТО 
										<xsl:value-of select="./cat_ru:OKATOCode"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
										ОГРН 
										<xsl:value-of select="./cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:INN">
										ИНН 
										<xsl:value-of select="./cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										КПП 
										<xsl:value-of select="./cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
      </xsl:if>
      <br/>
      <xsl:if test="./cat_ru:Contact/cat_ru:Phone">
										тел.
										<xsl:value-of select="./cat_ru:Contact/cat_ru:Phone"/>
      </xsl:if>
      <xsl:if test="./cat_ru:Contact/cat_ru:Fax">
										факс: 
										<xsl:value-of select="./cat_ru:Contact/cat_ru:Fax"/>
      </xsl:if>
      <xsl:if test="./cat_ru:Contact/cat_ru:Telex">
										телекс
										<xsl:value-of select="./cat_ru:Contact/cat_ru:Telex"/>
      </xsl:if>
      <br/>
      <xsl:if test="./cat_ru:Address">
		Адрес:
			<xsl:apply-templates select="./cat_ru:Address"/>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match=" cat_ru:Address/* ">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
</xsl:stylesheet>
