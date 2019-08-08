<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="sst2 cat_ru catSert_ru" version="1.0" xmlns:catSert_ru="urn:customs.ru:Information:SertifDocuments:SertifCommonAggregateTypesCust:5.13.1" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.0" xmlns:sst2="urn:customs.ru:Information:SertifDocuments:SertifST2Form:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="sst2:SertifST2Form">
      <html>
         <head>
            <title>Сертификат о происхождении товаров формы СТ-2</title>
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
						font-size: 9pt;
						font-weight: bold;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
				</style>
         </head>
         <body>
            <div class="page">
               <table border="1" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:80mm;" valign="top">
                           <span class="graphNo">1 </span>
                           <span class="graph">Грузоотправитель/экспортер (наименование и адрес)</span>
                           <br/>
                           <xsl:apply-templates select="sst2:SenderInformation"/>
                           <br/>
                           <xsl:apply-templates select="sst2:ExporterInformation"/>
                        </td>
                        <td align="center" class="graph" style="width:100mm;" valign="top">
                           <span class="graphNo">4 </span>
                           <span class="graph">№ </span>
                           <xsl:value-of select="sst2:SertifNumber"/>
                           <xsl:value-of select="sst2:RegNumber"/>
                           <h4>Сертификат о происхождении товара</h4>
                           <xsl:text>Форма СТ-2</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:80mm;" valign="top">
                           <span class="graphNo">2 </span>
                           <span class="graph">Грузополучатель/импортер (наименование и адрес)</span>
                           <br/>
                           <xsl:apply-templates select="sst2:Recipient"/>
                           <br/>
                           <xsl:apply-templates select="sst2:Importer"/>
                        </td>
                        <td>
                           <table>
                              <tbody>
                                 <tr>
                                    <td class="graph" style="width:50mm;">
                                       <xsl:text>Выдан в</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:50mm;border-bottom:solid 0.8pt #000000;">
                                       <xsl:value-of select="sst2:IssueCountryName"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:50mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="center" class="graphLittle" style="width:50mm;">
                                       <xsl:text>(наименование страны)</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:50mm;">
                                       <xsl:text>Для предоставления в</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:50mm;border-bottom:solid 0.8pt #000000;">
                                       <xsl:value-of select="sst2:DestinCountryName"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:50mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="center" class="graphLittle" style="width:50mm;">
                                       <xsl:text>(наименование страны)</xsl:text>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:80mm;" valign="top">
                           <span class="graphNo">3 </span>
                           <span class="graph">Средства транспорта и маршрут следования (насколько это известно)</span>
                           <br/>
                           <xsl:for-each select="sst2:TransportMeansRoute">
                              <xsl:value-of select="."/>
                              <xsl:text> </xsl:text>
                           </xsl:for-each>
                        </td>
                        <td class="graph" style="width:100mm;" valign="top">
                           <span class="graphNo">5 </span>
                           <span class="graph">Для служебных отметок</span>
                           <br/>
                           <xsl:for-each select="sst2:SpecialComments">
                              <xsl:value-of select="."/>
                              <xsl:text> </xsl:text>
                           </xsl:for-each>
                           <!--xsl:if test="sst2:Contract">
                              <br/>Контракт
									<xsl:for-each select="sst2:Contract">
                                 <xsl:if test="cat_ru:PrDocumentNumber">№<xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                    <xsl:text> </xsl:text>
                                 </xsl:if>
                                 <xsl:if test="cat_ru:PrDocumentDate">
                                    <xsl:text>от  </xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                 </xsl:if>
                                 <br/>
                              </xsl:for-each>
                           </xsl:if-->
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td align="center" class="graph" style="width:10mm;" valign="middle">
                           <span class="graphNo">6 </span>
                           <span class="graph">№</span>
                        </td>
                        <td align="center" class="graph" style="width:30mm;" valign="middle">
                           <span class="graphNo">7 </span>
                           <span class="graph">Количество мест и вид упаковки</span>
                        </td>
                        <td align="center" class="graph" style="width:70mm;" valign="middle">
                           <span class="graphNo">8 </span>
                           <span class="graph">Описание товара</span>
                        </td>
                        <td align="center" class="graph" style="width:10mm;" valign="middle">
                           <span class="graphNo">9 </span>
                           <span class="graph">Критерий проис- хождения</span>
                        </td>
                        <td align="center" class="graph" style="width:30mm;" valign="middle">
                           <span class="graphNo">10 </span>
                           <span class="graph">Количество товара</span>
                        </td>
                        <td align="center" class="graph" style="width:30mm;" valign="middle">
                           <span class="graphNo">11 </span>
                           <span class="graph">Номер и дата счета фактуры</span>
                        </td>
                     </tr>
                     <xsl:for-each select="sst2:Goods">
                        <tr>
                           <td align="center" class="graph" style="width:10mm;">
                              <xsl:value-of select="sst2:GoodsNumeric"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td class="graph" style="width:30mm;">
                              <xsl:value-of select="sst2:PlacesDescription"/>
                              <br/>
                              <xsl:value-of select="sst2:GoodsPlacesQuantity"/>
                           </td>
                           <td class="graph" style="width:70mm;">
                              <xsl:for-each select="sst2:GoodsDescription">
                                 <xsl:value-of select="."/>
                              </xsl:for-each>
                           </td>
                           <td align="center" class="graph" style="width:10mm;">
                              <xsl:value-of select="sst2:OriginCriterionCode"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graph" style="width:30mm;">
                              <xsl:value-of select="sst2:GrossWeightQuantity"/>
                              <xsl:if test="sst2:NetWeightQuantity">
										/ 
										<xsl:value-of select="sst2:NetWeightQuantity"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="width:30mm;">
                              <xsl:for-each select="sst2:GoodsInvoice">
                                 <xsl:if test="cat_ru:PrDocumentNumber">
                                    <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:if test="cat_ru:PrDocumentDate">
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                 </xsl:if>,
										</xsl:for-each>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <!--xsl:for-each select="../sst2:Invoice">
                                 <xsl:if test="cat_ru:PrDocumentNumber">
                                    <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:if test="cat_ru:PrDocumentDate">
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                 </xsl:if>,
										</xsl:for-each-->
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <table border="1" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:100mm;" valign="top">
                           <span class="graphNo">12 </span>
                           <span class="graph">Удостоверение</span>
                           <br/>
                           <xsl:text>Настоящим удостоверяется, что декларация заявителя соответствует действительности</xsl:text>
                           <table border="0" cellpadding="3" cellspacing="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" colspan="3" style="width:100mm;">
                                       <xsl:value-of select="sst2:SertifInf/sst2:OrganizationName"/>
                                       <br/>
                                       <xsl:if test="sst2:SertifInf/sst2:Place/cat_ru:CountryCode">
                                          <xsl:value-of select="sst2:SertifInf/sst2:Place/cat_ru:CountryCode"/>, 
													</xsl:if>
                                       <xsl:if test="sst2:SertifInf/sst2:Place/cat_ru:CounryName">
                                          <xsl:value-of select="sst2:SertifInf/sst2:Place/cat_ru:CounryName"/>, 
													</xsl:if>
                                       <xsl:if test="sst2:SertifInf/sst2:Place/cat_ru:PostalCode">
                                          <xsl:value-of select="sst2:SertifInf/sst2:Place/cat_ru:PostalCode"/>, 
													</xsl:if>
                                       <xsl:if test="sst2:SertifInf/sst2:Place/cat_ru:Region">
                                          <xsl:value-of select="sst2:SertifInf/sst2:Place/cat_ru:Region"/>, 
													</xsl:if>
                                       <xsl:if test="sst2:SertifInf/sst2:Place/cat_ru:City">
                                          <xsl:value-of select="sst2:SertifInf/sst2:Place/cat_ru:City"/>, 
													</xsl:if>
                                       <xsl:if test="sst2:SertifInf/sst2:Place/cat_ru:StreetHouse">
                                          <xsl:value-of select="sst2:SertifInf/sst2:Place/cat_ru:StreetHouse"/>
                                       </xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="3" style="width:100mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="3" style="width:100mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:50mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="graph" style="width:50mm;">
                                       <xsl:value-of select="sst2:SertifInf/sst2:FIO"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="3" style="width:100mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="3" style="width:100mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:25mm;">
                                       <xsl:value-of select="sst2:SertifInf/sst2:Place/cat_ru:City"/>
                                    </td>
                                    <td align="center" class="graph" style="width:25mm;">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="sst2:SertifInf/sst2:DateInf"/>
                                       </xsl:call-template>
                                    </td>
                                    <td class="graph" style="width:50mm;">
                                       <xsl:value-of select="sst2:SertifInf/sst2:SignPlace"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:25mm;border-top: 2px dotted #000000;">
                                       <xsl:text>Подпись</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:25mm;border-top: 2px dotted #000000;">
                                       <xsl:text>Дата</xsl:text>
                                    </td>
                                    <td class="graph" style="width:50mm;border-top: 2px dotted #000000;">
                                       <xsl:text>Место подписи</xsl:text>
                                    </td>
                                 </tr>
                                 <!--xsl:if test="sst2:AnnuledSertifForm">
                                    <tr>
                                       <td colspan="3">Сведения об аннулированном сертификате: 
														<xsl:if test="sst2:AnnuledSertifForm/cat_ru:PrDocumentNumber">№ <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="sst2:AnnuledSertifForm/cat_ru:PrDocumentNumber"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:if>
                                          <xsl:if test="sst2:AnnuledSertifForm/cat_ru:PrDocumentDate">от<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="sst2:AnnuledSertifForm/cat_ru:PrDocumentDate"/>
                                             </xsl:call-template>
                                          </xsl:if>
                                       </td>
                                       <td>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                 </xsl:if-->
                              </tbody>
                           </table>
                        </td>
                        <td class="graph" style="width:80mm;" valign="top">
                           <span class="graphNo">13 </span>
                           <span class="graph">Декларация заявителя</span>
                           <br/>
                           <xsl:text>Нижеподписавшийся заявляет, что вышеприведенные сведения соответствуют действительности; что все товары полностью произведены или подвергнуты достаточной переработке в</xsl:text>
                           <table border="0" cellpadding="3" cellspacing="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" colspan="3" style="width:80mm;border-bottom:solid 0.8pt #000000;">
                                       <xsl:value-of select="sst2:AppDeclaration/sst2:AppCountry"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graphLittle" colspan="3" style="width:80mm;">
                                       <xsl:text>(наименование страны)</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="3" style="width:80mm;">
                                       <xsl:text>и что все они отвечают требованиям происхождения, установленным в отношении таких товаров</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:40mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="graph" style="width:40mm;">
                                       <xsl:value-of select="sst2:AppDeclaration/sst2:FIO"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="3" style="width:80mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:20mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:20mm;">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="sst2:AppDeclaration/sst2:DateInf"/>
                                       </xsl:call-template>
                                    </td>
                                    <td class="graph" style="width:40mm;">
                                       <xsl:value-of select="sst2:AppDeclaration/sst2:SignPlace"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:20mm;border-top: 2px dotted #000000;">
                                       <xsl:text>Подпись</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:20mm;border-top: 2px dotted #000000;">
                                       <xsl:text>Дата</xsl:text>
                                    </td>
                                    <td class="graph" style="width:40mm;border-top: 2px dotted #000000;">
                                       <xsl:text>Место подписи</xsl:text>
                                    </td>
                                 </tr>
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
   <xsl:template match="sst2:ExporterInformation | sst2:Recipient | sst2:Importer | sst2:SenderInformation">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <br/>
	  <xsl:if test="catSert_ru:OKPOID">Код организации по ОКПО:
			<xsl:value-of select="catSert_ru:OKPOID"/>
		  <br/>
	  </xsl:if>
	  <xsl:if test="catSert_ru:LegalAddress">Юридический адрес:<br/></xsl:if>
      <xsl:for-each select="catSert_ru:LegalAddress">
		  <xsl:apply-templates select="."/>
		  <br/>
	  </xsl:for-each>
	  <xsl:if test="catSert_ru:FactAddress">Фактический адрес:<br/></xsl:if>
      <xsl:for-each select="catSert_ru:FactAddress">
		  <xsl:apply-templates select="."/>
		  <br/>
	  </xsl:for-each>
	  <xsl:if test="catSert_ru:Phone">Тел.: 
		<xsl:for-each select="catSert_ru:Phone">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<br/>
	  </xsl:if>	
	  <xsl:if test="catSert_ru:Fax">Факс: 
		<xsl:for-each select="catSert_ru:Fax">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<br/>
	  </xsl:if>	
	  <xsl:if test="catSert_ru:Email">Email: 
		<xsl:for-each select="catSert_ru:Email">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<br/>
	  </xsl:if>	
   </xsl:template>
   <xsl:template match="catSert_ru:LegalAddress| catSert_ru:FactAddress">
 		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text> Вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
		</xsl:if>
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:if test="RUScat_ru:CounryName">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<!-- xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode"-->
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text>, (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<!--xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/></xsl:if>
			<xsl:if test="RUScat_ru:AOGUID"> Глобальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOGUID"/></xsl:if>
			<xsl:if test="RUScat_ru:AOID"> Уникальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOID"/></xsl:if-->
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	  </xsl:template>
</xsl:stylesheet>
