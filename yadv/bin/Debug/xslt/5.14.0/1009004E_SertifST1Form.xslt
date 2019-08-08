<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="sst cat_ru catSert_ru" version="1.0" xmlns:catSert_ru="urn:customs.ru:Information:SertifDocuments:SertifCommonAggregateTypesCust:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:sst="urn:customs.ru:Information:SertifDocuments:SertifST1Form:5.14.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <!-- п.3.6 ПОЛОЖЕНИЯ О ПОРЯДКЕ ОФОРМЛЕНИЯ, УДОСТОВЕРЕНИЯ И ВЫДАЧИ СЕРТИФИКАТОВ ПРОИСХОЖДЕНИЯ ТОВАРОВ, А ТАКЖЕ ДРУГИХ ДОКУМЕНТОВ, СВЯЗАННЫХ С ОСУЩЕСТВЛЕНИЕМ ВНЕШНЕЭКОНОМИЧЕСКОЙ ДЕЯТЕЛЬНОСТИ-->
   <xsl:template match="sst:SertifST1Form">
      <html>
         <head>
            <title>Сертификат о происхождении товаров формы СТ-1</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						width: 210mm;
						/*height: 297mm;*/
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
                           <xsl:apply-templates select="sst:SenderInformation"/>
                           <br/>
                           <xsl:apply-templates select="sst:ExporterInformation"/>
                        </td>
                        <td class="graph" style="width:100mm;" valign="top">
                           <span class="graphNo">4 </span>
                           <span class="graph">№ </span>
                           <xsl:value-of select="sst:SertifNumber"/>
                           <xsl:value-of select="sst:RegNumber"/>
                           <h3>Сертификат о происхождении товара</h3>
                           <xsl:text>Форма СТ-1</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:80mm;" valign="top">
                           <span class="graphNo">2 </span>
                           <span class="graph">Грузополучатель/импортер (наименование и адрес)</span>
                           <br/>
                           <xsl:apply-templates select="sst:Recipient"/>
                           <br/>
                           <xsl:apply-templates select="sst:Importer"/>
                        </td>
                        <td>
                           <table>
                              <tbody>
                                 <tr>
                                    <td class="graph" style="width:50mm;">
                                       <xsl:text>Выдан в</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:50mm;border-bottom:solid 0.8pt #000000;">
                                       <xsl:value-of select="sst:IssueCountryName"/>
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
                                       <xsl:value-of select="sst:DestinCountryName"/>
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
                           <xsl:for-each select="sst:TransportMeansRoute">
                              <xsl:value-of select="."/>
                              <xsl:text> </xsl:text>
                           </xsl:for-each>
                        </td>
                        <td class="graph" style="width:100mm;" valign="top">
                           <span class="graphNo">5 </span>
                           <span class="graph">Для служебных отметок</span>
                           <br/>
                           <xsl:for-each select="sst:SpecialComments">
                              <xsl:value-of select="."/>
                              <xsl:text> </xsl:text>
                           </xsl:for-each>
                           <xsl:if test="sst:Contract">
                              <br/>Контракт
									<xsl:for-each select="sst:Contract">
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
                           </xsl:if>
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
                     <xsl:for-each select="sst:Goods">
                        <tr>
                           <td align="center" class="graph" style="width:10mm;">
                              <xsl:value-of select="sst:GoodsNumeric"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td class="graph" style="width:30mm;">
                              <xsl:value-of select="sst:PlacesDescription"/>
                              <br/>
                              <xsl:value-of select="sst:GoodsPlacesQuantity"/>
                           </td>
                           <td class="graph" style="width:70mm;">
                              <xsl:for-each select="sst:GoodsDescription">
                                 <xsl:value-of select="."/>
                              </xsl:for-each>
                           </td>
                           <td align="center" class="graph" style="width:10mm;">
                              <xsl:value-of select="sst:OriginCriterionCode"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graph" style="width:30mm;">
                              <xsl:value-of select="sst:GrossWeightQuantity"/>
                              <xsl:if test="sst:NetWeightQuantity">
										/ 
										<xsl:value-of select="sst:NetWeightQuantity"/>
                              </xsl:if>
                              <xsl:if test="(sst:GoodsQuantity and sst:MeasureUnitQualifierCode)">,<br/>
                                 <xsl:value-of select="sst:GoodsQuantity"/> <xsl:value-of select="sst:MeasureUnitQualifierCode"/>
                              </xsl:if>
                              <xsl:if test="(sst:SupplementaryGoodsQuantity and sst:SupplementaryMeasureUnitQualifierCode)">,<br/>
                                 <xsl:value-of select="sst:SupplementaryGoodsQuantity"/> <xsl:value-of select="sst:SupplementaryMeasureUnitQualifierCode"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="width:30mm;">
                              <xsl:for-each select="sst:GoodsInvoice">
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
                              <xsl:for-each select="../sst:Invoice">
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
                                       <xsl:value-of select="sst:SertifInf/sst:OrganizationName"/>
                                       <br/>
                                       <xsl:if test="sst:SertifInf/sst:Place/cat_ru:CountryCode">
                                          <xsl:value-of select="sst:SertifInf/sst:Place/cat_ru:CountryCode"/>, 
													</xsl:if>
                                       <xsl:if test="sst:SertifInf/sst:Place/cat_ru:CounryName">
                                          <xsl:value-of select="sst:SertifInf/sst:Place/cat_ru:CounryName"/>, 
													</xsl:if>
                                       <xsl:if test="sst:SertifInf/sst:Place/cat_ru:PostalCode">
                                          <xsl:value-of select="sst:SertifInf/sst:Place/cat_ru:PostalCode"/>, 
													</xsl:if>
                                       <xsl:if test="sst:SertifInf/sst:Place/cat_ru:Region">
                                          <xsl:value-of select="sst:SertifInf/sst:Place/cat_ru:Region"/>, 
													</xsl:if>
                                       <xsl:if test="sst:SertifInf/sst:Place/cat_ru:City">
                                          <xsl:value-of select="sst:SertifInf/sst:Place/cat_ru:City"/>, 
													</xsl:if>
                                       <xsl:if test="sst:SertifInf/sst:Place/cat_ru:StreetHouse">
                                          <xsl:value-of select="sst:SertifInf/sst:Place/cat_ru:StreetHouse"/>
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
                                       <xsl:value-of select="sst:SertifInf/sst:FIO"/>
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
                                       <xsl:value-of select="sst:SertifInf/sst:Place/cat_ru:City"/>
                                    </td>
                                    <td align="center" class="graph" style="width:25mm;">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="sst:SertifInf/sst:DateInf"/>
                                       </xsl:call-template>
                                    </td>
                                    <td class="graph" style="width:50mm;">
                                       <xsl:value-of select="sst:SertifInf/sst:SignPlace"/>
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
                                 <xsl:if test="sst:AnnuledSertifForm">
                                    <tr>
                                       <td colspan="3">Сведения об аннулированном сертификате: 
														<xsl:if test="sst:AnnuledSertifForm/cat_ru:PrDocumentNumber">№ <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="sst:AnnuledSertifForm/cat_ru:PrDocumentNumber"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:if>
                                          <xsl:if test="sst:AnnuledSertifForm/cat_ru:PrDocumentDate">от<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="sst:AnnuledSertifForm/cat_ru:PrDocumentDate"/>
                                             </xsl:call-template>
                                          </xsl:if>
                                       </td>
                                       <td>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                 </xsl:if>
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
                                       <xsl:value-of select="sst:AppDeclaration/sst:AppCountry"/>
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
                                       <xsl:value-of select="sst:AppDeclaration/sst:FIO"/>
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
                                          <xsl:with-param name="dateIn" select="sst:AppDeclaration/sst:DateInf"/>
                                       </xsl:call-template>
                                    </td>
                                    <td class="graph" style="width:40mm;">
                                       <xsl:value-of select="sst:AppDeclaration/sst:SignPlace"/>
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
   <xsl:template match="sst:ExporterInformation | sst:Recipient | sst:Importer | sst:SenderInformation">
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
