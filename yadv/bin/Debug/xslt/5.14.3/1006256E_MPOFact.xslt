<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.14.3" xmlns:mpf="urn:customs.ru:Information:CustomsDocuments:MPOFact:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
	<!-- Шаблон для типа MPOFactType -->
	<xsl:template match="mpf:MPOFact">
		<html>
			<head>
				<style>
			body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					/*padding-left: 20mm;*/
					background: #ffffff;
					border: solid 0pt #000000;
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
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Arial;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Arial;
				}
				.graph {
							font-family: Arial;
							font-size: 8pt;
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
							
				.graphMain
				{
					border: 0;
				}
				.value
				{
				border-bottom: solid 1px black;
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
										<b>Декларирование фактического прибытия МПО</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный номер реестра</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="mpf:Reestr_ID"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Регистрационный номер реестра МПО</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="mpf:MPOReestr"/>
							</td>
						</tr>
					</table>
					<xsl:if test="mpf:DocDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время формирования документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="date">
										<xsl:with-param name="dateIn" select="mpf:DocDate"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(mpf:DocDate, 12, 8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный номер записи в реестре</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="mpf:MPO_ID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="mpf:RecNum">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Номер по порядку в списке</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mpf:RecNum"/>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
				<xsl:apply-templates select="mpf:MPODecl"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="mpf:MPOReestr">
		<xsl:value-of select="mpco:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="MPOdate">
			<xsl:with-param name="dateIn" select="mpco:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="mpco:MPO_Number"/>
	</xsl:template>
	<xsl:template match="mpf:MPODecl">
		<div class="page">
			<table>
				<tr>
					<td align="center" class="graph" style="border:solid 0pt">
						<font face="Times new roman" size="5">
							<b>
								<i>Лицевая сторона бланка таможенной декларации CN 23</i>
							</b>
						</font>
					</td>
				</tr>
			</table>
			<table border="2" height="150mm" style="border-color: black" width="210mm">
				<span class="graph">
					<!--<table>-->
					<tr>
						<td/>
						<td colspan="5" style="border-left-color: #ffffff" valign="bottom">
							<span class="graph">(Назначенный оператор) <xsl:value-of select="mpco:DesignatedOperator"/>
							</span>
						</td>
						<td align="left" colspan="3" style="border-left-color: #ffffff">
							<span class="graph">
								<b>ТАМОЖЕННАЯ ДЕКЛАРАЦИЯ</b>
							</span>
						</td>
						<td style="border-left-color: #ffffff">
							<span class="graph">
								<b>
                              CN23
                              <br/>
									<xsl:choose>
										<xsl:when test="mpco:DocSign='0'">Основная</xsl:when>
										<xsl:when test="mpco:DocSign='1'">Предварительная</xsl:when>
										<xsl:when test="mpco:DocSign='3'">Возвращамое МПО</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="mpco:DocSign"/>
										</xsl:otherwise>
									</xsl:choose>
								</b>
							</span>
						</td>
						<td rowspan="8" style="border-left-color: #ffffff"/>
					</tr>
					<tr>
						<td rowspan="2" style="padding:5pt" width="10%">
							<span class="graph">Из</span>
						</td>
						<td colspan="3" style="padding:0pt 5pt">
							<span class="graph">Фамилия<br/>
								<xsl:if test="mpco:Consignor/mpco:Person">
									<xsl:value-of select="mpco:Consignor/mpco:Person"/>
								</xsl:if>
								<xsl:if test="mpco:Consignor/mpco:Person and mpco:ConsignorRUS/mpco:Person"> / </xsl:if>
								<xsl:value-of select="mpco:ConsignorRUS/mpco:Person"/>
							</span>
						</td>
						<td colspan="2" rowspan="2" style="padding:0pt 5pt">
							<span class="graph">
						Таможенная ссылка отправителя (если имеется)<br/>
							</span>
						</td>
						<td colspan="4" rowspan="7" style="border-top-color: #ffffff;">
							<table cellspacing="6">
								<tr>
									<td style="border:solid 0pt">
										<span class="graph">№ отправления (штриховой код, если он имеется)<br/>
											<xsl:if test="mpco:MPO_Number">
												<xsl:value-of select="mpco:MPO_Number"/>
											</xsl:if>
										</span>
									</td>
									<td style="border:solid 0pt">
										<span class="graph">Может быть вскрыто в служебном порядке<br/>
										</span>
									</td>
									<td style="border:solid 0pt">
										<span class="graph">
											<b>Внимание!</b>
											<br/>Инструкции на обратной  
							стороне<br/>
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="3" style="border:0pt solid;">
										<span class="graph">
										</span>
									</td>
								</tr>
								<xsl:if test="mpco:MPO_Registration">
									<tr>
										<td colspan="3" style="border:0pt solid;">
											<span class="graph">
												<xsl:text>№ исходного МПО: </xsl:text>
												<xsl:apply-templates select="mpco:MPO_Registration"/>
											</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="mpco:MPOFactWeight">
									<tr>
										<td colspan="3" style="border:0pt solid;">
											<xsl:variable name="factW" select="mpco:MPOFactWeight"/>
											<xsl:variable name="grossW">
												<xsl:choose>
													<xsl:when test="mpco:TotalGrossWeight">
														<xsl:value-of select="mpco:TotalGrossWeight"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="0"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:variable>
											<span class="graph">
												<xsl:text>Разница в весе: </xsl:text>
												<!--xsl:value-of select="format-number(mpco:MPOFactWeight - mpco:TotalGrossWeight, '0.##')"/-->
												<xsl:value-of select="format-number($factW - $grossW, '0.##')"/>
												<xsl:text> кг</xsl:text>
											</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="mpco:Information/mpco:PackingState">
									<tr>
										<td colspan="3" style="border:0pt solid;">
											<span class="graph">
												<xsl:text>Сведения о целостности: </xsl:text>
												<xsl:choose>
													<xsl:when test="mpco:Information/mpco:PackingState/mpco:Value='0' or mpco:Information/mpco:PackingState/mpco:Value='false' or mpco:Information/mpco:PackingState/mpco:Value='f'">Нарушена</xsl:when>
													<xsl:when test="mpco:Information/mpco:PackingState/mpco:Value='1' or mpco:Information/mpco:PackingState/mpco:Value='true' or mpco:Information/mpco:PackingState/mpco:Value='t'">Целостна</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="mpco:Information/mpco:PackingState/mpco:Value"/>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:if test="mpco:Information/mpco:PackingState/mpco:Remark">
													<xsl:text>, </xsl:text>
													<xsl:value-of select="mpco:Information/mpco:PackingState/mpco:Remark"/>
												</xsl:if>
											</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="mpco:ConsignmentCategory">
									<tr>
										<td colspan="3" style="border:0pt solid;">
											<span class="graph">
												<xsl:text>Категория отправления: </xsl:text>
												<xsl:for-each select="mpco:ConsignmentCategory/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="mpco:MPOKind">
									<tr>
										<td colspan="3" style="border:0pt solid;">
											<span class="graph">
												<xsl:text>Вид отправления: </xsl:text>
												<xsl:for-each select="mpco:MPOKind/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="mpco:CustomsProcedure">
									<tr>
										<td colspan="3" style="border:0pt solid;">
											<span class="graph">
												<xsl:text>Направление перемещения: </xsl:text>
												<xsl:choose>
													<xsl:when test="mpco:CustomsProcedure='ИМ'">ввоз МПО</xsl:when>
													<xsl:when test="mpco:CustomsProcedure='ЭК'">вывоз МПО</xsl:when>
												</xsl:choose>
											</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="mpco:CustomsCode">
									<tr>
										<td colspan="3" style="border:0pt solid;">
											<span class="graph">
												<xsl:text>Предполагаемый код таможенного органа оформления: </xsl:text>
												<xsl:value-of select="mpco:CustomsCode"/>
											</span>
										</td>
									</tr>
								</xsl:if>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="3" style="padding:0pt 5pt">
							<span class="graph">Компания/Фирма<br/>
								<xsl:value-of select="mpco:Consignor/cat_ru:OrganizationName"/>
								<xsl:if test="mpco:Consignor/cat_ru:OrganizationName and mpco:ConsignorRUS/cat_ru:OrganizationName">
									<xsl:text> / </xsl:text>
								</xsl:if>
								<xsl:value-of select="mpco:ConsignorRUS/cat_ru:OrganizationName"/>
								<xsl:text> </xsl:text>
								<xsl:call-template name="innkppogrnWithForeign">
									<xsl:with-param name="base" select="mpco:Consignor"/>
								</xsl:call-template>
							</span>
						</td>
					</tr>
					<tr>
						<td rowspan="3"/>
						<td colspan="5" style="padding:0pt 5pt">
							<span class="graph">Улица<br/>
								<xsl:choose>
									<xsl:when test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:AddressText">
										<xsl:value-of select="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:AddressText"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:StreetHouse">
											<xsl:value-of select="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:StreetHouse"/>
											<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:House or mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:House">
											<xsl:value-of select="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:House"/>
											<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room">
											<xsl:value-of select="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room"/>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<table cellspacing="6">
								<tr>
									<td style="border:solid 0pt">
										<span class="graph">Почтовый индекс<br/>
											<xsl:choose>
												<xsl:when test="mpco:Consignor/mpco:ExPostalCode">
													<xsl:value-of select="mpco:Consignor/mpco:ExPostalCode"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:PostalCode"/>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</td>
									<td style="border:solid 0pt">
										<span class="graph">Город<br/>
											<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region">
												<xsl:value-of select="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region"/>
											</xsl:if>
											<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town">
												<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town"/>
											</xsl:if>
											<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:City">
												<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town or mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:City"/>
											</xsl:if>
											<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:District">
												<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town or mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region or mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:City">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:District"/>
											</xsl:if>
										</span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="5" style="padding:0pt 5pt">
							<span class="graph">Страна<br/>
								<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:CountryCode">
									<xsl:value-of select="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:CountryCode"/> 
								</xsl:if>
								<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:CounryName">
									<xsl:if test="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:CountryCode">
										<xsl:text> </xsl:text>
									</xsl:if>
									<xsl:value-of select="mpco:Consignor/RUScat_ru:SubjectAddressDetails/RUScat_ru:CounryName"/>
								</xsl:if>
							</span>
						</td>
					</tr>
					<tr>
						<td rowspan="17" style="padding:0pt 5pt">
							<span class="graph">В</span>
						</td>
						<td colspan="5" style="padding:0pt 5pt">
							<span class="graph">Фамилия<br/>
								<xsl:value-of select="mpco:Consignee/mpco:NominativeName"/>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="5" style="padding:0pt 5pt">
							<span class="graph">Компания/Фирма<br/>
								<!--	<xsl:if test="mpco:Consignee/cat_ru:ShortName">-->
								<xsl:value-of select="mpco:Consignee/cat_ru:OrganizationName"/>
								<!--</xsl:if>-->
								<xsl:text> </xsl:text>
								<xsl:call-template name="innkppogrn">
									<xsl:with-param name="base" select="mpco:Consignee"/>
								</xsl:call-template>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="5" style="padding:0pt 5pt">
							<span class="graph">Улица<br/>
								<xsl:choose>
									<xsl:when test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:AddressText">
										<xsl:value-of select="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:AddressText"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:StreetHouse">
											<xsl:value-of select="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:StreetHouse"/>
											<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:House or mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:House">
											<xsl:value-of select="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:House"/>
											<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room">
											<xsl:value-of select="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Room"/>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</td>
						<td colspan="4" rowspan="3">
							<table cellspacing="6">
								<tr>
									<td style="border:solid 0pt">
										<span class="graph">Реквизиты импортера (если имеются) (ИНН/№НДС/индекс импортера) (факультативно)<br/>
											<xsl:apply-templates select="mpco:Importer/cat_ru:RFOrganizationFeatures/cat_ru:INN | mpco:Importer/cat_ru:RFOrganizationFeatures/cat_ru:KPP | mpco:Importer/mpco:ImporterIndex | mpco:Importer/mpco:VAT_Number"/>
										</span>
									</td>
								</tr>
								<tr>
									<td style="border:solid 0pt">
										<span class="graph">№ телефона/факса/e-mail импортера (если известен)
							<br/>
											<xsl:apply-templates select="mpco:Importer/cat_ru:Contact/cat_ru:Phone | mpco:Importer/cat_ru:Contact/cat_ru:Fax | mpco:Importer/cat_ru:Contact/cat_ru:E_mail"/>
										</span>
									</td>
								</tr>
							</table>
						</td>
						<td rowspan="12" style="border-top:1px solid #ffffff;" width="20%"/>
					</tr>
					<tr>
						<td colspan="5">
							<table cellspacing="6">
								<tr>
									<td style="border:solid 0pt">
										<span class="graph">Почтовый индекс<br/>
											<xsl:choose>
												<xsl:when test="mpco:Consignee/mpco:ExPostalCode">
													<xsl:value-of select="mpco:Consignee/mpco:ExPostalCode"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:PostalCode"/>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</td>
									<td style="border:solid 0pt">
										<span class="graph">Город<br/>
											<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region">
												<xsl:value-of select="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region"/>
											</xsl:if>
											<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town">
												<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town"/>
											</xsl:if>
											<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:City">
												<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town or mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:City"/>
											</xsl:if>
											<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:District">
												<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Town or mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:Region or mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:City">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:District"/>
											</xsl:if>
										</span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="5" style="padding:0pt 5pt">
							<span class="graph">Страна<br/>
								<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:CountryCode">
									<xsl:value-of select="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:CountryCode"/> 
								</xsl:if>
								<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:CounryName">
									<xsl:if test="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:CountryCode">
										<xsl:text> </xsl:text>
									</xsl:if>
									<xsl:value-of select="mpco:Consignee/RUScat_ru:SubjectAddressDetails/RUScat_ru:CounryName"/>
								</xsl:if>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="2" rowspan="2" style="padding:0pt 5pt" width="20%">
							<span class="graph">Подробное описание вложения</span>
						</td>
						<td rowspan="2" style="padding:0pt 5pt" width="15%">
							<span class="graph">Количество</span>
						</td>
						<td colspan="3" rowspan="2" style="padding:0pt 5pt" width="10%">
							<span class="graph">Вес нетто (в кг)</span>
						</td>
						<td rowspan="2" style="padding:0pt 5pt" width="10%">
							<span class="graph">Стоимость</span>
						</td>
						<td colspan="2" style="padding:0pt 5pt">
							<span class="graph">Только для коммерческих отправлений</span>
						</td>
					</tr>
					<tr>
						<td style="padding:0pt 5pt" width="15%">
							<span class="graph">Код ТН ВЭД ЕАЭС</span>
						</td>
						<td style="padding:0pt 5pt" width="15%">
							<span class="graph">Страна происхождения товаров</span>
						</td>
					</tr>
					<xsl:for-each select="mpco:Goods">
						<tr>
							<td colspan="2">
								<table style="border: 0px;">
									<tr>
										<td style="padding:0pt 5pt;border: 0px;">
											<span class="graph">
												<xsl:for-each select="mpco:GoodDescription">
													<xsl:value-of select="."/>
												</xsl:for-each>
												<xsl:if test="mpco:GoodDescription">
													<xsl:text> / </xsl:text>
												</xsl:if>
												<xsl:for-each select="mpco:GoodDescriptionForeign">
													<xsl:value-of select="."/>
												</xsl:for-each>
												<xsl:if test="mpco:TradeMark or mpco:GoodsMark or mpco:GoodsModel">
													<xsl:text> (</xsl:text>
													<xsl:value-of select="mpco:TradeMark"/>
													<xsl:if test="mpco:TradeMark and (mpco:GoodsMark or mpco:GoodsModel)">
														<xsl:text>, </xsl:text>
													</xsl:if>
													<xsl:value-of select="mpco:GoodsMark"/>
													<xsl:if test="(mpco:TradeMark or mpco:GoodsMark) and mpco:GoodsModel">
														<xsl:text>, </xsl:text>
													</xsl:if>
													<xsl:value-of select="mpco:GoodsModel"/>
													<xsl:text>)</xsl:text>
												</xsl:if>
											</span>
										</td>
									</tr>
									<xsl:if test="mpco:URLGood">
										<tr>
											<td style="padding:0pt 5pt; border: 0px; word-break: break-all;">
												<span class="graph">
													<xsl:text>url: </xsl:text>
													<a href="{mpco:URLGood}">
														<xsl:value-of select="mpco:URLGood"/>
													</a>
												</span>
											</td>
										</tr>
									</xsl:if>
								</table>
							</td>
							<td style="padding:0pt 5pt">
								<span class="graph">
									<xsl:if test="mpco:GoodsQuantity/cat_ru:GoodsQuantity">
										<xsl:value-of select="mpco:GoodsQuantity/cat_ru:GoodsQuantity"/> </xsl:if>
									<xsl:if test="mpco:GoodsQuantity/cat_ru:MeasureUnitQualifierName">
										<xsl:value-of select="mpco:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
									</xsl:if>
								</span>
							</td>
							<td colspan="3" style="padding:0pt 5pt">
								<span class="graph">
									<xsl:value-of select="mpco:NetWeight"/>
								</span>
							</td>
							<td style="padding:0pt 5pt">
								<span class="graph">
									<xsl:value-of select="mpco:CostRUS"/>
									<xsl:text> руб.</xsl:text>
									<br/>
									<xsl:value-of select="mpco:CostEURO"/>
									<xsl:text> евро</xsl:text>
									<!--xsl:if test="mpco:CurrencyCode">(<xsl:value-of select="mpco:CurrencyCode"/>)</xsl:if-->
								</span>
							</td>
							<td style="padding:0pt 5pt">
								<span class="graph">
									<xsl:if test="mpco:TNVEDCode">
										<xsl:value-of select="mpco:TNVEDCode"/>
									</xsl:if>
								</span>
							</td>
							<td style="padding:0pt 5pt">
								<span class="graph">
									<xsl:if test="mpco:OriginCountryCode">
										<xsl:value-of select="mpco:OriginCountryCode"/>
									</xsl:if>
								</span>
							</td>
						</tr>
					</xsl:for-each>
					<tr>
						<td colspan="2"/>
						<td/>
						<td colspan="3" style="padding:0pt 5pt">
							<span class="graph">Общий вес брутто<br/>
								<xsl:value-of select="mpco:TotalGrossWeight"/>
							</span>
							<xsl:if test="mpco:MPOFactWeight">
								<br/>
								<span class="graph">Фактический вес<br/>
									<xsl:value-of select="mpco:MPOFactWeight"/>
								</span>
							</xsl:if>
						</td>
						<td style="padding:0pt 5pt">
							<span class="graph">Общая стоимость<br/>
								<xsl:value-of select="mpco:TotalCostRUS"/>
								<xsl:text> руб.</xsl:text>
								<br/>
								<xsl:value-of select="mpco:TotalCostEURO"/>
								<xsl:text> евро</xsl:text>
								<!--xsl:if test="mpco:CurrencyCode">(<xsl:value-of select="mpco:CurrencyCode"/>)</xsl:if-->
							</span>
						</td>
						<td colspan="2" style="padding:0pt 5pt">
							<span class="graph">Почтовые сборы/Расходы<br/>
								<xsl:if test="mpco:PostalFees">
									<xsl:for-each select="mpco:PostalFees">
										<xsl:value-of select="RUScat_ru:Amount"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="RUScat_ru:CurrencyCode"/>
										<br/>
									</xsl:for-each>
								</xsl:if>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="7">
							<table cellspacing="6">
								<tr>
									<td style="border:solid 0pt"/>
									<td style="border:solid 0pt">
										<span class="graph">Категория отправления</span>
									</td>
									<td align="center" style="border:solid 0.8pt; width:5mm">
										<span class="graph">
											<xsl:if test="mpco:ConsignmentCategory/mpco:CategoryCode=32">x</xsl:if>
											<xsl:if test="mpco:ConsignmentCategory">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:if>
										</span>
									</td>
									<td align="left" style="border:solid 0pt">
										<span class="graph">Коммерческий образец</span>
									</td>
									<td rowspan="3" style="border:solid 0pt">
										<span class="graph">Пояснение:
									<xsl:if test="mpco:Explication">
												<xsl:value-of select="mpco:Explication"/>
											</xsl:if>
										</span>
									</td>
								</tr>
								<tr>
									<td align="center" style="border:solid 0.8pt; width:5mm">
										<span class="graph">
											<xsl:if test="mpco:ConsignmentCategory/mpco:CategoryCode=31">x</xsl:if>
											<xsl:if test="mpco:ConsignmentCategory">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:if>
										</span>
									</td>
									<td align="left" style="border:solid 0pt">
										<span class="graph">Подарок</span>
									</td>
									<td align="center" style="border:solid 0.8pt; width:5mm">
										<span class="graph">
											<xsl:if test="mpco:ConsignmentCategory/mpco:CategoryCode=21">x</xsl:if>
											<xsl:if test="mpco:ConsignmentCategory">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:if>
										</span>
									</td>
									<td align="left" style="border:solid 0pt">
										<span class="graph">Возврат товара</span>
									</td>
								</tr>
								<tr>
									<td align="center" style="border:solid 0.8pt; width:5mm">
										<span class="graph">
											<xsl:if test="mpco:ConsignmentCategory/mpco:CategoryCode=91">x</xsl:if>
											<xsl:if test="mpco:ConsignmentCategory">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:if>
										</span>
									</td>
									<td align="left" style="border:solid 0pt">
										<span class="graph">Документ</span>
									</td>
									<td align="center" style="border:solid 0.8pt; width:5mm">
										<span class="graph">
											<xsl:if test="mpco:ConsignmentCategory/mpco:CategoryCode=999">x</xsl:if>
											<xsl:if test="mpco:ConsignmentCategory">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:if>
										</span>
									</td>
									<td align="left" style="border:solid 0pt">
										<span class="graph">Прочее</span>
									</td>
								</tr>
							</table>
						</td>
						<td colspan="2" rowspan="2" style="padding:0pt 5pt">
							<span class="graph">Учреждение подачи/Дата подачи
						<br/>
								<xsl:if test="mpco:FeedBillAgency">
									<xsl:value-of select="mpco:FeedBillAgency"/>/</xsl:if>
								<xsl:if test="mpco:FeedBillDate">
									<xsl:call-template name="date">
										<xsl:with-param name="dateIn" select="mpco:FeedBillDate"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="7" rowspan="2" style="padding:0pt 5pt">
							<span class="graph">
						Примечания: (напр., товар, подлежащий карантину/санитарному, фитосанитарному контролю или подпадающий под другие ограничения)<br/>
								<xsl:if test="mpco:Comment">
									<xsl:value-of select="mpco:Comment"/>
								</xsl:if>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="2" rowspan="2" style="padding:0pt 5pt">
							<span class="gra">Я подтверждаю, что указанные в настоящей таможенной декларации сведения являются достоверными, и что в этом отправлении не содержится никаких опасных предметов или запрещенных законодательством или почтовой или таможенной регламентацией предметов<br/>
							</span>
							<span class="graph">Дата и подпись отправителя<br/>
								<xsl:call-template name="date">
									<xsl:with-param name="dateIn" select="mpco:Consignor/mpco:IssueDate"/>
								</xsl:call-template> <xsl:value-of select="mpco:Consignor/cat_ru:OrganizationName"/>
							</span>
						</td>
					</tr>
					<tr>
						<td width="33%" style="word-break: break-all">
							<table cellspacing="5">
								<tr>
									<td align="center" style="border:solid 0.8pt; width:3mm">
										<span class="graph">
											<xsl:choose>
												<xsl:when test="mpco:DocumentInfo/mpco:PrecedingDocumentModeCode='LIC'">x</xsl:when>
												<xsl:otherwise> </xsl:otherwise>
											</xsl:choose>
										</span>
									</td>
									<td rowspan="2" style="border:solid 0pt">
										<span class="graph">Лицензия/№ лицензии(-ий)</span>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="border:solid 0pt">
										<xsl:for-each select="mpco:DocumentInfo">
											<span class="graph">
												<xsl:if test="mpco:PrecedingDocumentModeCode='LIC'">
													<xsl:if test="cat_ru:PrDocumentName">
														<xsl:value-of select="cat_ru:PrDocumentName"/>/
													</xsl:if>
													<xsl:if test="cat_ru:PrDocumentNumber">№
														<xsl:value-of select="cat_ru:PrDocumentNumber"/>/
													</xsl:if>
													<xsl:if test="cat_ru:PrDocumentDate">
														<xsl:call-template name="date">
															<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
												</xsl:if> 
											</span>
										</xsl:for-each>
									</td>
								</tr>
							</table>
						</td>
						<td colspan="3" style="word-break: break-all">
							<table cellspacing="5">
								<tr>
									<td align="center" style="border:solid 0.8pt; width:3mm">
										<span class="graph">
											<xsl:choose>
												<xsl:when test="mpco:DocumentInfo/mpco:PrecedingDocumentModeCode='CRT'">x</xsl:when>
												<xsl:otherwise> </xsl:otherwise>
											</xsl:choose>
										</span>
									</td>
									<td rowspan="2" style="border:solid 0pt">
										<span class="graph">Сертификат/№сертификата(-ов) 
									</span>
									</td>
								</tr>
								<tr>
									<td colspan="3" style="border:solid 0pt">
										<xsl:for-each select="mpco:DocumentInfo">
											<span class="graph">
												<xsl:if test="mpco:PrecedingDocumentModeCode='CRT'">
													<xsl:if test="cat_ru:PrDocumentName">
														<xsl:value-of select="cat_ru:PrDocumentName"/>/
													</xsl:if>
													<xsl:if test="cat_ru:PrDocumentNumber">№
														<xsl:value-of select="cat_ru:PrDocumentNumber"/>/
													</xsl:if>
													<xsl:if test="cat_ru:PrDocumentDate">
														<xsl:call-template name="date">
															<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
												</xsl:if> 
											</span>
										</xsl:for-each>
									</td>
								</tr>
							</table>
						</td>
						<td colspan="3" style="word-break: break-all">
							<table cellspacing="5">
								<tr>
									<td align="center" style="border:solid 0.8pt; width:3mm">
										<span class="graph">
											<xsl:choose>
												<xsl:when test="mpco:DocumentInfo/mpco:PrecedingDocumentModeCode='INV'">x</xsl:when>
												<xsl:otherwise> </xsl:otherwise>
											</xsl:choose>
										</span>
									</td>
									<td rowspan="2" style="border:solid 0pt">
										<span class="graph">Счет/№ счета           
									</span>
										<br/> </td>
								</tr>
								<tr>
									<td colspan="2" style="border:solid 0pt">
										<xsl:for-each select="mpco:DocumentInfo">
											<span class="graph">
												<xsl:if test="mpco:PrecedingDocumentModeCode='INV'">
													<xsl:if test="cat_ru:PrDocumentName">
														<xsl:value-of select="cat_ru:PrDocumentName"/>/
													</xsl:if>
													<xsl:if test="cat_ru:PrDocumentNumber">№
														<xsl:value-of select="cat_ru:PrDocumentNumber"/>/
													</xsl:if>
													<xsl:if test="cat_ru:PrDocumentDate">
														<xsl:call-template name="date">
															<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
												</xsl:if> 
											</span>
										</xsl:for-each>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="9" style="border-left:1px solid #ffffff;"> </td>
						<td style="border-left:1px solid #ffffff; border-top:1px solid #ffffff;"/>
					</tr>
					<!--</table>-->
				</span>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="innkppogrn">
		<xsl:param name="base"/>
		<xsl:if test="$base/cat_ru:RFOrganizationFeatures">
			<xsl:text> (</xsl:text>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template name="innkppogrnWithForeign">
		<xsl:param name="base"/>
		<xsl:if test="$base/cat_ru:RFOrganizationFeatures">
			<xsl:text> (</xsl:text>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN|$base/../mpf:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN|$base/../mpf:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP|$base/../mpf:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP|$base/../mpf:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN|$base/../mpf:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN|$base/../mpf:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="mpco:MPO_Registration">
		<xsl:value-of select="mpco:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="MPOdate">
			<xsl:with-param name="dateIn" select="mpco:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="mpco:MPO_Number"/>
	</xsl:template>
	<xsl:template name="MPOdate">
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
	<xsl:template name="date">
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
	<xsl:template match="mpco:Importer/cat_ru:RFOrganizationFeatures/cat_ru:INN | mpco:Importer/cat_ru:RFOrganizationFeatures/cat_ru:KPP | mpco:Importer/mpco:ImporterIndex | mpco:Importer/mpco:VAT_Number | mpco:Importer/cat_ru:Contact/cat_ru:Phone | mpco:Importer/cat_ru:Contact/cat_ru:Fax | mpco:Importer/cat_ru:Contact/cat_ru:E_mail">
		<xsl:apply-templates/>
		<xsl:if test="not(position()=last())">/ </xsl:if>
	</xsl:template>
</xsl:stylesheet>
