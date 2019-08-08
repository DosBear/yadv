<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:sq_cat="urn:customs.ru:Information:SQDocuments:SQCommonAgregateTypesCust:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:zdrtrs="urn:customs.ru:Information:SQDocuments:RosZdravTranspl:5.13.3">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template name="date_time">
      <xsl:param name="dateTimeIn"/>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring($dateTimeIn,12,5)"/>
   </xsl:template>
   <xsl:template match="zdrtrs:RosZdravTranspl">
      <html>
         <head>
            <title>Ответ на запрос разрешения (заключение) на ввоз костного мозга и гемопоэтических стволовых клеток с целью проведения неродственной трансплантации</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
				body {
					background: #cccccc;
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
					max-width: 297mm;
					/*height: 210mm;*/
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 0pt #000000;
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
					border: 3px double black;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					word-break: break-all;
				}

				td, th {
					border: 1px solid black;
					font-family: Arial, serif;
					font-size: 11pt;
					vertical-align:top;
				}

				.normal
				{
				font-size: 11pt;
				font-family:Arial;
				}			

				.bold
				{
				font-weight: bold;
				font-size: 11pt;
				font-family:Arial;
				}			

				.italic
				{
				font-style: italic;
				font-size: 11pt;
				font-family:Arial;
				}
				
				.status
				{
				font-weight: bold;
				font-size: 12pt;
				font-family:Arial;
				}			
				
			</style>
         </head>
         <body>
            <div class="album_page">
               <h2>Ответ на запрос разрешения (заключение) на ввоз костного мозга и гемопоэтических стволовых клеток с целью проведения неродственной трансплантации</h2>
               <p class="remark">
                  <xsl:choose>
                     <xsl:when test="zdrtrs:IsCanceled='true' or zdrtrs:IsCanceled='t' or zdrtrs:IsCanceled='1' ">Документ не действителен</xsl:when>
                     <xsl:otherwise>Документ действителен</xsl:otherwise>
                  </xsl:choose>
               </p>
               
               <span class="bold">Сведения о заключениях на ввоз костного мозга и гемопоэтических стволовых клеток с целью проведения неродственной трансплантации:</span>
				<xsl:for-each select="zdrtrs:Conclusion">
					<br/>
					<table width="100%">
						<tbody>
							<tr>
								<td width="17%"/>
								<td width="17%"/>
								<td width="16%"/>
								<td width="17%"/>
								<td width="16%"/>
								<td width="17%"/>
							</tr>
							<tr>
								<td colspan="5"><span class="bold">Заключение:</span><br/>
										<span><xsl:apply-templates select="zdrtrs:ConclusionDescription"/></span>
								</td>
								<td><span class="bold">Статус:</span><br/>
									<span><xsl:choose>
										<xsl:when test="zdrtrs:Status='0'"><span class="status" style="color: green">действующее</span></xsl:when>
										<xsl:when test="zdrtrs:Status='1'"><span class="status" style="color: red">аннулированное</span></xsl:when>
										<xsl:when test="zdrtrs:Status='2'"><span class="status" style="color: orange">приостановленное</span></xsl:when>
										<xsl:otherwise><span class="status"><xsl:value-of select="zdrtrs:Status"/>&#160;(расшифровки нет)</span></xsl:otherwise>
									</xsl:choose></span>
								</td>
							</tr>
							<tr>
								<td colspan="6"><span class="bold">Держатель заключения:</span><br/>
										<span><xsl:apply-templates select="zdrtrs:Owner"/></span>
								</td>
							</tr>
							<tr>
								<td colspan="6"><span class="bold">Грузополучатель:</span><br/>
										<span><xsl:apply-templates select="zdrtrs:Recipient"/></span>
								</td>
							</tr>
							<tr>
								<td colspan="6"><span class="bold">Описание договора:</span><br/>
										<span><xsl:apply-templates select="zdrtrs:ContractDescription"/></span>
								</td>
							</tr>
							<tr>
								<td colspan="2"><span class="bold">Страна происхождения:</span><br/>
										<span><xsl:value-of select="zdrtrs:Country"/></span>
								</td>
								<td colspan="2"><span class="bold">Страна назначения/отправления:</span><br/>
										<span><xsl:value-of select="zdrtrs:DestinationCountry"/></span>
								</td>
								<td colspan="2"><span class="bold">Страна транзита:</span><br/>
										<span><xsl:value-of select="zdrtrs:TransitCountry"/></span>
								</td>
							</tr>
							<tr>
								<td colspan="6"><span class="bold">Объект поставки:</span><br/>
									<table style="border: 0px; margin-top: 0px;">
										<tbody>
											<tr>
												<th width="20%">Код ТН ВЭД ЕАЭС</th>
												<th width="60%">Описание товара</th>
												<th width="20%">Количество товара</th>
											</tr>
											<xsl:for-each select="zdrtrs:DeliveryObject">
												<tr>
													<td><span><xsl:value-of select="zdrtrs:TNVEDCode"/></span></td>
													<td>
														<xsl:for-each select="zdrtrs:DescriptionGoods">
															<xsl:apply-templates select="."/>
														</xsl:for-each>
													</td>		
													<td><span><xsl:apply-templates select="zdrtrs:QuantityGoods"/></span></td>
												</tr>
											</xsl:for-each>	
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="1"><span class="bold">Вид перемещения:</span><br/>
										<span>
										<xsl:choose>
											<xsl:when test="zdrtrs:TransferType='0'">ввоз</xsl:when>
											<xsl:when test="zdrtrs:TransferType='0'">вывоз</xsl:when>
										</xsl:choose>
										</span>
								</td>
								<td colspan="5"><span class="bold">Цель ввоза (вывоза):</span><br/>
									<span><xsl:value-of select="zdrtrs:Purpose"/></span>
								</td>
							</tr>
					  </tbody>
				   </table>
				</xsl:for-each>	
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="zdrtrs:QuantityGoods">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>
      <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
      <xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
   </xsl:template>
   <xsl:template match="zdrtrs:ContractDescription | zdrtrs:ConclusionDescription">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			 <xsl:if test="cat_ru:PrDocumentName">,&#160;</xsl:if>
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <xsl:if test="cat_ru:PrDocumentDate">
			 <xsl:if test="cat_ru:PrDocumentNumber or cat_ru:PrDocumentName">,&#160;</xsl:if>
			создан(о) 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <xsl:if test="sq_cat:DateTo">
		 <xsl:if test="cat_ru:PrDocumentNumber or cat_ru:PrDocumentName or cat_ru:PrDocumentDate">,&#160;</xsl:if>
         <span>Документ действителен до </span>
         <xsl:call-template name="date_time">
            <xsl:with-param name="dateTimeIn" select="sq_cat:DateTo"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

	<!--Шаблон для RUScat_ru:OrganizationType-->
	<xsl:template match="zdrtrs:Owner | zdrtrs:Recipient">
		<xsl:if test="cat_ru:OrganizationLanguage">
			Язык заполнения: <xsl:value-of select="cat_ru:OrganizationLanguage"/>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:if test="cat_ru:OrganizationLanguage">;&#160;</xsl:if>
			<xsl:value-of select="cat_ru:OrganizationName" />
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:choose>
				<xsl:when test="string-length(cat_ru:OrganizationName) &gt; 0">
					<span class="normal"> (</span>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="cat_ru:OrganizationLanguage">;&#160;</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:value-of select="cat_ru:ShortName" />
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>

		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures" />
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures" />
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures" />
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures" />
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures" />
	
		<xsl:if test="RUScat_ru:CountryA2Code">
			;&#160;
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code" />
		</xsl:if>
	
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode" />
		</xsl:if>
	
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			;&#160;
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName" />
		</xsl:if>
		
		<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN" />
		</xsl:if>
	
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:call-template name="Address"/>
			</xsl:for-each>
		</xsl:if>
		
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			;&#160;
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">: </span>
			</span>	
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN" />
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP" />
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			;&#160;
			<span class="italic">ОГРН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:OGRN" />
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RKOrganizationFeatures -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			;&#160;
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:BIN" />
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				;&#160;
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:IIN" />
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			;&#160;
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:CategoryCode" />
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:KATOCode" />
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:RNN" />
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:ITNReserv" />
			</xsl:if>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RBOrganizationFeatures -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			;&#160;
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNP" />
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			;&#160;
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber" />
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RAOrganizationFeatures -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			;&#160;
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNN" />
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			;&#160;
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceNumber" />
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			;&#160;
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate" />
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:KGOrganizationFeatures -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			;&#160;
			<span class="italic">ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGINN" />
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			;&#160;
			<span class="italic">ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGOKPO" />
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		;&#160;
		<span class="italic">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode" />
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic"> по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId" />
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		;&#160;
		<span class="italic">УИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:UITNCode" />
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">( </span>
			<span class="italic">страна </span>
			<xsl:value-of select="RUScat_ru:CountryCode" />
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="Address">
		;&#160;
		<span class="italic">Адрес</span>
		<span class="normal">: </span>
		<xsl:variable name="temp">
			<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
		</xsl:variable>
		<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
	</xsl:template>
	
	<xsl:template name="CommunicationDetails">
		;&#160;
		<span class="italic">Контактные данные</span>
		<span class="normal">: </span>
		<xsl:variable name="temp">
			<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
		</xsl:variable>
		<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<span class="italic"> (код вида адреса</span>
			<span class="normal">: </span> 
			<span class="normal"><xsl:value-of select="RUScat_ru:AddressKindCode" /></span> 
			<span class="normal">) </span>
		</xsl:if>
		<span class="normal">: </span> 
		<xsl:if test="RUScat_ru:PostalCode">
			<span class="normal"><xsl:value-of select="RUScat_ru:PostalCode" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"><xsl:value-of select="RUScat_ru:CountryCode" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:CounryName">
			<span class="normal"><xsl:value-of select="RUScat_ru:CounryName" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<span class="normal"><xsl:value-of select="RUScat_ru:Region" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<span class="normal"><xsl:value-of select="RUScat_ru:District" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<span class="normal"><xsl:value-of select="RUScat_ru:Town" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<span class="normal"><xsl:value-of select="RUScat_ru:City" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<span class="normal"><xsl:value-of select="RUScat_ru:StreetHouse" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<span class="normal"><xsl:value-of select="RUScat_ru:House" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<span class="normal"><xsl:value-of select="RUScat_ru:Room" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<span class="normal"><xsl:value-of select="RUScat_ru:AddressText" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO">
			<span class="normal">ОКТМО </span>
			<span class="normal"><xsl:value-of select="RUScat_ru:OKTMO" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKATO">
			<span class="normal">OKАTO </span>
			<span class="normal"><xsl:value-of select="RUScat_ru:OKATO" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:KLADR">
			<span class="normal">КЛАДР </span>
			<span class="normal"><xsl:value-of select="RUScat_ru:KLADR" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:AOGUID">
			<span class="normal">Глобальный идентификатор адресного объекта по ФИАС </span>
			<span class="normal"><xsl:value-of select="RUScat_ru:AOGUID" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:TerritoryCode">
			<span class="normal">Код единицы административно-территориального деления </span>
			<span class="normal"><xsl:value-of select="RUScat_ru:TerritoryCode" /></span> 
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<span class="normal">а/я </span>
			<span class="normal"><xsl:value-of select="RUScat_ru:PostOfficeBoxId" /></span> 
			<span class="normal">, </span>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:ContactType строка -->
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		;&#160;
		<xsl:if test="cat_ru:Phone">
			<span class="normal">Тел: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="normal">Факс: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Fax"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="normal">Телекс: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Telex"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="normal">Email: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="zdrtrs:QuantityGoods">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>
