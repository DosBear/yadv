<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cpri cat_ru catTreat_ru" version="1.0" xmlns:catTreat_ru="urn:customs.ru:Information:TreatmentDocuments:TreatmentCommonAggregateTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cpri="urn:customs.ru:Information:TreatmentDocuments:CustProcessingInvent:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="cpri:CustProcessingInvent">
      <html>
         <head>
            <title>Опись документов, прилагаемая к заявлению на переработку товаров</title>
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
               <h2>
						Опись документов к заявлению на переработку №
						<xsl:value-of select="cpri:InqDocumentID"/>
               </h2>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:180mm;">
									Сведения о заявителе:
									<br/>
                           <xsl:apply-templates select="cpri:Declarant"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <br/>
                           <table border="1" cellpadding="3" cellspacing="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" style="width:10mm;">N</td>
                                    <td align="center" class="graph" style="width:40mm;">Вид, номер и дата составления документа</td>
                                    <td align="center" class="graph" style="width:10mm;">Код вида документа</td>
                                    <td align="center" class="graph" style="width:20mm;">Примечание</td>
                                    <td align="center" class="graph" style="width:25mm;">Идентификатор электронного архива декларанта</td>
                                    <td align="center" class="graph" style="width:25mm;">Идентификатор документа в электронном архиве декларанта</td>
                                    <td align="center" class="graph" style="width:25mm;">Уникальный идентификатор документа в описи</td>
                                    <td align="center" class="graph" style="width:25mm;">Уникальный идентификатор строки в описи</td>
                                 </tr>
                                 <xsl:for-each select="cpri:InventDocument">
                                    <tr>
                                       <td align="center" class="graph" style="width:10mm;">N</td>
                                       <td class="graph" style="width:40mm;">
                                          <xsl:value-of select="cpri:InvDocName"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="cpri:InvDocNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="cpri:InvDocDate"/>
                                          </xsl:call-template>
                                       </td>
                                       <td align="center" class="graph" style="width:10mm;">
                                          <xsl:value-of select="cpri:InvDocCode"/>
                                       </td>
                                       <td class="graph" style="width:20mm;">
                                          <xsl:value-of select="cpri:Note"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graph" style="width:25mm;">
                                          <xsl:value-of select="cpri:ArchID"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graph" style="width:25mm;">
                                          <xsl:value-of select="cpri:ArchDocID"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graph" style="width:25mm;">
                                          <xsl:value-of select="cpri:InventDocumentID"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graph" style="width:25mm;">
                                          <xsl:value-of select="cpri:InventLineID"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="catTreat_ru:RubBankInformation | catTreat_ru:ValBankInformation">
		Банк
		<xsl:value-of select="./catTreat_ru:BankName"/>
		ОКПО
		<xsl:value-of select="./catTreat_ru:BankOKPO"/>
      <xsl:if test="./catTreat_ru:BankMFO">
			МФО 
			<xsl:value-of select="./catTreat_ru:BankMFO"/>
      </xsl:if>
      <xsl:for-each select="./catTreat_ru:BankAccount">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="catTreat_ru:BankAccountDescription"/>
			№ <xsl:value-of select="catTreat_ru:BankAccount"/>,
		</xsl:for-each>
   </xsl:template>
   <xsl:template match="cpri:Declarant">
      <xsl:value-of select="./cat_ru:OrganizationName"/>
      <xsl:if test="./cat_ru:ShortName">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:value-of select="./cat_ru:ShortName"/>)
									</xsl:if>
      <br/>
      <xsl:if test="./catTreat_ru:TreatmentOrganizationAddress">
         <xsl:apply-templates select="./catTreat_ru:TreatmentOrganizationAddress"/>
      </xsl:if>
      <xsl:if test="./catTreat_ru:LegalAddress">
         <xsl:apply-templates select="./catTreat_ru:LegalAddress"/>
      </xsl:if>
      <xsl:if test="./catTreat_ru:Phone">
										тел.
										<xsl:value-of select="./catTreat_ru:Phone"/>
      </xsl:if>
      <xsl:if test="./catTreat_ru:Fax">
										факс
										<xsl:value-of select="./catTreat_ru:Fax"/>
      </xsl:if>
      <xsl:if test="./catTreat_ru:Telex">
										телекс
										<xsl:value-of select="./catTreat_ru:Telex"/>
      </xsl:if>
      <br/>
      <xsl:if test="./catTreat_ru:OKPOID">
										ОКПО 
										<xsl:value-of select="./catTreat_ru:OKPOID"/>
      </xsl:if>
      <xsl:if test="./catTreat_ru:OKATOCode">
										ОКАТО 
										<xsl:value-of select="./catTreat_ru:OKATOCode"/>
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
      <xsl:if test="./cat_ru:RBOrganizationFeatures/cat_ru:UNP">
										УНП
									<xsl:value-of select="./cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RKOrganizationFeatures/cat_ru:BIN">
										БИН
									<xsl:value-of select="./cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RKOrganizationFeatures/cat_ru:IIN">
										ИИН
									<xsl:value-of select="./cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RKOrganizationFeatures/cat_ru:ITN">
										ИТН №
				<xsl:value-of select="./cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:value-of select="./cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:value-of select="./cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:value-of select="./cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
      </xsl:if>
      <xsl:if test="./catTreat_ru:RubBankInformation">
         <br/>
										Рублевый счет:
										<xsl:apply-templates select="./catTreat_ru:RubBankInformation"/>
      </xsl:if>
      <xsl:if test="./catTreat_ru:ValBankInformation">
         <br/>
										Валютный счет:
										<xsl:apply-templates select="./catTreat_ru:ValBankInformation"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="catTreat_ru:TreatmentOrganizationAddress | catTreat_ru:LegalAddress">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="catTreat_ru:TreatmentOrganizationAddress/* | catTreat_ru:LegalAddress/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
</xsl:stylesheet>
