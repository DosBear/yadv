<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:npaf="urn:customs.ru:Information:CustomsAuditDocuments:NotifPerformAudit:5.14.0">
	<!-- Уведомление о ВТП.doc,  Уведомление о КТП.doc - - структура
Приложение 20 к приказу_Уведомл о КТП+пор+доработка 1.docx (IdentKindDoc = 1, IdentKindAudit = 2)
Приложение 21 к приказу_Уведомл о планов_выезд+пор+доработка 1.docx - банки и порядок заполнения (IdentKindDoc = 1, IdentKindAudit = 1) 
Приложение 22 к приказу_Реш_продл_срока КТП+пор+доработка 1.docx (IdentKindDoc = 2, IdentKindAudit = 2)
-->
	<!--Приложение (ГУТКПВТ 53522 Формы документов по ФЗ-289 (приложение).docx, формы 9 (IdentKindDoc = 1, IdentKindAudit = 2), 10 (IdentKindDoc = 1, IdentKindAudit = 1), 11 (IdentKindDoc = 2, IdentKindAudit = 2)  к Письму ГУТКПВТ от 24.09.2018 № 23-20/53522-->
	<!-- Шаблон для типа NotifPerformAuditType -->
	<xsl:template match="npaf:NotifPerformAudit">
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
									<xsl:choose>
										<xsl:when test="npaf:AuditOrganization/cat_ru:OrganizationName">
											<xsl:value-of select="npaf:AuditOrganization/cat_ru:OrganizationName"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="npaf:AuditOrganization/cat_ru:ShortName"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr class="graphLittle">
								<td width="50%"/>
								<td width="50%" align="center">(наименование проверяемого лица)</td>
							</tr>
							<tr>
								<td width="50%"/>
								<td width="50%" class="border_bottom">
									<xsl:value-of select="npaf:AuditOrganization/npaf:Person/cat_ru:PersonSurname"/>
									<xsl:if test="npaf:AuditOrganization/npaf:Person/cat_ru:PersonName">
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="npaf:AuditOrganization/npaf:Person/cat_ru:PersonName"/>
									</xsl:if>
									<xsl:if test="npaf:AuditOrganization/npaf:Person/cat_ru:PersonMiddleName">
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="npaf:AuditOrganization/npaf:Person/cat_ru:PersonMiddleName"/>
									</xsl:if>
									<br/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td width="50%"/>
								<td width="50%" align="center">(фамилия, имя, отчество (отчество указывается при наличии)</td>
							</tr>
							<tr>
								<td width="50%"/>
								<td width="50%" class="border_bottom">
									<xsl:if test="npaf:AuditOrganization/RUScat_ru:SubjectAddressDetails">
										<xsl:for-each select="npaf:AuditOrganization/RUScat_ru:SubjectAddressDetails">
											<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<br/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td width="50%"/>
								<td width="50%" align="center">(адрес)</td>
							</tr>
							<tr>
								<td width="50%"/>
								<td width="50%" class="border_bottom">
									<xsl:if test="npaf:AuditOrganization/npaf:FactAddressDetails">
										<xsl:for-each select="npaf:AuditOrganization/npaf:FactAddressDetails">
											<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
										</xsl:for-each>
									</xsl:if>
									<br/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td width="50%"/>
								<td width="50%" align="center">(адрес)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr align="center" class="graphHeader">
								<td>УВЕДОМЛЕНИЕ</td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr align="center">
								<td>
									<xsl:choose>
										<xsl:when test="npaf:IdentKindDoc = '1' and npaf:IdentKindAudit = 2">о проведении камеральной таможенной проверки</xsl:when>
										<xsl:when test="npaf:IdentKindDoc = '1' and npaf:IdentKindAudit = 1">о проведении плановой выездной таможенной проверки</xsl:when>
										<xsl:when test="npaf:IdentKindDoc = '2' and npaf:IdentKindAudit = 2">о продлении срока проведения камеральной таможенной проверки</xsl:when>
										<xsl:otherwise>о <u>&#160;&#160;&#160;&#160;&#160;</u> таможенной проверки</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr style="text-align: justify">
								<td>
							&#160;&#160;&#160;&#160;&#160;Уведомляю, что на основании статьи 
							<xsl:if test="npaf:IdentKindDoc = '1'">
										<xsl:choose>
											<xsl:when test="npaf:IdentKindAudit = 2">332 </xsl:when>
											<xsl:when test="npaf:IdentKindAudit = 1">333 </xsl:when>
											<xsl:otherwise>
												<u>&#160;&#160;&#160;&#160;&#160;</u>
											</xsl:otherwise>
										</xsl:choose>
								 Таможенного кодекса Евразийского экономического союза и статьи 
							</xsl:if>
									<xsl:choose>
										<xsl:when test="npaf:IdentKindAudit = 2">228 </xsl:when>
										<xsl:when test="npaf:IdentKindAudit = 1">229 </xsl:when>
										<xsl:otherwise>
											<u>&#160;&#160;&#160;&#160;&#160;</u>
										</xsl:otherwise>
									</xsl:choose>Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации» 
							<xsl:choose>
										<xsl:when test="npaf:IdentKindDoc = '1' and npaf:IdentKindAudit = 2"> проводится камеральная таможенная проверка </xsl:when>
										<xsl:when test="npaf:IdentKindDoc = '1' and npaf:IdentKindAudit = 1"> запланирована плановая выездная таможенная проверка </xsl:when>
										<xsl:when test="npaf:IdentKindDoc = '2' and npaf:IdentKindAudit = 2"> камеральная таможенная проверка</xsl:when>
										<xsl:otherwise>
											<u>&#160;&#160;&#160;&#160;&#160;</u>
										</xsl:otherwise>
									</xsl:choose>
							в отношении
						</td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td class="border_bottom">
									<xsl:apply-templates select="npaf:AuditOrganization"/>
									<br/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">(указываются сведения о проверяемом лице)</td>
							</tr>
							<xsl:choose>
								<xsl:when test="npaf:IdentKindAudit = 2 and npaf:IdentKindDoc = 1">
									<tr>
										<td>
									по таможенным декларациям на товары / за период
								</td>
									</tr>
									<tr>
										<td class="border_bottom">
											<xsl:for-each select="npaf:AuditGoods">
												<xsl:if test="adt_cat:DTNumber">
													<span class="italic">№ ДТ</span>
													<span class="normal">: </span>
													<span class="normal">
														<xsl:apply-templates select="adt_cat:DTNumber"/>
													</span>
												</xsl:if>
												<xsl:if test="adt_cat:GoodsNumeric">
													<span class="italic"> № товара</span>
													<span class="normal">: </span>
													<span class="normal">
														<xsl:value-of select="adt_cat:GoodsNumeric"/>
													</span>
												</xsl:if>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
											<xsl:if test="npaf:AuditGoods and npaf:AuditPeriod">
												<br/>
											</xsl:if>
											<xsl:for-each select="npaf:AuditPeriod">
												<span class="italic">с </span>
												<xsl:choose>
													<xsl:when test="adt_cat:BeginAuditPeriodDate">
														<span class="normal">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="adt_cat:BeginAuditPeriodDate"/>
															</xsl:call-template>
														</span>
													</xsl:when>
													<xsl:otherwise>(не указано)</xsl:otherwise>
												</xsl:choose>
												<span class="italic"> по </span>
												<xsl:choose>
													<xsl:when test="adt_cat:EndAuditPeriodDate">
														<span class="normal">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="adt_cat:EndAuditPeriodDate"/>
															</xsl:call-template>
														</span>
													</xsl:when>
													<xsl:otherwise>(не указано)</xsl:otherwise>
												</xsl:choose>
												<xsl:if test="position()!=last()">; </xsl:if>
											</xsl:for-each>
											<br/>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="npaf:IdentKindAudit = 1 ">
									<tr class="delim">
										<td> </td>
									</tr>
									<tr>
										<td>
									предмет выездной таможенной проверки
								</td>
									</tr>
									<tr>
										<td class="border_bottom">
											<span class="normal">
												<xsl:apply-templates select="npaf:AuditSubject"/>
											</span>
											<br/>
										</td>
									</tr>
									<tr class="graphLittle">
										<td align="center">(указывается в соответствии с пунктом 6 статьи 331 Таможенного кодекса Евразийского экономического союза)</td>
									</tr>
									<tr class="delim">
										<td> </td>
									</tr>
									<tr>
										<td>
											<table>
												<tr>
													<td width="35%">проверяемый период</td>
													<td width="65%" align="center" valign="bottom" class="border_bottom">
														<xsl:for-each select="npaf:AuditPeriod">
															<span class="italic">с </span>
															<xsl:choose>
																<xsl:when test="adt_cat:BeginAuditPeriodDate">
																	<span class="normal">
																		<xsl:call-template name="russian_date">
																			<xsl:with-param name="dateIn" select="adt_cat:BeginAuditPeriodDate"/>
																		</xsl:call-template>
																	</span>
																</xsl:when>
																<xsl:otherwise>(не указано)</xsl:otherwise>
															</xsl:choose>
															<span class="italic"> по </span>
															<xsl:choose>
																<xsl:when test="adt_cat:EndAuditPeriodDate">
																	<span class="normal">
																		<xsl:call-template name="russian_date">
																			<xsl:with-param name="dateIn" select="adt_cat:EndAuditPeriodDate"/>
																		</xsl:call-template>
																	</span>
																</xsl:when>
																<xsl:otherwise>(не указано)</xsl:otherwise>
															</xsl:choose>
															<xsl:if test="position()!=last()">; </xsl:if>
														</xsl:for-each>
													</td>
												</tr>
												<tr class="graphLittle" align="center">
													<td width="35%"/>
													<td width="65%">(период, за который назначена выездная таможенная проверка)</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
									номера таможенных деклараций
								</td>
									</tr>
									<tr>
										<td class="border_bottom">
											<xsl:for-each select="npaf:AuditGoods">
												<xsl:if test="adt_cat:DTNumber">
													<span class="italic">№ ДТ</span>
													<span class="normal">: </span>
													<span class="normal">
														<xsl:apply-templates select="adt_cat:DTNumber"/>
													</span>
												</xsl:if>
												<xsl:if test="adt_cat:GoodsNumeric">
													<span class="italic"> № товара</span>
													<span class="normal">: </span>
													<span class="normal">
														<xsl:value-of select="adt_cat:GoodsNumeric"/>
													</span>
												</xsl:if>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr class="graphLittle">
										<td align="center"/>
									</tr>
									<tr class="delim">
										<td> </td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="npaf:IdentKindDoc = 2 and npaf:IdentKindAudit = 2">
									<tr class="delim">
										<td> </td>
									</tr>
									<tr style="text-align: justify">
										<td>о проведении которой было направлено уведомление о проведении камеральной таможенной проверки от <u>&#160;&#160;<xsl:call-template name="russian_date">
													<xsl:with-param select="npaf:Notif4Audit/adt_cat:Date" name="dateIn"/>
												</xsl:call-template>&#160;&#160;</u> &#160;№&#160;<u>&#160;&#160;<xsl:value-of select="npaf:Notif4Audit/adt_cat:Number"/>&#160;&#160;</u>, продлевается в соответствии 
с частями 7 – 9 статьи 228 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации».</td>
									</tr>
									<tr>
										<td>
											<br/>Причины продления</td>
									</tr>
									<tr>
										<td class="border_bottom">
											<xsl:value-of select="npaf:Reason"/>
											<br/>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr style="text-align: justify">
										<td>
											<br/>
									&#160;&#160;&#160;&#160;&#160;Информирую, что права и обязанности проверяемого лица при проведении таможенной 
									проверки установлены статьей 336 Таможенного кодекса Евразийского экономического союза и статьями 235, 236
									Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации». Права и обязанности должностных лиц таможенного органа при проведении таможенной проверки установлены статьей 335 Таможенного кодекса Евразийского экономического союза и статьей 231 Федерального закона от 3 августа 2018 г.
№ 289-ФЗ.
</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr class="graphMain" align="center">
								<td width="38%" align="left">Начальник (заместитель начальника) таможенного органа</td>
								<td width="20%" class="border_bottom"> </td>
								<td width="2%"> </td>
								<td width="40%" valign="bottom" class="border_bottom">
									<xsl:apply-templates select="npaf:PersonSignature" mode="PersonPost"/>&#160;<br>
										<xsl:apply-templates select="npaf:PersonSignature" mode="PersonName"/>
									</br>
								</td>
							</tr>
							<tr class="graphLittle" align="center">
								<td width="38%"> </td>
								<td valign="top" width="20%">(подпись)</td>
								<td width="2%"> </td>
								<td valign="top" width="40%">(фамилия, инициалы имени и отчества (инициалы отчества указываются при наличии отчества)</td>
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
			<span class="italic"> (код вида адреса</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AddressKindCode"/>
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
	<xsl:template match="npaf:AuditOrganization">
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
		<xsl:if test="npaf:OKPO">
			<span class="normal">, </span>
			<span class="italic">ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="npaf:OKPO"/>
		</xsl:if>
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
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="npaf:FactAddressDetails">
			<span class="normal">
				<br/>
			</span>
			<span class="italic">Фактический адрес</span>
			<span class="normal">: </span>
			<xsl:for-each select="npaf:FactAddressDetails">
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="npaf:RegionCustoms">
			<span class="normal">,&#160;</span>
			<span class="italic">Региональное таможенное управление:&#160;</span>
			<xsl:if test="npaf:RegionCustoms/adt_cat:FullOfficeName">
				<xsl:value-of select="npaf:RegionCustoms/adt_cat:FullOfficeName"/>
			</xsl:if>
			<xsl:if test="npaf:RegionCustoms/cat_ru:OfficeName">
				<xsl:if test="string-length(npaf:RegionCustoms/adt_cat:FullOfficeName) &gt; 0">
					<span class="normal"> (</span>
				</xsl:if>
				<xsl:value-of select="npaf:RegionCustoms/cat_ru:OfficeName"/>
				<xsl:if test="string-length(npaf:RegionCustoms/adt_cat:FullOfficeName) &gt; 0">
					<span class="normal">)</span>
				</xsl:if>
			</xsl:if>
			<xsl:if test="npaf:RegionCustoms/cat_ru:Code">&#160; (<xsl:value-of select="npaf:RegionCustoms/cat_ru:Code"/>)&#160;</xsl:if>
		</xsl:if>
		<xsl:if test="npaf:Person">,&#160;<xsl:apply-templates mode="person"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" name="PersonName" mode="PersonName">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;<xsl:value-of select="cat_ru:PersonName"/>&#160;<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="npaf:PersonCustomsID">&#160;номер служебного удостоверения:&#160;<xsl:value-of select="npaf:PersonCustomsID"/>,</xsl:if>
		<xsl:if test="npaf:LNP">&#160;ЛНП:&#160;<xsl:value-of select="npaf:LNP"/>,</xsl:if>
		<xsl:if test="npaf:Phone">&#160;Тел:&#160;<xsl:value-of select="npaf:Phone"/>,</xsl:if>
		<xsl:if test="npaf:Note">&#160;<xsl:value-of select="npaf:Note"/>
		</xsl:if>
		<xsl:if test="npaf:Comment">&#160;<xsl:value-of select="npaf:Comment"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" name="PersonPost" mode="PersonPost">
		<xsl:value-of select="cat_ru:PersonPost"/>&#160;<xsl:value-of select="npaf:Rank"/>&#160;<xsl:value-of select="npaf:Department"/>&#160;<span class="normal">
			<xsl:value-of select="npaf:CustomsDept/cat_ru:OfficeName"/>
		</span>
		<xsl:if test="npaf:CustomsDept/cat_ru:Code">
			<span class="normal">&#160;(</span>
		</xsl:if>
		<span class="normal">
			<xsl:value-of select="npaf:CustomsDept/cat_ru:Code"/>
		</span>
		<xsl:if test="npaf:CustomsDept/cat_ru:Code">
			<span class="normal">)</span>
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
		<xsl:if test="npaf:Comment">,&#160;<xsl:value-of select="npaf:Comment"/>
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
	<xsl:template match="RUScat_ru:IdentityCard">
		<span class="normal">, </span>
		<span class="italic">Документ, удостоверяющий личность ФЛ</span>
		<span class="normal">: </span>
		<xsl:if test="cat_ru:IdentityCardCode">
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardCode"/>
			</span>
			<span class="normal">&#160;</span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
			</span>
			<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<span class="italic">серия</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			</span>
			<xsl:if test="string-length(cat_ru:IdentityCardNumber) &gt; 0">
				<span class="normal">&#160;</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<span class="italic">№</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			</span>
		</xsl:if>
		<xsl:if test="string-length(cat_ru:IdentityCardDate) &gt; 0 or string-length(cat_ru:OrganizationName) &gt; 0">
			<!--xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if-->
			<span class="normal">, </span>
			<span class="italic">выдан</span>
			<span class="normal">: </span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<span class="normal">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<span class="normal">&#160;</span>
			<span class="normal">
				<xsl:value-of select="cat_ru:OrganizationName"/>
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
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal"> УИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"> (</span>
			<span class="normal">страна </span>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
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
</xsl:stylesheet>
