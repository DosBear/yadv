<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="gref cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gref="urn:customs.ru:Information:CustomsDocuments:GTDReference:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
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
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
   <xsl:template match="gref:GTDReference">
      <html>
         <head>
            <title>Справка, прилагаемая к грузовой таможенной декларации</title>
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
               <table>
                  <tbody>
                     <tr>
                        <td align="center">
								СПРАВКА<br/>
								прилагаемая к грузовой таможенной декларации<br/>
								№<u>
                              <xsl:value-of select="gref:GTDNumber/cat_ru:CustomsCode"/>/
								<xsl:call-template name="russian_date_gtd">
                                 <xsl:with-param name="dateIn" select="gref:GTDNumber/cat_ru:RegistrationDate"/>
                              </xsl:call-template>/
								<xsl:value-of select="gref:GTDNumber/cat_ru:GTDNumber"/>
                           </u>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>Раздел "А"</td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="0" cellspacing="0" style="width:180mm">
                  <tbody>
                     <tr>
                        <td style="width:40mm">1. Наименование товара</td>
                        <td colspan="2" style="width:50mm">
                           <xsl:text> </xsl:text> </td>
                        <td style="width:90mm">
                           <xsl:for-each select="gref:GoodsInformation/gref:GoodsDescription">
                              <xsl:value-of select="."/> 
									</xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:40mm">2. Количество товара</td>
                        <td colspan="2" style="width:50mm">л/шт.бут./шт.упак./шт.пачек</td>
                        <td style="width:90mm">
                           <xsl:value-of select="gref:GoodsInformation/gref:IndividualPackingInfo/cat_ru:GoodsQuantity"/>
									(<xsl:value-of select="gref:GoodsInformation/gref:IndividualPackingInfo/cat_ru:MeasureUnitQualifierName"/>)/
									<xsl:value-of select="gref:GoodsInformation/gref:GoodsPackingInfo/cat_ru:GoodsQuantity"/> 
									(<xsl:value-of select="gref:GoodsInformation/gref:GoodsPackingInfo/cat_ru:MeasureUnitQualifierName"/>)
								</td>
                     </tr>
                     <tr>
                        <td style="width:40mm">3. Отметка о наличии маркировки товаров акцизными марками (для товаров, подлежащих маркировке акцизными марками)</td>
                        <td colspan="2" style="width:50mm">Товар маркирован акцизными  марками (в случае их отсутствия - реквизиты разрешительного документа)</td>
                        <td style="width:90mm">
                           <xsl:choose>
                              <xsl:when test="(gref:GoodsInformation/gref:MarkIndicator='false') or (gref:GoodsInformation/gref:MarkIndicator=0)">
                                 <xsl:value-of select="gref:GoodsInformation/gref:SellPermitionDoc/cat_ru:PrDocumentName"/> 
											от <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="gref:GoodsInformation/gref:SellPermitionDoc/cat_ru:PrDocumentDate"/>
                                 </xsl:call-template> 
											№<xsl:value-of select="gref:GoodsInformation/gref:SellPermitionDoc/cat_ru:PrDocumentNumber"/> 
										</xsl:when>
                              <xsl:otherwise>Товар маркирован акцизными марками</xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:40mm">4. Производитель товара</td>
                        <td colspan="2" style="width:50mm">Страна происхождения товара, наименование производителя,его местонахождение (адрес)</td>
                        <td style="width:90mm">
                           <xsl:value-of select="gref:GoodsInformation/gref:Manufacturer/cat_ru:OrganizationName"/> 
							<xsl:for-each select="gref:GoodsInformation/gref:Manufacturer/RUScat_ru:SubjectAddressDetails">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">; </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:40mm">5. Сведения о документах, свидетельствующих о подтверждении соответствия продукции требованиям технических регламентов 
								</td>
                        <td colspan="2" style="width:50mm">Реквизиты соответствующих документов</td>
                        <td style="width:90mm">
                           <xsl:for-each select="gref:GoodsInformation/gref:NormDocs">
                              <xsl:value-of select="cat_ru:PrDocumentName"/> 
											от <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                              </xsl:call-template> 
											№<xsl:value-of select="cat_ru:PrDocumentNumber"/> 
									</xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td rowspan="6" style="width:40mm">6. Сведения о лицах, заключивших внешнеторговый контракт </td>
                        <td colspan="2" style="width:50mm">Дата и номер договора</td>
                        <td style="width:90mm">
                           <xsl:value-of select="gref:GoodsInformation/gref:Contract/cat_ru:PrDocumentName"/> 
											от <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="gref:GoodsInformation/gref:Contract/cat_ru:PrDocumentDate"/>
                           </xsl:call-template> 
											№<xsl:value-of select="gref:GoodsInformation/gref:Contract/cat_ru:PrDocumentNumber"/> 
								 </td>
                     </tr>
                     <tr>
                        <td rowspan="4" style="width:25mm">Российская сторона договора</td>
                        <td style="width:25mm">Наименование лица </td>
                        <td style="width:90mm">
                           <xsl:value-of select="gref:RussianContractPart/cat_ru:OrganizationName"/> 
									<xsl:if test="gref:RussianContractPart/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName">
                              <xsl:value-of select="gref:RussianContractPart/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName"/> 
										<xsl:if test="gref:RussianContractPart/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardSeries">
											серия <xsl:value-of select="gref:RussianContractPart/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardSeries"/> 
										</xsl:if>
                              <xsl:if test="gref:RussianContractPart/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardNumber">
											№ <xsl:value-of select="gref:RussianContractPart/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardNumber"/> 
										</xsl:if>
                              <xsl:if test="gref:RussianContractPart/RUScat_ru:IdentityCard/RUScat_ru:OrganizationName">
											выдан <xsl:value-of select="gref:RussianContractPart/RUScat_ru:IdentityCard/RUScat_ru:OrganizationName"/> 
										</xsl:if>
                              <xsl:if test="gref:RussianContractPart/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardDate">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="gref:RussianContractPart/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardDate"/>
                                 </xsl:call-template> 
										</xsl:if>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:25mm">ОГРН</td>
                        <td style="width:90mm">
                           <xsl:value-of select="gref:RussianContractPart/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:25mm">ИНН/КПП</td>
                        <td style="width:90mm">
                           <xsl:if test="gref:RussianContractPart/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                              <xsl:value-of select="gref:RussianContractPart/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                           </xsl:if>
                           <xsl:if test="gref:RussianContractPart/cat_ru:RFOrganizationFeatures/cat_ru:INN and gref:RussianContractPart/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
							   <xsl:text>/</xsl:text>
                           </xsl:if>
                           <xsl:if test="gref:RussianContractPart/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                              <xsl:value-of select="gref:RussianContractPart/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:25mm">Адрес</td>
                        <td style="width:90mm">
                           <xsl:for-each select="gref:RussianContractPart/RUScat_ru:SubjectAddressDetails">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">; </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:50mm">Контрагент</td>
                        <td style="width:90mm">
                           <xsl:value-of select="gref:Contractor/cat_ru:OrganizationName"/> 
							<xsl:for-each select="gref:Contractor/RUScat_ru:SubjectAddressDetails">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">; </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td rowspan="4">7. Собственник товара</td>
                        <td colspan="2" style="width:50mm">Наименование лица</td>
                        <td style="width:90mm">
                           <xsl:value-of select="gref:GoodsOwner/cat_ru:OrganizationName"/> 
									<xsl:if test="gref:GoodsOwner/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName">
                              <xsl:value-of select="gref:GoodsOwner/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName"/> 
										<xsl:if test="gref:GoodsOwner/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardSeries">
											серия<xsl:value-of select="gref:GoodsOwner/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardSeries"/> 
										</xsl:if>
                              <xsl:if test="gref:GoodsOwner/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardNumber">
											№<xsl:value-of select="gref:GoodsOwner/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardNumber"/> 
										</xsl:if>
                              <xsl:if test="gref:GoodsOwner/RUScat_ru:IdentityCard/RUScat_ru:OrganizationName">
											выдан<xsl:value-of select="gref:GoodsOwner/RUScat_ru:IdentityCard/RUScat_ru:OrganizationName"/> 
										</xsl:if>
                              <xsl:if test="gref:GoodsOwner/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardDate">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="gref:GoodsOwner/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardDate"/>
                                 </xsl:call-template> 
										</xsl:if>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:50mm">ОГРН</td>
                        <td style="width:90mm">
                           <xsl:value-of select="gref:GoodsOwner/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:50mm">ИНН/КПП</td>
                        <td style="width:90mm">
                           <xsl:if test="gref:GoodsOwner/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                              <xsl:value-of select="gref:GoodsOwner/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                           </xsl:if>
                           <xsl:if test="gref:GoodsOwner/cat_ru:RFOrganizationFeatures/cat_ru:INN and gref:GoodsOwner/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
							   <xsl:text>/</xsl:text>
                           </xsl:if>
                           <xsl:if test="gref:GoodsOwner/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                              <xsl:value-of select="gref:GoodsOwner/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:50mm">Адрес</td>
                        <td style="width:90mm">
                           <xsl:for-each select="gref:GoodsOwner/RUScat_ru:SubjectAddressDetails">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">; </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td rowspan="4" style="width:40mm">8. Получатель товара</td>
                        <td colspan="2" style="width:50mm">Наименование лица</td>
                        <td style="width:90mm">
                           <xsl:value-of select="gref:Recipient/cat_ru:OrganizationName"/> 
									<xsl:if test="gref:Recipient/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName">
                              <xsl:value-of select="gref:Recipient/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName"/> 
										<xsl:if test="gref:Recipient/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardSeries">
											серия<xsl:value-of select="gref:Recipient/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardSeries"/> 
										</xsl:if>
                              <xsl:if test="gref:Recipient/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardNumber">
											№<xsl:value-of select="gref:Recipient/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardNumber"/> 
										</xsl:if>
                              <xsl:if test="gref:Recipient/RUScat_ru:IdentityCard/RUScat_ru:OrganizationName">
											выдан<xsl:value-of select="gref:Recipient/RUScat_ru:IdentityCard/RUScat_ru:OrganizationName"/> 
										</xsl:if>
                              <xsl:if test="gref:Recipient/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardDate">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="gref:Recipient/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardDate"/>
                                 </xsl:call-template> 
										</xsl:if>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:50mm">ОГРН</td>
                        <td style="width:90mm">
                           <xsl:value-of select="gref:Recipient/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:50mm">ИНН/КПП</td>
                        <td style="width:90mm">
                           <xsl:if test="gref:Recipient/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                              <xsl:value-of select="gref:Recipient/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                           </xsl:if>
                           <xsl:if test="gref:Recipient/cat_ru:RFOrganizationFeatures/cat_ru:INN and gref:Recipient/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
							   <xsl:text>/</xsl:text>
                           </xsl:if>
                           <xsl:if test="gref:Recipient/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                              <xsl:value-of select="gref:Recipient/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:50mm">Адрес</td>
                        <td style="width:90mm">
                           <xsl:for-each select="gref:Recipient/RUScat_ru:SubjectAddressDetails">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">; </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td rowspan="2" style="width:40mm">9. Наименование таможенного органа</td>
                        <td colspan="2" style="width:50mm">Таможенный орган, расположенный в месте прибытия товара на таможенную границу Российской Федерации</td>
                        <td style="width:90mm">
                           <xsl:value-of select="gref:DestinationCustoms/cat_ru:Code"/> 
									<xsl:value-of select="gref:DestinationCustoms/cat_ru:OfficeName"/>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:50mm">Таможенный орган, осуществивший выпуск товара</td>
                        <td style="width:90mm">
                           <xsl:value-of select="gref:FloatingCustoms/cat_ru:Code"/> 
									<xsl:value-of select="gref:FloatingCustoms/cat_ru:OfficeName"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:40mm">10. Лицо, заполнившее справку:
									<xsl:value-of select="gref:FillingPerson/cat_ru:PersonSurname"/> 
									<xsl:value-of select="gref:FillingPerson/cat_ru:PersonName"/> 
									<xsl:value-of select="gref:FillingPerson/cat_ru:PersonMiddleName"/> 
									<xsl:value-of select="gref:FillingPerson/cat_ru:PersonPost"/>
                           <br/>
									  ____________  
									 "<u>
                              <xsl:value-of select="substring(gref:FillingPerson/cat_ru:IssueDate,9,2)"/>
                           </u>"
									<u>
                              <xsl:choose>
                                 <xsl:when test="(substring(gref:FillingPerson/cat_ru:IssueDate,6,2))='01'">января</xsl:when>
                                 <xsl:when test="(substring(gref:FillingPerson/cat_ru:IssueDate,6,2))='02'">февраля</xsl:when>
                                 <xsl:when test="(substring(gref:FillingPerson/cat_ru:IssueDate,6,2))='03'">марта</xsl:when>
                                 <xsl:when test="(substring(gref:FillingPerson/cat_ru:IssueDate,6,2))='04'">апреля</xsl:when>
                                 <xsl:when test="(substring(gref:FillingPerson/cat_ru:IssueDate,6,2))='05'">мая</xsl:when>
                                 <xsl:when test="(substring(gref:FillingPerson/cat_ru:IssueDate,6,2))='06'">июня</xsl:when>
                                 <xsl:when test="(substring(gref:FillingPerson/cat_ru:IssueDate,6,2))='07'">июля</xsl:when>
                                 <xsl:when test="(substring(gref:FillingPerson/cat_ru:IssueDate,6,2))='08'">августа</xsl:when>
                                 <xsl:when test="(substring(gref:FillingPerson/cat_ru:IssueDate,6,2))='09'">сентября</xsl:when>
                                 <xsl:when test="(substring(gref:FillingPerson/cat_ru:IssueDate,6,2))='10'">октября</xsl:when>
                                 <xsl:when test="(substring(gref:FillingPerson/cat_ru:IssueDate,6,2))='11'">ноября</xsl:when>
                                 <xsl:when test="(substring(gref:FillingPerson/cat_ru:IssueDate,6,2))='12'">декабря</xsl:when>
                              </xsl:choose>
                           </u>
									20<u>
                              <xsl:value-of select="substring(gref:FillingPerson/cat_ru:IssueDate,3,2)"/>
                           </u>г.
							
							</td>
                        <td colspan="2" rowspan="2" style="width:50mm">
                           <!--xsl:value-of select="gref:FillingPerson/cat_ru:PersonSurname"/>&#160;
									<xsl:value-of select="gref:FillingPerson/cat_ru:PersonName"/>&#160;
									<xsl:value-of select="gref:FillingPerson/cat_ru:PersonMiddleName"/>&#160;
									<xsl:value-of select="gref:FillingPerson/cat_ru:PersonPost"/-->
                        </td>
                        <td style="width:90mm">Таможенный орган<br/>
                           <u>
                              <!--xsl:value-of select="gref:FloatingCustoms/cat_ru:Code"/>&#160;
									<xsl:value-of select="gref:FloatingCustoms/cat_ru:OfficeName"/-->
                           </u>
                           <br/>
                           <br/>
                           <br/>
									  ____________  <br/>
									"__" _____20___г.
								<br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:40mm"/>
                        <td style="width:90mm"/>
                     </tr>
                  </tbody>
               </table>
               <xsl:if test="gref:BSideDealInfo">
                  <table>
                     <tbody>
                        <tr>
                           <td colspan="2">Оборотная сторона</td>
                        </tr>
                        <tr>
                           <td>Справка к ГТД №<u>
                                 <xsl:value-of select="gref:GTDNumber/cat_ru:CustomsCode"/>/
								<xsl:call-template name="russian_date_gtd">
                                    <xsl:with-param name="dateIn" select="gref:GTDNumber/cat_ru:RegistrationDate"/>
                                 </xsl:call-template>/
								<xsl:value-of select="gref:GTDNumber/cat_ru:GTDNumber"/>
                              </u>
                           </td>
                           <td/>
                        </tr>
                        <tr>
                           <td/>
                           <td>
									М.П<br/>
									
									"
                              <!--u><xsl:value-of select="substring(gref:BSideDealInfo/gref:CustomSignatureDate,9,2)"/></u-->__"
									
                              <!--u-->
                              <!--xsl:choose>
										<xsl:when test="(substring(gref:BSideDealInfo/gref:CustomSignatureDate,6,2))='01'">января</xsl:when>
										<xsl:when test="(substring(gref:BSideDealInfo/gref:CustomSignatureDate,6,2))='02'">февраля</xsl:when>
										<xsl:when test="(substring(gref:BSideDealInfo/gref:CustomSignatureDate,6,2))='03'">марта</xsl:when>
										<xsl:when test="(substring(gref:BSideDealInfo/gref:CustomSignatureDate,6,2))='04'">апреля</xsl:when>
										<xsl:when test="(substring(gref:BSideDealInfo/gref:CustomSignatureDate,6,2))='05'">мая</xsl:when>
										<xsl:when test="(substring(gref:BSideDealInfo/gref:CustomSignatureDate,6,2))='06'">июня</xsl:when>
										<xsl:when test="(substring(gref:BSideDealInfo/gref:CustomSignatureDate,6,2))='07'">июля</xsl:when>
										<xsl:when test="(substring(gref:BSideDealInfo/gref:CustomSignatureDate,6,2))='08'">августа</xsl:when>
										<xsl:when test="(substring(gref:BSideDealInfo/gref:CustomSignatureDate,6,2))='09'">сентября</xsl:when>
										<xsl:when test="(substring(gref:BSideDealInfo/gref:CustomSignatureDate,6,2))='10'">октября</xsl:when>
										<xsl:when test="(substring(gref:BSideDealInfo/gref:CustomSignatureDate,6,2))='11'">ноября</xsl:when>
										<xsl:when test="(substring(gref:BSideDealInfo/gref:CustomSignatureDate,6,2))='12'">декабря</xsl:when>
									</xsl:choose-->______________
									
									
                              <!--/u-->
									20
                              <!--u><xsl:value-of select="substring(gref:BSideDealInfo/gref:CustomSignatureDate,3,2)"/></u-->____г.<br/>
									(Отметка таможенного органа)
								</td>
                        </tr>
                     </tbody>
                  </table>
                  <xsl:for-each select="gref:BSideDealInfo">
                     <table border="1" cellpadding="0" cellspacing="0" style="width:180mm">
                        <tbody>
                           <tr>
                              <td style="width:90mm">Наименование организации-продавца</td>
                              <td style="width:90mm">Наименование организации-покупателя</td>
                           </tr>
                           <tr>
                              <td style="width:90mm">
                                 <xsl:value-of select="gref:Seller/cat_ru:OrganizationName"/>
                                 <xsl:if test="gref:Seller/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName">
                                    <xsl:value-of select="gref:Seller/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName"/> 
										<xsl:if test="gref:Seller/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardSeries">
											серия <xsl:value-of select="gref:Seller/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardSeries"/> 
										</xsl:if>
                                    <xsl:if test="gref:Seller/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardNumber">
											№ <xsl:value-of select="gref:Seller/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardNumber"/> 
										</xsl:if>
                                    <xsl:if test="gref:Seller/RUScat_ru:IdentityCard/RUScat_ru:OrganizationName">
											выдан <xsl:value-of select="gref:Seller/RUScat_ru:IdentityCard/RUScat_ru:OrganizationName"/> 
										</xsl:if>
                                    <xsl:if test="gref:Seller/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardDate">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="gref:Seller/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardDate"/>
                                       </xsl:call-template> 
										</xsl:if>
                                 </xsl:if>
                                 <xsl:for-each select="gref:Seller/RUScat_ru:SubjectAddressDetails">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">; </xsl:if>
								   </xsl:for-each>
                              </td>
                              <td style="width:90mm">
                                 <xsl:value-of select="gref:Buyer/cat_ru:OrganizationName"/>
                                 <xsl:if test="gref:Buyer/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName">
                                    <xsl:value-of select="gref:Buyer/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName"/> 
										<xsl:if test="gref:Buyer/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardSeries">
											серия<xsl:value-of select="gref:Buyer/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardSeries"/> 
										</xsl:if>
                                    <xsl:if test="gref:Buyer/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardNumber">
											№<xsl:value-of select="gref:Buyer/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardNumber"/> 
										</xsl:if>
                                    <xsl:if test="gref:Buyer/RUScat_ru:IdentityCard/RUScat_ru:OrganizationName">
											выдан<xsl:value-of select="gref:Buyer/RUScat_ru:IdentityCard/RUScat_ru:OrganizationName"/> 
										</xsl:if>
                                    <xsl:if test="gref:Buyer/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardDate">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="gref:Buyer/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardDate"/>
                                       </xsl:call-template> 
										</xsl:if>
                                 </xsl:if>
                                 <xsl:for-each select="gref:Buyer/RUScat_ru:SubjectAddressDetails">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">; </xsl:if>
								   </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td style="width:90mm">Идентификационный номер налогоплательщика-продавца(ИНН/КПП)</td>
                              <td style="width:90mm">Идентификационный номер налогоплательщика-покупателя(ИНН/КПП)</td>
                           </tr>
                           <tr>
                              <td style="width:90mm">
                                 <xsl:if test="gref:Seller/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                                    <xsl:value-of select="gref:Seller/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                 </xsl:if>
								   <xsl:if test="gref:Seller/cat_ru:RFOrganizationFeatures/cat_ru:INN and gref:Seller/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
									   <xsl:text>/</xsl:text>
								   </xsl:if>
                                 <xsl:if test="gref:Seller/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                                    <xsl:value-of select="gref:Seller/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                 </xsl:if>
                              </td>
                              <td style="width:90mm">
                                 <xsl:if test="gref:Buyer/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                                    <xsl:value-of select="gref:Buyer/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                 </xsl:if>
								   <xsl:if test="gref:Buyer/cat_ru:RFOrganizationFeatures/cat_ru:INN and gref:Buyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
									   <xsl:text>/</xsl:text>
								   </xsl:if>
                                 <xsl:if test="gref:Buyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                                    <xsl:value-of select="gref:Buyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                 </xsl:if>
                              </td>
                           </tr>
                           <tr>
                              <td style="width:90mm">Руководитель организации
								<u>
                                    <xsl:value-of select="gref:Seller/gref:DirectorSignature/cat_ru:PersonSurname"/> 
									<xsl:value-of select="gref:Seller/gref:DirectorSignature/cat_ru:PersonName"/> 
									<xsl:value-of select="gref:Seller/gref:DirectorSignature/cat_ru:PersonMiddleName"/> 
									<xsl:value-of select="gref:Seller/gref:DirectorSignature/cat_ru:PersonPost"/>
                                 </u>(Ф.И.О.)
								</td>
                              <td style="width:90mm">Руководитель организации
								<u>
                                    <xsl:value-of select="gref:Buyer/gref:DirectorSignature/cat_ru:PersonSurname"/> 
									<xsl:value-of select="gref:Buyer/gref:DirectorSignature/cat_ru:PersonName"/> 
									<xsl:value-of select="gref:Buyer/gref:DirectorSignature/cat_ru:PersonMiddleName"/> 
									<xsl:value-of select="gref:Buyer/gref:DirectorSignature/cat_ru:PersonPost"/>
                                 </u>(Ф.И.О.)</td>
                           </tr>
                           <tr>
                              <td style="width:90mm">М.П.
								</td>
                              <td style="width:90mm">М.П.</td>
                           </tr>
                           <tr>
                              <td style="width:90mm">Подпись<u>
                                    <xsl:value-of select="gref:Seller/gref:DirectorSignature/cat_ru:PersonSurname"/> 
									<xsl:value-of select="substring(gref:Seller/gref:DirectorSignature/cat_ru:PersonName,1,1)"/>. 
									<xsl:value-of select="substring(gref:Seller/gref:DirectorSignature/cat_ru:PersonMiddleName,1,1)"/>. 
									
                                    <!--xsl:value-of select="gref:Seller/gref:DirectorSignature/cat_ru:PersonPost"/-->
                                 </u> 
									Дата
									<u>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="gref:Seller/gref:DirectorSignature/cat_ru:IssueDate"/>
                                    </xsl:call-template>
                                 </u>
                              </td>
                              <td style="width:90mm">Подпись<u>
                                    <xsl:value-of select="gref:Buyer/gref:DirectorSignature/cat_ru:PersonSurname"/> 
									<xsl:value-of select="substring(gref:Buyer/gref:DirectorSignature/cat_ru:PersonName,1,1)"/>. 
									<xsl:value-of select="substring(gref:Buyer/gref:DirectorSignature/cat_ru:PersonMiddleName,1,1)"/>. 
									
                                    <!--xsl:value-of select="gref:Buyer/gref:DirectorSignature/cat_ru:PersonPost"/-->
                                 </u> 
									Дата
									<u>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="gref:Buyer/gref:DirectorSignature/cat_ru:IssueDate"/>
                                    </xsl:call-template>
                                 </u>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </xsl:for-each>
               </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
