<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catTreat_ru="urn:customs.ru:Information:TreatmentDocuments:TreatmentCommonAggregateTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ipr="urn:customs.ru:Information:TreatmentDocuments:InqChangeInoProd:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="ipr:InqChangeInoProd">
      <html>
         <head>
            <title>Заявление на проведение замены продуктов переработки иностранными товарами</title>
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
                     <xsl:with-param name="dateIn" select="ipr:SendDate"/>
                  </xsl:call-template>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="ipr:SendTime"/>
               </h4>
               <h2>Заявление на проведение замены продуктов переработки иностранными товарами
					</h2>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">Заявитель </span>
                           <xsl:apply-templates select="ipr:Applicant"/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">Иностранные товары, которыми предлагается заменить продукты переработки.: </span>
                           <xsl:if test="ipr:InoProdacts">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                       <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в доп. ед. измерения</td>
                                       <td align="center" class="graph" style="width:20mm;">Стоимость</td>
                                       <td align="center" class="graph" style="width:20mm;">Таможня</td>
                                       <td align="center" class="graph" style="width:30mm;">Контракт</td>
                                    </tr>
                                    <xsl:apply-templates select="ipr:InoProdacts"/>
                                 </tbody>
                              </table>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">Продукты переработки, которые подлежат замене:</span>
                           <xsl:if test="ipr:TreatProducts">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                       <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в доп. ед. измерения</td>
                                       <td align="center" class="graph" style="width:20mm;">Стоимость</td>
                                       <td align="center" class="graph" style="width:20mm;">Таможня</td>
                                       <td align="center" class="graph" style="width:30mm;">Контракт</td>
                                    </tr>
                                    <xsl:apply-templates select="ipr:TreatProducts"/>
                                 </tbody>
                              </table>
                           </xsl:if>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="ipr:Applicant">
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
   <xsl:template match="ipr:InoProdacts | ipr:TreatProducts">
      <xsl:for-each select=".">
         <tr>
            <td align="center" class="graph" style="width:50mm;">
               <xsl:for-each select="catTreat_ru:Name">
                  <xsl:value-of select="."/>
               </xsl:for-each>
            </td>
            <td align="center" class="graph" style="width:20mm;">
               <xsl:value-of select="catTreat_ru:TNVED"/>
            </td>
            <td align="center" class="graph" style="width:20mm;">
               <xsl:if test="catTreat_ru:QuantityKg">
                  <xsl:value-of select="catTreat_ru:QuantityKg"/> кг
															</xsl:if>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="catTreat_ru:AddQuantity"/>
               <xsl:if test="catTreat_ru:AddUnit">
																(код  <xsl:value-of select="catTreat_ru:AddUnit"/>)
															</xsl:if>
            </td>
            <td align="center" class="graph" style="width:20mm;">
               <xsl:value-of select="catTreat_ru:GoodsQuantity"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="catTreat_ru:MeasureUnitQualifierName"/>
               <xsl:if test="catTreat_ru:MeasureUnitQualifierCode">
																(код  <xsl:value-of select="catTreat_ru:MeasureUnitQualifierCode"/>)
															</xsl:if>
            </td>
            <td align="center" class="graph" style="width:20mm;">
               <xsl:value-of select="catTreat_ru:RubCost"/> руб.
															<xsl:if test="catTreat_ru:CurrencyCost">
																, <xsl:value-of select="catTreat_ru:CurrencyCost/catTreat_ru:CurrencyCost"/>
																(код  <xsl:value-of select="catTreat_ru:CurrencyCost/catTreat_ru:CurrencyCode"/>)
															</xsl:if>
            </td>
            <td align="center" class="graph" style="width:20mm;">
               <xsl:value-of select="catTreat_ru:CustomsCode"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </td>
            <td align="center" class="graph" style="width:30mm;">
               <xsl:for-each select="catTreat_ru:Contract">
                  <xsl:if test="cat_ru:PrDocumentNumber">
																	№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                  </xsl:if>
                  <xsl:if test="cat_ru:PrDocumentDate">
																	от 
																	<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                     </xsl:call-template>
                     <br/>
                  </xsl:if>
               </xsl:for-each>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </td>
         </tr>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match=" cat_ru:Address/* ">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
</xsl:stylesheet>
