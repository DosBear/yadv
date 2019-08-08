<?xml version="1.0" encoding="utf-8"?>
<!--
Письмо ФТС от 07.02.2018 № 06-108/06800 о документах, администрирование которых входит в компетенцию УТН (Приложение 5 на стр.23)
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:seav="urn:customs.ru:Information:SertifDocuments:SertifEAVForm:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:catSert_ru="urn:customs.ru:Information:SertifDocuments:SertifCommonAggregateTypesCust:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
	<!-- Шаблон для типа SertifEAVFormType -->
	<xsl:template match="seav:SertifEAVForm">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					width: 210mm;
					max-width: 210mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
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
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					.inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
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
					.bordered { border-collapse: collapse; font-size: 9pt;}
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
					.descr{
						/*font-size: 8pt;*/
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody>
							<tr>
								<th>Сертификат<br/>о происхождении товара</th>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="bordered" width="50%" colspan="3" valign="top">
									<xsl:text>1. Экспортер (наименование компании, адрес и страна)</xsl:text>
									<br/>
									<xsl:apply-templates mode="organization" select="seav:Exporter"/>
								</td>
								<td class="bordered" width="50%" colspan="3" rowspan="2" valign="top">
									<table>
										<tbody>
											<tr>
												<td>
													<xsl:text>4. No </xsl:text>
													<span class="value">&#160;
														<xsl:value-of select="seav:SertifNumber"/>&#160;
													</span>
													<br/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td><b>EAEU-VN FTA<br/><br/>Сертификат о происхождении товара<br/>Формы EAV</b></td>
											</tr>
											<tr>
												<td>
													<br/>
													Выдан в
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:value-of select="seav:IssueCountryName"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'center'"/>
														<xsl:with-param name="description" select="'(страна)'"/>
													</xsl:call-template>
													Для предоставления в
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:value-of select="seav:DestinCountryName"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'center'"/>
														<xsl:with-param name="description" select="'(страна)'"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="bordered" colspan="3" valign="top">
									<xsl:text>2. Импортер/Грузополучатель (наименование компании, адрес и страна)</xsl:text>
									<br/>
									<xsl:apply-templates mode="organization" select="seav:Importer"/>
									<xsl:if test="seav:Recipient">
										<br/><br/>
										<xsl:apply-templates mode="organization" select="seav:Recipient"/>
									</xsl:if>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="3">
									3. Средства транспорта и маршрут следования (насколько это известно)<br/>
									<xsl:apply-templates select="seav:TransportMeansRoute"/>
								</td>
								<td class="bordered" colspan="3">
									5. Для служебных отметок<br/>
									<xsl:for-each select="seav:SpecialComments">
										<xsl:value-of select="position()"/>
										<xsl:text>) </xsl:text>
										<xsl:apply-templates select="seav:Comments"/>
										<xsl:if test="seav:SertificatKindInfo">
											<xsl:text> сведения о замене оригинала: </xsl:text>
											<xsl:variable name="certNum" select="seav:SertificatKindInfo/seav:Number"/>
											<xsl:variable name="certDate">
												<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="seav:SertificatKindInfo/seav:Date"/></xsl:call-template>
											</xsl:variable>
											<xsl:choose>
												<xsl:when test="seav:SertificatKindInfo/seav:SertificatKind=1"> DUPLICATE OF THE CERTIFICATE  OF ORIGIN NUMBER <xsl:value-of select="$certNum"/> DATE <xsl:value-of select="$certDate"/></xsl:when>
												<xsl:when test="seav:SertificatKindInfo/seav:SertificatKind=2"> ISSUED IN SUBSTITUTION FOR THE CERTIFICATE OF ORIGIN NUMBER <xsl:value-of select="$certNum"/> DATE <xsl:value-of select="$certDate"/></xsl:when>
												<xsl:when test="seav:SertificatKindInfo/seav:SertificatKind=3"> ISSUED RETROACTIVELY</xsl:when>
											</xsl:choose>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered">6. Номер наименования</td>
								<td class="bordered">7. Количество и вид упаковки</td>
								<td class="bordered">8. Описание товара</td>
								<td class="bordered">9. Критерий происхождения</td>
								<td class="bordered">10. Количество товара</td>
								<td class="bordered">11. Номер и дата счета-фактуры</td>
							</tr>
							<xsl:for-each select="seav:Goods">
								<tr valign="top">
									<td class="bordered">
										<xsl:value-of select="seav:GoodsNumeric"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="seav:PlacesDescription"/>
										<xsl:if test="seav:GoodsPlacesQuantity">
											<br/>
											<xsl:text>кол-во: </xsl:text>
											<xsl:value-of select="seav:GoodsPlacesQuantity"/>
										</xsl:if>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="seav:GoodsDescription"/>
										<br/>
										<xsl:text>код ГС: </xsl:text><xsl:value-of select="seav:HarmonizedCode"/>
										<xsl:if test="seav:Model">
											<br/>
											<xsl:text>модель: </xsl:text><xsl:value-of select="seav:Model"/>
										</xsl:if>
										<xsl:if test="seav:TradeMark">
											<br/>
											<xsl:text>ТМ: </xsl:text><xsl:value-of select="seav:TradeMark"/>
										</xsl:if>
										<xsl:for-each select="seav:GoodsInvoice[seav:TCI=2]">
											<br/>
											<xsl:apply-templates mode="document" select="seav:Invoice"/>
											<xsl:if test="seav:TCI">
												<br/>
												<xsl:value-of select="seav:TCICompany/cat_ru:OrganizationName"/>
												<xsl:if test="seav:TCICompany/catSert_ru:LegalAddress">
													<br/>
													<xsl:text>юр.адрес(а): </xsl:text>
													<xsl:for-each select="seav:TCICompany/catSert_ru:LegalAddress">
														<xsl:apply-templates mode="address" select="."/>
														<xsl:if test="position()!=last()">; </xsl:if>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="seav:TCICompany/catSert_ru:FactAddress">
													<br/>
													<xsl:text>факт.адрес(а): </xsl:text>
													<xsl:for-each select="seav:TCICompany/catSert_ru:FactAddress">
														<xsl:apply-templates mode="address" select="."/>
														<xsl:if test="position()!=last()">; </xsl:if>
													</xsl:for-each>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:choose>
											<xsl:when test="seav:OriginCriterionCode='WO'">Товары полностью получены или произведены на территории одной из Сторон как это предусмотрено статьей 4.4 настоящего Соглашения</xsl:when>
											<xsl:when test="seav:OriginCriterionCode='PE'">Товары произведены в полном объеме на территории одной или обеих Сторон исключительно из материалов, происходящих из одной или обеих Сторон</xsl:when>
											<xsl:when test="seav:OriginCriterionCode='PSR'">Товары произведены на территории одной из Сторон с использованием непроисходящих материалов и удовлетворяют требованиям, установленным в Приложении 3 настоящего соглашения</xsl:when>
										</xsl:choose>
									</td>
									<td class="bordered">
										<xsl:if test="seav:GrossWeightQuantity">
											<xsl:text>вес брутто, кг: </xsl:text>
											<xsl:value-of select="seav:GrossWeightQuantity"/>
										</xsl:if>
										<xsl:if test="seav:NetWeightQuantity">
											<br/>
											<xsl:text>вес нетто, кг: </xsl:text>
											<xsl:value-of select="seav:NetWeightQuantity"/>
										</xsl:if>
										<xsl:if test="seav:GoodsQuantity">
											<br/>
											<xsl:text>кол-во: </xsl:text>
											<xsl:value-of select="seav:GoodsQuantity"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="seav:MeasureUnitQualifierCode"/>
										</xsl:if>
										<xsl:if test="seav:SupplementaryGoodsQuantity">
											<br/>
											<xsl:text>кол-во в ДЕИ: </xsl:text>
											<xsl:value-of select="seav:SupplementaryGoodsQuantity"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="seav:SupplementaryMeasureUnitQualifierCode"/>
										</xsl:if>
									</td>
									<td class="bordered">
										<xsl:for-each select="seav:GoodsInvoice[seav:TCI=0 or seav:TCI=1]">
											<xsl:apply-templates mode="document" select="seav:Invoice"/>
											<xsl:if test="seav:TCI=1">
												<xsl:text> TCI</xsl:text>
											</xsl:if>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
							<tr valign="top">
								<td class="bordered" colspan="3" style="border-bottom: 0;">
									12. Удостоверение
									<br/>
									<br/>
									Настоящим удостоверяется, на основании выполенной проверки, что декларация заявителя соответствует действительности
								</td>
								<td class="bordered" colspan="3" style="border-bottom: 0;">
									13. Declaration by the applicant
									<br/>
									<br/>
									Нижеподписавшийся заявляет, что вышеприведенные сведения соответствуют действительности, что все товары произведены в
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="seav:AppDeclaration/seav:AppCountry"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(страна)'"/>
									</xsl:call-template>
									и что они соответсвуют правилам происхождения, предусмотренным в Главе 4 ("Правила определения происхождения") EAEU-VN FTA
								</td>
							</tr>
							<tr>
								<td class="bordered" colspan="3" style="border-top: 0;height:100%;">
									<table>
										<tbody>
											<tr valign="bottom" class="bordered">
												<td width="30%">
													<xsl:if test="seav:SertifInf/seav:OrganizationName">
														<xsl:value-of select="seav:SertifInf/seav:OrganizationName"/>
														<br/>
													</xsl:if>
													<xsl:apply-templates mode="address" select="seav:SertifInf/seav:Place"/>
												</td>
												<td><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="seav:SertifInf/seav:DateInf"/></xsl:call-template></td>
												<td><xsl:value-of select="seav:SertifInf/seav:FIO"/></td>
												<td></td>
											</tr>
											<tr class="bordered" style="height: 5mm;">
												<td style="border-top:1px dashed black;">Место</td>
												<td style="border-top:1px dashed black;">Дата</td>
												<td style="border-top:1px dashed black;">Подпись</td>
												<td style="border-top:1px dashed black;">Печать</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td class="bordered" colspan="3" style="border-top: 0;height: 100%;">
									<table>
										<tbody>
											<tr valign="bottom" class="bordered">
												<td width="30%"><xsl:apply-templates mode="address" select="seav:AppDeclaration/seav:Place"/></td>
												<td><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="seav:AppDeclaration/seav:DateInf"/></xsl:call-template></td>
												<td><xsl:value-of select="seav:AppDeclaration/seav:FIO"/></td>
												<td></td>
											</tr>
											<tr class="bordered" style="height:5mm;">
												<td style="border-top:1px dashed black;">Место</td>
												<td style="border-top:1px dashed black;">Дата</td>
												<td style="border-top:1px dashed black;">Подпись</td>
												<td style="border-top:1px dashed black;">Печать</td>
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
		<xsl:template mode="document" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template mode="quantity" match="*">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="person_nopost" match="*">
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="person" match="*">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="comma" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="organization">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<!--xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text-->
		<!--xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text-->
		<!--xsl:value-of select="RUScat_ru:PersonId"/>
		<xsl:text> </xsl:text-->
		<!--xsl:apply-templates mode="details" select="RUScat_ru:CommunicationDetails"/>
		<xsl:text> </xsl:text-->
		<xsl:if test="catSert_ru:LegalAddress">
			<br/>
			<xsl:text>юридический адрес: </xsl:text><br/>
			<xsl:for-each select="catSert_ru:LegalAddress">
				<xsl:apply-templates mode="address" select="."/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catSert_ru:FactAddress">
			<br/>
			<xsl:text>фактический адрес: </xsl:text>
			<xsl:for-each select="catSert_ru:FactAddress">
				<xsl:apply-templates mode="address" select="."/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="details" match="*">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> т.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:for-each select="RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="RUScat_ru:CounryName">
			<xsl:text> страна: </xsl:text>
			<xsl:value-of select="RUScat_ru:CounryName"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="month">
		<xsl:param name="number"/>
		<xsl:if test="$number='01'">января</xsl:if>
		<xsl:if test="$number='02'">февраля</xsl:if>
		<xsl:if test="$number='03'">марта</xsl:if>
		<xsl:if test="$number='04'">апреля</xsl:if>
		<xsl:if test="$number='05'">мая</xsl:if>
		<xsl:if test="$number='06'">июня</xsl:if>
		<xsl:if test="$number='07'">июля</xsl:if>
		<xsl:if test="$number='08'">августа</xsl:if>
		<xsl:if test="$number='09'">сентября</xsl:if>
		<xsl:if test="$number='10'">октября</xsl:if>
		<xsl:if test="$number='11'">ноября</xsl:if>
		<xsl:if test="$number='12'">декабря</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:call-template name="month">
					<xsl:with-param name="number" select="substring($dateIn,6,2)"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> г.</xsl:text>
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
