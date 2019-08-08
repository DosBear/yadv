<?xml version="1.0" encoding="utf-8"?>

<!-- Бланк на основании требований в письме ГУИТ №09-125/54006 от 24.10.2016 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:glg="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeLostGoods:5.13.3">
	<!-- Шаблон для типа GuaranteeLostGoodsType -->
	<xsl:template match="glg:GuaranteeLostGoods">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: normal;
									}

									div.page {
									width: 210mm;
									max-width: 210mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									.marg-top
									{
									margin-top:5mm;
									}

									table
									{
									width: 100%;
									border: 0;
									empty-cells: show;
									border-collapse: collapse;
									margin-top: 1px;
									}

									table.border tr td
									{
									border: 1px solid gray;
									}

									.graph {
									font-family: Arial;
									font-size: 10pt;
									}

									.value
									{
									border-bottom: solid 1px black;
									}

									div.title, tr.title td { font-weight:bold;  }
									.bordered { border-collapse: collapse; }
									td.bordered
									{
									border: solid 1px windowtext;
									}

									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}
								</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Решение по результатам таможенного контроля</b>
										<br/>
										<xsl:text>№ </xsl:text><span style="border-bottom: 1px solid black"><xsl:apply-templates select="glg:DecisionNumber"/></span>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tr>
							<td class="graphMain" style="width:38%">По результатам таможенного контроля</td>
							<td style="border-bottom: 1px solid black"><xsl:apply-templates select="glg:PersonPerformingControl"/></td>
						</tr>
						<tr>
							<td/>
							<td style="font-size:8pt;" align="center">(должность, структурное подразделение, ФИО должностного лица, проводившего таможенный контроль)</td>
						</tr>
					</table>
					<br/>
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									УСТAНОВЛЕН:
								</td>
							</tr>
							<tr>
								<td class="graphMain">
									факт недоставки (частичной недоставки) товаров:
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr valign="top">
								<td rowspan="2" class="bordered">№ п/п</td>
								<td rowspan="2" class="bordered">Наименование товаров</td>
								<td rowspan="2" class="bordered">Классификационный код товаров и транспортных средств в соответствии с  ТН ВЭД ЕАЭС</td>
								<td rowspan="2" class="bordered">Таможенная стоимость товаров и транспортных средств</td>
								<td colspan="2" class="bordered">Физические характеристики в натуральном выражении</td>
							</tr>
							<tr>
								<td class="bordered">Кол-во</td>
								<td class="bordered">Ед.изм.</td>
							</tr>
							<xsl:apply-templates select="glg:GoodsInfo"/>
						</tbody>
					</table>
					<xsl:text>перевозимых в соответствии с таможенной процедурой таможенного транзита</xsl:text>
					<table class="w190">
						<tbody>
							<tr>
								<td style="border-bottom: 1px solid black">
									<xsl:for-each select="glg:Violator">
										<xsl:apply-templates select="glg:Carrier"/>
										<xsl:if test="not(glg:Carrier)"><xsl:apply-templates select="glg:DeclarantAEO"/></xsl:if>
										<xsl:if test="position()!=last()">; </xsl:if>
									</xsl:for-each>
									<xsl:if test="glg:TDInfo/glg:DocumentSign">
										<xsl:text>; </xsl:text>
										<xsl:choose>
											<xsl:when test="glg:TDInfo/glg:DocumentSign=1"> ТД <xsl:apply-templates select="glg:TDInfo/glg:TDNumber"/></xsl:when>
											<xsl:when test="glg:TDInfo/glg:DocumentSign=2"> МДП <xsl:apply-templates select="glg:TDInfo/glg:TIRID"/></xsl:when>
										</xsl:choose>
									</xsl:if>	
								</td>
							</tr>
							<tr>
								<td style="font-size:8pt;" align="center">
									(наименование перевозчика, ИНН, адрес / место нахождения, номер и дата свидетельства таможенного перевозчика / или свидетельства уполномоченного экономического оператора, номер и дата книжки МДП / или транзитной декларации)
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>влекущий наступление срока уплаты таможенных пошлин, налогов </xsl:text><span style="border-bottom:1px solid black;"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="glg:ViolationInfo/glg:DayExecuteObligationsPay"/></xsl:call-template></span>
									<xsl:text> в соответствии со статьями </xsl:text>
									<xsl:for-each select="glg:ViolationInfo">
										<xsl:if test="glg:KodeksArticlesNumber">
											<u> <xsl:value-of select="glg:KodeksArticlesNumber"/> </u>
											<xsl:text> Таможенного кодекса ЕАЭС</xsl:text>
										</xsl:if>
										<xsl:if test="glg:FZArticlesNumber">
											<xsl:if test="glg:KodeksArticlesNumber">, </xsl:if>
											<u> <xsl:value-of select="glg:FZArticlesNumber"/> </u>
											<xsl:text> Федерального закона от 27 ноября 2010 г. № 311-ФЗ "О таможенном регулировании в Российской Федерации"</xsl:text>
										</xsl:if>
									</xsl:for-each>
									<xsl:text>.</xsl:text><br/><br/>
									<xsl:text>Информация о наличии обеспечения уплаты таможенных пошлин, налогов: </xsl:text>
									<span style="border-bottom:1px solid black;">
										<xsl:choose>
											<xsl:when test="glg:TDGuarantee/glg:GuaranteePresence=0">отсутствие</xsl:when>
											<xsl:when test="glg:TDGuarantee/glg:GuaranteePresence=1">наличие</xsl:when>
											<xsl:when test="glg:TDGuarantee/glg:GuaranteePresence=2">предварительное декларирование</xsl:when>
											<xsl:otherwise><xsl:value-of select="glg:TDGuarantee/glg:GuaranteePresence"/></xsl:otherwise>
										</xsl:choose>
									</span>
									<xsl:text>, способ обеспечения уплаты таможенных пошлин, налогов </xsl:text>
									<span style="border-bottom: 1px solid black;">
										<xsl:choose>
											<xsl:when test="glg:TDGuarantee/glg:GuaranteeMethod=1">банковская карта</xsl:when>
											<xsl:when test="glg:TDGuarantee/glg:GuaranteeMethod=2">денежные средства</xsl:when>
											<xsl:when test="glg:TDGuarantee/glg:GuaranteeMethod=3">поручительство</xsl:when>
											<xsl:otherwise><xsl:value-of select="glg:TDGuarantee/glg:GuaranteeMethod"/></xsl:otherwise>
										</xsl:choose>
									</span>
									<xsl:text>. </xsl:text>
									<br/><br/>
									<xsl:text>Информация о лицах, несущих солидарную ответственность: </xsl:text>
									<table class="w190">
										<tr>
											<td style="border-bottom: 1px solid black">
												<xsl:for-each select="glg:LiableTrader">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
										<tr>
											<td style="font-size:8pt;" align="center">(наименование, ИНН, место нахождения)</td>
										</tr>
									</table>
									<br/>
									<table class="w190">
										<tr>
											<td class="graphMain" style="width:15%">Приложение.</td>
											<td style="border-bottom: 1px solid black">
												<xsl:for-each select="glg:AttachedDocument">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
										<tr>
											<td style="font-size:8pt;" align="center" colspan="2">(перечень документов, предусмотренных пунктом 7 Порядка взаимодействия подразделений таможенных органов при взыскании таможенных пошлин, налогов в случае недоставки иностранных товаров, перевозимых в соответствии с тамоежнной процедурой таможенного транзита, с указанием количества листов и экземпляров)</td>
										</tr>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/><br/>
					<table>
						<tbody>
							<tr>
								<td colspan="5">Начальник (заместитель начальника)</td>
							</tr>
							<tr align="center">
								<td style="border-bottom: 1px solid black; width:48%">
									<xsl:for-each select="glg:HeadCustomsDepartment/glg:DepartmentCode/*">
										<xsl:value-of select="."/>
										<xsl:text> </xsl:text>
									</xsl:for-each>
								</td>
								<td> </td>
								<td style="border-bottom: 1px solid black; width:18%"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
								<td> </td>
								<td style="border-bottom: 1px solid black; width:33%">
									<xsl:value-of select="glg:HeadCustomsDepartment/cat_ru:PersonName"/>
								</td>
							</tr>
							<tr align="center">
								<td style="font-size:8pt;">(наименование таможенного органа)</td>
								<td> </td>
								<td style="font-size:8pt;">(подпись)</td>
								<td> </td>
								<td style="font-size:8pt;">(Ф.И.О.)</td>
							</tr>
							<tr align="center">
								<td style="border-bottom: 1px solid black;">
									<xsl:for-each select="glg:PersonTookDecision/glg:DepartmentCode/*">
										<xsl:value-of select="."/>
										<xsl:text> </xsl:text>
									</xsl:for-each>
								</td>
								<td> </td>
								<td style="border-bottom: 1px solid black;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
								<td> </td>
								<td style="border-bottom: 1px solid black;">
									<xsl:value-of select="glg:PersonTookDecision/cat_ru:PersonName"/>
								</td>
							</tr>
							<tr align="center">
								<td style="font-size:8pt;">(должностное лицо отдела контроля за транзитом товара)</td>
								<td></td>
								<td style="font-size:8pt;">(подпись)</td>
								<td></td>
								<td style="font-size:8pt;">(Ф.И.О.)</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="glg:AttachedDocument| glg:CarrierSertificate">
		<xsl:if test="cat_ru:PrDocumentName"><xsl:value-of select="cat_ru:PrDocumentName"/></xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/></xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
		</xsl:if>
		<xsl:if test="glg:DocLists"> листов <xsl:value-of select="glg:DocLists"/></xsl:if>
		<xsl:if test="glg:DocCopies"> копий <xsl:value-of select="glg:DocCopies"/></xsl:if>
	</xsl:template>
	<xsl:template match="glg:Carrier|glg:DeclarantAEO|glg:LiableTrader">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="glg:Status">
			<xsl:choose>
				<xsl:when test="glg:Status=1"> (гарант)</xsl:when>
				<xsl:when test="glg:Status=2"> (поручитель)</xsl:when>
				<xsl:when test="glg:Status=3"> (АСМАП)</xsl:when>
				<xsl:when test="glg:Status=4"> (иное лицо, предоставившее обеспечение за декларанта процедуры транзита)</xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">, ИНН <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/></xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">, <xsl:apply-templates select="RUScat_ru:SubjectAddressDetails"/></xsl:if>
		<xsl:if test="glg:CarrierAddress">, место нахождения: <xsl:apply-templates select="glg:CarrierAddress"/></xsl:if>
		<xsl:if test="glg:CarrierSertificate">, <xsl:apply-templates select="glg:CarrierSertificate"/></xsl:if>
		<xsl:if test="glg:AEORegistryIdDetails">, <xsl:apply-templates select="glg:AEORegistryIdDetails"/></xsl:if>
	</xsl:template>
	<xsl:template match="glg:AEORegistryIdDetails">
		<xsl:text>код типа реестра УЭО: </xsl:text>
		<xsl:value-of select="RUScat_ru:RegistryOwnerCode"/>
		<xsl:if test="RUScat_ru:CountryA2Code"> (<xsl:value-of select="RUScat_ru:CountryA2Code"/>) </xsl:if>
		 № <xsl:value-of select="RUScat_ru:DocId"/>
		 тип свидетельства: <xsl:value-of select="RUScat_ru:AEORegistryKindCode"/>
	</xsl:template>
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:value-of select="RUScat_ru:CounryName"/>
		<xsl:if test="RUScat_ru:Region">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="glg:CarrierAddress">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="glg:GoodsInfo">
		<tr valign="top">
			<td class="bordered">
				<xsl:value-of select="RUScat_ru:GoodsNumeric"/>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="RUScat_ru:GoodsDescription"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="RUScat_ru:GoodsTNVEDCode"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="glg:InvoicedCost"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="glg:ContractCurrencyCode"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="RUScat_ru:GoodsMeasureDetails/cat_ru:GoodsQuantity"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="RUScat_ru:GoodsMeasureDetails/cat_ru:MeasureUnitQualifierName"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="glg:PersonPerformingControl">
		<xsl:value-of select="glg:PersonPost"/>
		<xsl:if test="glg:DepartmentCode">
			<xsl:text>, </xsl:text>
			<xsl:for-each select="glg:DepartmentCode/*">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:text>, </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<!--xsl:if test="cat_ru:LNP">, ЛНП: <xsl:value-of select="cat_ru:LNP"/></xsl:if-->
	</xsl:template>
	<xsl:template match="glg:TIRID">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="glg:DecisionNumber|glg:TDNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/><xsl:value-of select="substring($dateIn,6,2)"/><xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
