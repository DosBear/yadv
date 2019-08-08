<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.3" xmlns:nead="urn:customs.ru:Information:CustomsAuditDocuments:NotifEndAuditDoc:5.14.3">
<!-- Письмо ПУ от 05.10.2018 № 15-12/63248 "О направлении проекта приказа" (Приложение 1):
Проект приказа ФТС России "Об утверждении формы и порядка направления уведомления о завершении проверки таможенных, иных документов и (или) сведений"
-->
	<!-- Шаблон для типа NotifEndAuditDocType -->
	<xsl:template match="nead:NotifEndAuditDoc">
		<html>
			<head>
				<style>
			body {
			background: #cccccc;
			}

			div
			{
			white-space: nowrap;
			}

			div.page {
			width: 180mm;
			margin: 10px auto;
			margin-top: 6pt;
			margin-bottom: 6pt;
			padding: 10mm;
			padding-left: 20mm;
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
			}

			.marg-top
			{
			margin-top:5mm;
			}

			table
			{
			width: 100%;
            table-layout: fixed;			
			word-wrap: break-word;
			border: 0;
			empty-cells: show;
			border-collapse: collapse;
			margin-top: 1px;
			}

			table.border tr td
			{
			border: 1px solid windowtext;
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

			.border_bottom
			{
			border-bottom: 1px solid black;
			}

			.graphMain
			{
			font-family: Arial;
			font-size: 11pt;
			}

			.graphLittle 
			{
			font-family: Arial;
			font-size: 7pt;
			}
	
			.graphDelim 
			{
			font-family: Arial;
			font-size: 4pt;
			}

			td.graphMain
			{
			vertical-align:top;
			}
			td.value.graphMain
			{
			vertical-align:top;
			}

			.graphHeader
			{
			font-family: Arial;
			font-size: 11pt;
			font-weight:bold;
			}

			td.graphHeader
			{
			vertical-align:top;
			}
			td.value.graphHeader
			{
			vertical-align:bottom;
			}

			.normal
			{
			font-size: 11pt;
			font-family:Arial;
			}			

			.bold
			{
			font-weight: bold;
			font-family:Arial;
			font-size: 9pt;
			}			

			.italic
			{
			font-style: italic;
			font-family:Arial;
			font-size: 11pt;
			}		
			
			.delim {
				height: 7pt;
			}

			.delim_3 {
				height: 3pt;
			}

		</style>
			</head>
			<body>
				<div class="page">
					<!--table>
						<tbody align="center" class="graphMain">
							<tr>
								<td width="10%"/>
								<td width="80%">МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ<br/>(МИНФИН РОССИИ)</td>
								<td width="10%"/>
							</tr>
							<tr class="delim">
								<td colspan="3"> </td>
							</tr>
							<tr>
								<td width="10%"/>
								<td width="80%">ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</td>
								<td width="10%"/>
							</tr>
							<tr class="delim_3">
								<td colspan="3"> </td>
							</tr>
							<tr>
								<td width="10%"/>
								<td width="80%" class="border_bottom">
									<span class="normal">
										<xsl:value-of select="nead:Customs/cat_ru:OfficeName"/>
									</span>
									<xsl:if test="nead:Customs/cat_ru:OfficeName">
										<span class="normal"> (</span>
									</xsl:if>
									<span class="normal">
										<xsl:value-of select="nead:Customs/cat_ru:Code"/>
									</span>
									<xsl:if test="nead:Customs/cat_ru:OfficeName">
										<span class="normal">)</span>
									</xsl:if>
								</td>
								<td width="10%"/>
							</tr>
							<tr class="graphLittle">
								<td width="10%"/>
								<td width="80%" align="center">(наименование таможенного органа)</td>
								<td width="10%"/>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td width="50%"/>
								<td width="50%">Руководителю</td>
							</tr>
							<tr class="delim_3">
								<td colspan="2"> </td>
							</tr>
							<tr>
								<td width="50%"> </td>
								<td width="50%" class="border_bottom">
									<xsl:apply-templates select="nead:AuditOrganization"/>
									<br/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td width="50%"/>
								<td width="50%" align="center">(наименование проверяемого лица, адрес)</td>
							</tr>
							<tr>
								<td width="50%"/>
								<td width="50%" class="border_bottom">
									<xsl:apply-templates mode="person" select="nead:AuditOrganization/nead:Person"/>
									<br/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td width="50%"/>
								<td width="50%" align="center">(фамилия, имя, отчество (отчество указывается при наличии)</td>
							</tr>
						</tbody>
					</table>
					<br/-->
					<table>
						<tbody align="left" class="graphMain">
							<tr align="center" class="graphHeader">
								<td>УВЕДОМЛЕНИЕ</td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr align="center">
								<td>о завершении проверки таможенных,<br/>иных документов и (или) сведений</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="center" class="graphMain">
							<tr>
								<td width="45%" align="left">
									<xsl:call-template name="DateStr">
										<xsl:with-param name="date" select="nead:NotifDate"/>
									</xsl:call-template>
								</td>
								<td width="15%"> </td>
								<td width="40%" class="border_bottom">
									<xsl:value-of select="nead:NotifPlace"/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="left">
									<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text>
									<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text>
									<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text>
									<xsl:text>(дата)</xsl:text>
								</td>
								<td> </td>
								<td>(место составления)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim">
								<td> </td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>&#160;&#160;&#160;&#160;&#160;В соответствии с частью 8 статьи 226 Федерального закона от 3 августа 2018&#160;г. № 289-ФЗ </xsl:text>
									<xsl:text>"О таможенном регулировании в Российской Федерации и </xsl:text>
									<xsl:text>о внесении изменений в отдельные законодательные акты Российской Федерации" уведомляю о том, что проводимая</xsl:text>
								</td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td class="border_bottom">
									<span class="normal">
										<xsl:value-of select="nead:Customs/cat_ru:OfficeName"/>
									</span>
									<xsl:if test="nead:Customs/cat_ru:OfficeName">
										<span class="normal"> (</span>
									</xsl:if>
									<span class="normal">
										<xsl:value-of select="nead:Customs/cat_ru:Code"/>
									</span>
									<xsl:if test="nead:Customs/cat_ru:OfficeName">
										<span class="normal">)</span>
									</xsl:if>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">(наименование таможенного органа)</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>на основании статей 326, 340 Таможенного кодекса Евразийского экономического союза и </xsl:text>
									<xsl:text>статей 225, 239 Федерального закона от 3 августа 2018&#160;г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и </xsl:text>
									<xsl:text>о внесении изменений в отдельные законодательные акты Российской Федерации" </xsl:text>
									<xsl:text>проверка таможенных, иных документов и (или) сведений в целях</xsl:text>
								</td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td class="border_bottom">
									<span class="normal">
										<xsl:apply-templates select="nead:ObjectiveAudit"/>
									</span>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">(указывается цель проверки в соответствии с пунктом 2 статьи 324 Таможенного кодекса Евразийского экономического союза либо иная конкретная цель)</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>в отношении:</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim_3">
								<td width="99%"> </td>
								<td width="1%"> </td>
							</tr>
							<tr>
								<td width="99%" class="border_bottom">
									<xsl:for-each select="nead:DocInfo">
										<span class="normal">
											<xsl:value-of select="cat_ru:PrDocumentName"/> № <xsl:value-of select="cat_ru:PrDocumentNumber"/> от 
										</span>
										<span class="normal">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</span>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
								<td width="1%" class="border_bottom" valign="bottom">,</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">(перечень проверенных таможенных, иных документов и (или) сведений с указанием их реквизитов)</td>
								<td/>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>представленных лицом:</xsl:text>
								</td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr>
								<td class="border_bottom">
									<xsl:apply-templates select="nead:AuditOrganization"/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">
									<xsl:text>(сведения о лице, чьи документы и (или) сведения проверялись: наименование, ОГРН (при наличии), ИНН (при наличии), КПП (при наличии), </xsl:text>
									<xsl:text>место нахождения, адрес юридического лица / фамилия, имя, отчество (при наличии) индивидуального предпринимателя, ОГРНИП (при наличии), </xsl:text>
									<xsl:text>место жительства индивидуального предпринимателя / фамилия. имя, отчество (при наличии), ИНН (при наличии), место жительства </xsl:text>
									<xsl:text>физического лица, не являющегося индивидуальным предпринимателем)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>завершена </xsl:text>
									<xsl:call-template name="DateStr">
										<xsl:with-param name="date" select="nead:EndAuditDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>&#160;&#160;&#160;&#160;&#160;По результатам проведения проверки таможенных, иных документов и (или) сведений </xsl:text>
									<xsl:text>нарушения регулирующих таможенные правоотношения международных договоров и актов, составляющих право Евразийского </xsl:text>
									<xsl:text>экономического союза, и законодательства Российской Федерации о таможенном регулировании не выявлены.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>

					<table>
						<tr class="graphMain" align="center">
							<td width="50%" valign="bottom" class="border_bottom">
								Начальник (заместитель начальника)<br/>таможенного органа 
							</td>
							<td width="1%"> </td>
							<td valign="bottom" width="15%" class="border_bottom"> </td>
							<td width="1%"> </td>
							<td valign="bottom" width="33%" class="border_bottom">
								<xsl:value-of select="nead:ChiefCustoms/cat_ru:PersonSurname"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="nead:ChiefCustoms/cat_ru:PersonName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="nead:ChiefCustoms/cat_ru:PersonMiddleName"/>
								<br/>
							</td>
						</tr>
						<tr class="graphLittle" align="center">
							<td valign="top"></td>
							<td> </td>
							<td valign="top">(подпись)</td>
							<td> </td>
							<td valign="top">(инициалы , фамилия)</td>
						</tr>
					</table>
					<br/>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td>
									*Настоящее уведомление получил:
								</td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
						</tbody>
					</table>
					<table>
						<tr class="graphMain" align="center">
							<td width="63%" valign="bottom" class="border_bottom">
								<xsl:value-of select="nead:SecondExempReceived/cat_ru:PersonSurname"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="nead:SecondExempReceived/cat_ru:PersonName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="nead:SecondExempReceived/cat_ru:PersonMiddleName"/>
							</td>
							<td width="2%"> </td>
							<td width="35%">
								<xsl:call-template name="DateStr">
									<xsl:with-param name="date" select="nead:SecondExempReceived/adt_cat:Date"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr class="graphLittle" align="center">
							<td valign="top" width="63%">(фамилия, инициалы, подпись лица, получившего уведомление)</td>
							<td width="2%"> </td>
							<td width="35%"> </td>
						</tr>
					</table>
					<table>
						<tbody class="graphMain">
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>*Заполняется при вручении уведомления о завершении проверки таможенных, иных документов и (или) сведений лицу, </xsl:text>
									<xsl:text>чьи документы и (или) сведения проверялись. </xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<span class="italic"> (вид адреса</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:choose>
					<xsl:when test="RUScat_ru:AddressKindCode='1'">адрес регистрации</xsl:when>
					<xsl:when test="RUScat_ru:AddressKindCode='2'">фактический</xsl:when>
					<xsl:when test="RUScat_ru:AddressKindCode='3'">почтовый</xsl:when>
					<xsl:otherwise><xsl:value-of select="RUScat_ru:AddressKindCode"/></xsl:otherwise>
				</xsl:choose>
			</span>
			<span class="normal">) </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostalCode">
			<span class="italic">почтовый индекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:PostalCode"/>
			</span>
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
			<xsl:if test="RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CounryName">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</span>
			<xsl:if test="RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Region"/>
			</span>
			<xsl:if test="RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:District"/>
			</span>
			<xsl:if test="RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Town"/>
			</span>
			<xsl:if test="RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:City"/>
			</span>
			<xsl:if test="RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:StreetHouse"/>
			</span>
			<xsl:if test="RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:House"/>
			</span>
			<xsl:if test="RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Room"/>
			</span>
			<xsl:if test="RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</span>
			<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO">
			<span class="italic">ОКТМО </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OKTMO"/>
			</span>
			<xsl:if test="RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKATO">
			<span class="italic">OKАTO </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OKATO"/>
			</span>
			<xsl:if test="RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:KLADR">
			<span class="italic">КЛАДР </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:KLADR"/>
			</span>
			<xsl:if test="RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AOGUID">
			<span class="italic">Глобальный идентификатор адресного объекта по ФИАС </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AOGUID"/>
			</span>
			<xsl:if test="RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:TerritoryCode">
			<span class="italic">Код единицы административно-территориального деления </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:TerritoryCode"/>
			</span>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<span class="italic">а/я </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
			</span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:SubjectDetailsType -->
	<xsl:template match="nead:AuditOrganization">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">,&#160;<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:if test="position()=1">; 
				<span class="normal">
						<br/>
					</span>
					<span class="italic">Адрес(а)</span>
					<span class="normal">: </span>
				</xsl:if>
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
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
	<xsl:template match="*" name="PersonPost" mode="PersonPost">
		<xsl:value-of select="cat_ru:PersonPost"/>&#160;<xsl:value-of select="nead:Rank"/>&#160;<xsl:value-of select="nead:Department"/>&#160;<span class="normal">
			<xsl:value-of select="nead:CustomsDept/cat_ru:OfficeName"/>
		</span>
		<xsl:if test="nead:CustomsDept/cat_ru:Code">
			<span class="normal">&#160;(</span>
		</xsl:if>
		<span class="normal">
			<xsl:value-of select="nead:CustomsDept/cat_ru:Code"/>
		</span>
		<xsl:if test="nead:CustomsDept/cat_ru:Code">
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" name="PersonName" mode="PersonName">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;<xsl:value-of select="cat_ru:PersonName"/>&#160;<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="nead:PersonCustomsID">,&#160;номер служебного удостоверения:&#160;<xsl:value-of select="nead:PersonCustomsID"/></xsl:if>
		<xsl:if test="nead:LNP">,&#160;ЛНП:&#160;<xsl:value-of select="nead:LNP"/></xsl:if>
		<xsl:if test="nead:Phone">,&#160;Тел:&#160;<xsl:value-of select="nead:Phone"/></xsl:if>
		<xsl:if test="nead:Note">,&#160;<xsl:value-of select="nead:Note"/>
		</xsl:if>
		<xsl:if test="nead:Comment">,&#160;<xsl:value-of select="nead:Comment"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">, </span>
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
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">, </span>
			<span class="italic">ОГРН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeatures -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">, </span>
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">, </span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">, </span>
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeatures -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">, </span>
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">, </span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeatures -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">, </span>
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">, </span>
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">, </span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeatures -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="italic">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic"> по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType строка -->
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<span class="italic">Тел</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="italic">Факс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Fax"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="italic">Телекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Telex"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="italic">Email</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard | adt_cat:Passport">
		<xsl:if test="RUScat_ru:IdentityCardCode">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardCode"/>
			</span>
			<span class="normal">&#160;</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<xsl:if test="string-length(RUScat_ru:IdentityCardName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
			</span>
			<xsl:if test="string-length(RUScat_ru:IdentityCardName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries">
			<span class="italic">серия</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
			</span>
			<xsl:if test="string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
				<span class="normal">&#160;</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			<span class="italic">№</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</span>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardDate) &gt; 0 or string-length(RUScat_ru:OrganizationName) &gt; 0">
			<!--xsl:if test="string-length(RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if-->
			<span class="normal">, </span>
			<span class="italic">выдан</span>
			<span class="normal">: </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<span class="normal">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationName">
			<span class="normal">&#160;</span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OrganizationName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IssuerCode">
			<span class="normal">, </span>
			<span class="italic">код подразделения</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IssuerCode"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<span class="normal">, </span>
			<span class="italic">идентификатор организации</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AuthorityId"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">, </span>
			<span class="italic">страна в уд.личности</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="adt_cat:DTNumber">
		<span class="normal">
			<xsl:value-of select="cat_ru:CustomsCode"/>
		</span>
		<span class="normal">/</span>
		<span class="normal">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
			</xsl:call-template>
		</span>
		<span class="normal">/</span>
		<span class="normal">
			<xsl:value-of select="cat_ru:GTDNumber"/>
		</span>
	</xsl:template>
	<xsl:template name="CommunicationDetails">
		<span class="normal">, </span>
		<span class="italic">Контактные данные</span>
		<span class="normal">: </span>
		<xsl:variable name="temp">
			<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
		</xsl:variable>
		<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
	</xsl:template>
	<xsl:template name="gtd_date">
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
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<span class="normal">
					<xsl:value-of select="substring($dateIn,9,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,6,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,1,4)"/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Date">
		<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="border_bottom">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="border_bottom">
						<xsl:variable name="month" select="substring($date, 6, 2)"/>
						<xsl:choose>
							<xsl:when test="$month=1">января</xsl:when>
							<xsl:when test="$month=2">февраля</xsl:when>
							<xsl:when test="$month=3">марта</xsl:when>
							<xsl:when test="$month=4">апреля</xsl:when>
							<xsl:when test="$month=5">мая</xsl:when>
							<xsl:when test="$month=6">июня</xsl:when>
							<xsl:when test="$month=7">июля</xsl:when>
							<xsl:when test="$month=8">августа</xsl:when>
							<xsl:when test="$month=9">сентября</xsl:when>
							<xsl:when test="$month=10">октября</xsl:when>
							<xsl:when test="$month=11">ноября</xsl:when>
							<xsl:when test="$month=12">декабря</xsl:when>
						</xsl:choose> 					
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">
						<xsl:value-of select="substring($date,1,2)"/>
					</td>
					<td width="9%" class="border_bottom" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>
		&#34;&#160;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#160;&#34;
		&#160;&#160;<u>&#160;
		<xsl:choose>
				<xsl:when test="$month=1">января</xsl:when>
				<xsl:when test="$month=2">февраля</xsl:when>
				<xsl:when test="$month=3">марта</xsl:when>
				<xsl:when test="$month=4">апреля</xsl:when>
				<xsl:when test="$month=5">мая</xsl:when>
				<xsl:when test="$month=6">июня</xsl:when>
				<xsl:when test="$month=7">июля</xsl:when>
				<xsl:when test="$month=8">августа</xsl:when>
				<xsl:when test="$month=9">сентября</xsl:when>
				<xsl:when test="$month=10">октября</xsl:when>
				<xsl:when test="$month=11">ноября</xsl:when>
				<xsl:when test="$month=12">декабря</xsl:when>
			</xsl:choose> 					
		&#160;</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/>
		<u>
			<xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
	</xsl:template>
</xsl:stylesheet>
