<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:drp="urn:customs.ru:Information:CommercialFinanceDocuments:DecisionRevokePayments:5.13.3">
<!-- 
Функциональные требования ГУФТДиТР 2018 № 00415 ФТ на ЛК и Задолженность по формам (пошлины) (приложение).tif Приложения 3, 5, 7, 8 
Приложение 3 Решение таможенного органа об отзыве инкассового поручения (DocType = РОИ)
Приложение 5 Решение таможенного органа об отзыве поручения таможенного органа на перевод электронных денежных средств (DocType = РОП)
Приложение 7 Решение таможенного органа о приостановлении операций по счетам плательщика таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин и переводов его электронных денежных средств (DocType = РПО)
Приложение 8 Решение таможенного органа об отмене приостановления операций по счетам (счету) плательщика таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин и переводов его электронных денежных средств (DocType = РОПО)
-->

<!-- Шаблон для типа DecisionRevokePaymentsType -->
<xsl:template match="drp:DecisionRevokePayments">
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
			width: 210mm;
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
			}

		</style>
	</head>
	<body>
		<div class="page">
			<table>
				<tbody align="left" class="graphMain">
					<!--tr  align="center" class="graphHeader">
						<td>РЕШЕНИЕ</td>
					</tr>
					<tr class="delim_3"><td> </td></tr-->
					<tr align="center">
						<td>
							<xsl:choose>
								<xsl:when test="drp:DocType = 'РОИ'">Решение таможенного органа об отзыве инкассового поручения</xsl:when>
								<xsl:when test="drp:DocType = 'РОП'">Решение таможенного органа об отзыве поручения таможенного органа<br/>на перевод электронных денежных средств</xsl:when>
								<xsl:when test="drp:DocType = 'РПО'">Решение таможенного органа о приостановлении операций по счетам (счету) плательщика таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин и переводов его электронных денежных средств</xsl:when>
								<xsl:when test="drp:DocType = 'РОПО'">Решение таможенного органа об отмене приостановления операций по счетам (счету) плательщика таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин и переводов его электронных денежных средств</xsl:when>
								<xsl:otherwise>Решение&#160;<u>&#160;&#160;&#160;&#160;&#160;</u></xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<br/>
			<table>
				<tbody align="center" class="graphMain">
					<tr>
						<td width="3%" align="right">от&#160; </td>
						<td width="45%" align="left">
							<xsl:call-template name="Date">
								<xsl:with-param name="date" select="drp:DateDecision"/>
							</xsl:call-template>
						</td>
						<td width="12%" align="right">№&#160; </td>
						<td width="40%" class="border_bottom">
							<xsl:call-template name="DocNumber">
								<xsl:with-param name="DocumentReference" select="drp:DocumentReference"/>
								<xsl:with-param name="DocType" select="drp:DocType"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<br/>
			<table>
				<tbody align="center" class="graphMain">
					<tr>
						<td class="border_bottom">
							<span class="normal"><xsl:value-of select="drp:DRP_Customs/drp:FullOfficeName"/></span>
							<xsl:if test="drp:DRP_Customs/drp:FullOfficeName">
								<span class="normal"> (</span>
							</xsl:if>
							<span class="normal"><xsl:value-of select="drp:DRP_Customs/cat_ru:Code"/></span>
							<xsl:if test="drp:DRP_Customs/drp:FullOfficeName">
								<span class="normal">)</span>
							</xsl:if>
						</td>
					</tr>
					<tr class="graphLittle">
						<td align="center">(наименование таможенного органа)</td>
					</tr>
					<tr class="delim_3"><td> </td></tr>
					<tr>
						<td align="left">
							<span class="normal">
								<xsl:choose>
									<xsl:when test="drp:DocType = 'РОИ' or drp:DocType = 'РОП'">
										в связи с исполнением (прекращением) обязанности по уплате таможенных пошлин, налогов, 
										таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, процентов и пени
									</xsl:when>
									<xsl:when test="drp:DocType = 'РПО' or drp:DocType = 'РОПО'">
										в соответствии со статьей 77 Федерального закона 
										от <u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u> 
										№ <u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
										"О таможенном регулировании"
									</xsl:when>
									<xsl:otherwise>причины решения:&#160;<u>&#160;&#160;&#160;&#160;&#160;</u></xsl:otherwise>
								</xsl:choose>
							</span>
						</td>
					</tr>
					<tr><td><br/><br/></td></tr>
					<tr>
						<td>
							<span class="normal">Решил:</span>
						</td>
					</tr>
					<tr><td><br/></td></tr>
					<xsl:if test="drp:DocType = 'РОПО'">
						<tr>
							<td align="left">
								<span class="normal">
									Отменить решение таможенного органа о приостановлении операций по счетам плательщика 
									таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин 
									и переводов его электронных денежных средств от&#160;
									<u>&#160;&#160;
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="drp:DRP_Doc/drp:DRP_DocDate"/>
									</xsl:call-template>
									&#160;г.&#160;&#160;</u>&#160;№&#160;
									<u>&#160;&#160;
										<xsl:call-template name="DocNumber">
											<xsl:with-param name="DocumentReference" select="drp:DRP_Doc"/>
											<xsl:with-param name="DocType" select="'РПО'"/>
										</xsl:call-template>&#160;&#160;
									</u>, выставленного к счетам (счету)
								</span>
							</td>
						</tr>
						<tr>
							<td class="border_bottom">
								<span class="normal">
									номер(а) счет(а/ов):
									<xsl:for-each select="drp:BankAndAccountInfo/cat_ru:BankAccount">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									; тип счет(а/ов): <xsl:apply-templates select="drp:BankAndAccountInfo/cat_ru:BankAccountDescription"/>
									<xsl:if test="drp:BankAndAccountInfo/drp:CEMPId">
										; идентификатор КЭСП: <xsl:value-of select="drp:BankAndAccountInfo/drp:CEMPId"/>
									</xsl:if>
								</span>
							</td>
						</tr>
						<tr class="graphLittle">
							<td align="center">(указывается вид и номер счета плательщика, реквизиты корпоративного электронного средства платежа плательщика)</td>
						</tr>
						<tr class="delim_3"><td> </td></tr>
					</xsl:if>
					<tr class="delim"><td> </td></tr>
					<tr>
						<td align="left">
							<span class="normal">
								<xsl:choose>
									<xsl:when test="drp:DocType = 'РОИ' or drp:DocType = 'РОП'">
										Отозвать из банка
									</xsl:when>
									<xsl:when test="drp:DocType = 'РПО'">
										Приостановить в банке
									</xsl:when>
									<xsl:when test="drp:DocType = 'РОПО'">
										в банке
									</xsl:when>
								</xsl:choose>
							</span>
						</td>
					</tr>
					<tr>
						<td class="border_bottom">
							<span class="normal"><xsl:value-of select="drp:BankAndAccountInfo/cat_ru:BankName"/></span>
							<xsl:if test="drp:BankAndAccountInfo/cat_ru:BICID">
								<span class="normal">, БИК </span>
							</xsl:if>
							<span class="normal"><xsl:value-of select="drp:BankAndAccountInfo/cat_ru:BICID"/></span>
						</td>
					</tr>
					<tr class="graphLittle">
						<td align="center">
							<span>
								<xsl:choose>
									<xsl:when test="drp:DocType = 'РОПО'">
										(полное наименование банка, БИК)
									</xsl:when>
									<xsl:otherwise>
										(полное наименование, БИК банка)
									</xsl:otherwise>
								</xsl:choose>
							</span>	
						</td>
					</tr>
					<xsl:if test="drp:DocType = 'РОП'">
						<tr>
							<td align="left">
								<span class="normal">
									поручение на перевод электронных денежных средств&#160;
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="drp:DRP_Demand">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="drp:DRP_Demand/cat_ru:PrDocumentDate"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise> </xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="description">(дата и номер поручения на перевод электронных</xsl:with-param>
										<xsl:with-param name="width">42%</xsl:with-param>
										<xsl:with-param name="data_align">center</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
						</tr>
						<tr>
							<td align="left"><br/>
								<span class="normal">
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="drp:DRP_Demand">
													<xsl:if test="drp:DRP_Demand/cat_ru:PrDocumentNumber">
														&#160;№&#160;<xsl:value-of select="drp:DRP_Demand/cat_ru:PrDocumentNumber"></xsl:value-of>
													</xsl:if>&#160;
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="DocNumber">
														<xsl:with-param name="DocumentReference" select="drp:DRP_Doc"/>
														<xsl:with-param name="DocType" select="''"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="description">денежных средств)</xsl:with-param>
										<xsl:with-param name="width">50%</xsl:with-param>
										<xsl:with-param name="data_align">center</xsl:with-param>
									</xsl:call-template>
									&#160;на сумму&#160;
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of  select="translate(translate(format-number(drp:Amount, '#,###.00'),',',' '),'.',',')" />
										</xsl:with-param>
										<xsl:with-param name="description"></xsl:with-param>
										<xsl:with-param name="width">30%</xsl:with-param>
										<xsl:with-param name="data_align">center</xsl:with-param>
									</xsl:call-template>
									&#160;рублей,
								</span>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="drp:DocType = 'РОИ'">
						<tr>
							<td align="left">
								<span class="normal">
									инкассовое поручение&#160;
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="drp:DRP_Demand/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
											<xsl:if test="drp:DRP_Demand/cat_ru:PrDocumentNumber">
												&#160;№&#160;<xsl:value-of select="drp:DRP_Demand/cat_ru:PrDocumentNumber"></xsl:value-of>
											</xsl:if>&#160;
										</xsl:with-param>
										<xsl:with-param name="description">(дата и номер инкассового поручения)</xsl:with-param>
										<xsl:with-param name="width">76%</xsl:with-param>
										<xsl:with-param name="data_align">center</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
						</tr>
						<tr>
							<td align="left"><br/>
								<span class="normal">
									на сумму&#160;
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of  select="translate(translate(format-number(drp:Amount, '#,###.00'),',',' '),'.',',')" />
										</xsl:with-param>
										<xsl:with-param name="description"></xsl:with-param>
										<xsl:with-param name="width">81%</xsl:with-param>
										<xsl:with-param name="data_align">center</xsl:with-param>
									</xsl:call-template>
									&#160;рублей,
								</span>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="drp:DocType != 'РОПО'">
						<tr><td><br/></td></tr>
						<tr>
							<td align="left">
								<span class="normal">
									<xsl:choose>
										<xsl:when test="drp:DocType = 'РОИ'">выставленного к счету</xsl:when>
										<xsl:when test="drp:DocType = 'РОП'">со счета</xsl:when>
										<xsl:when test="drp:DocType = 'РПО'">по счетам (счету)</xsl:when>
									</xsl:choose>
								</span>
							</td>
						</tr>
						<tr>
							<td class="border_bottom">
								<span class="normal">
									номер(а) счет(а/ов):
									<xsl:for-each select="drp:BankAndAccountInfo/cat_ru:BankAccount">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									; тип счет(а/ов): <xsl:apply-templates select="drp:BankAndAccountInfo/cat_ru:BankAccountDescription"/>
									<xsl:if test="drp:BankAndAccountInfo/drp:CEMPId">
										; идентификатор КЭСП: <xsl:value-of select="drp:BankAndAccountInfo/drp:CEMPId"/>
									</xsl:if>
								</span>
							</td>
						</tr>
						<tr class="graphLittle">
							<td align="center">
								<xsl:choose>
									<xsl:when test="drp:DocType = 'РОИ'">(указывается вид и номер счета плательщика)</xsl:when>
									<xsl:when test="drp:DocType = 'РОП'">(указываются реквизиты корпоративного электронного средства платежа плательщика)</xsl:when>
									<xsl:when test="drp:DocType = 'РПО'">(указывается вид и номер счета плательщика, реквизиты корпоративного электронного средства платежа плательщика)</xsl:when>
								</xsl:choose>
							</td>
						</tr>
						<tr class="delim_3"><td> </td></tr>
					</xsl:if>
					<tr>
						<td align="left">
							<span class="normal">
								<xsl:choose>
									<xsl:when test="drp:DocType = 'РОИ'">открытом</xsl:when>
									<xsl:when test="drp:DocType = 'РОП'">открытом</xsl:when>
									<xsl:when test="drp:DocType = 'РПО'">открытым (открытому)</xsl:when>
									<xsl:when test="drp:DocType = 'РОПО'">открытым (открытому)</xsl:when>
								</xsl:choose>
							</span>
						</td>
					</tr>
					<tr>
						<td class="border_bottom">
							<span class="normal">
								<xsl:apply-templates select="drp:PayerInfo"/>
							</span>
						</td>
					</tr>
					<tr class="graphLittle">
						<td align="center">
							<xsl:choose>
									<xsl:when test="drp:DocType = 'РОИ' or drp:DocType = 'РОП'">(полное наименование организации (Ф.И.О. индивидуального предпринимателя, физического лица), идентификационный номер налогоплательщика/код причины постановки на учет (если имеется))</xsl:when>
									<xsl:when test="drp:DocType = 'РПО' or drp:DocType = 'РОПО'">(полное наименование организации или Ф.И.О. плательщика индивидуального предпринимателя (физического лица), идентификационный номер налогоплательщика, код причины постановки на учет (если имеется))</xsl:when>
							</xsl:choose>
						</td>
					</tr>
					<tr class="delim_3"><td> </td></tr>
					<xsl:if test="drp:DocType = 'РПО'">
						<tr>
							<td align="left"><br/>
								<span class="normal">
									все расходные операции на сумму&#160;
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of  select="translate(translate(format-number(drp:Amount, '#,###.00'),',',' '),'.',',')" />
										</xsl:with-param>
										<xsl:with-param name="description"></xsl:with-param>
										<xsl:with-param name="width">30%</xsl:with-param>
										<xsl:with-param name="data_align">center</xsl:with-param>
									</xsl:call-template>
									&#160;рублей, за исключением операций по платежам, очередность исполнения которых в соответствии с гражданским законодательством
									Российской Федерации предшествует исполнению обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных,
									антидемпинговых, компенсационных пошлин, процентов и пени.
								</span>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="drp:DocType = 'РОПО'">
						<tr>
							<td align="left"><br/>
								<span class="normal">
									в сумме&#160;
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of  select="translate(translate(format-number(drp:Amount, '#,###.00'),',',' '),'.',',')" />
										</xsl:with-param>
										<xsl:with-param name="description"></xsl:with-param>
										<xsl:with-param name="width">30%</xsl:with-param>
										<xsl:with-param name="data_align">center</xsl:with-param>
									</xsl:call-template>
									&#160;рублей.
								</span>
							</td>
						</tr>
					</xsl:if>
					<tr><td><br/><br/></td></tr>
					<tr>
						<td align="left"><br/>
							<span class="normal">
								Начальник (заместитель начальника)
							</span>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<table>
				<tr class="graphMain" align="center">
					<td width="41%" class="border_bottom"> 
						<span class="normal">
							<xsl:if test="drp:DRP_Customs/drp:FullOfficeName">
								<xsl:value-of select="drp:DRP_Customs/drp:FullOfficeName"/>
								(
							</xsl:if>
							код ТО <xsl:value-of select="drp:DRP_Customs/cat_ru:Code"/>
							<xsl:if test="drp:DRP_Customs/drp:FullOfficeName">
								)
							</xsl:if>
						</span>	
					</td>
					<td width="3%"> </td>
					<td width="15%" class="border_bottom"> </td>
					<td width="3%"> </td>
					<td width="38%" class="border_bottom">
						<span class="normal">
							<xsl:value-of select="drp:CustomsChief/cat_ru:PersonName"/>&#160;
							<xsl:if test="drp:CustomsChief/cat_ru:LNP">
								(ЛНП&#160;
								<xsl:value-of select="drp:CustomsChief/cat_ru:LNP"/>)
							</xsl:if>		
							<br/>
						</span>	
					</td>
				</tr>
				<tr class="graphLittle" align="center">
					<td width="41%">(наименование таможенного органа)</td>
					<td width="3%"> </td>
					<td width="15%">(подпись)</td>
					<td width="3%"> </td>
					<td width="38%">(Ф.И.О.)</td>
				</tr>
			</table>
			<br/>
			<br/>
			<table>
				<tr class="graphMain" align="center">
					<td width="15%" align="left"> 
						<span class="normal">
							Исполнитель
						</span>	
					</td>
					<td width="50%" class="border_bottom">
						<span class="normal">
							<xsl:apply-templates select="drp:Executor"/>
							<br/>
						</span>	
					</td>
					<td width="35%"> </td>
				</tr>
				<tr class="graphLittle" align="center">
					<td width="15%"> </td>
					<td width="50%">(Ф.И.О.)</td>
					<td width="35%"> </td>
				</tr>
			</table>
		</div>
	</body>
</html>
</xsl:template>

<!-- Шаблон для типа cat_ru:OrganizationBaseType -->
<xsl:template match="drp:PayerInfo">
	<xsl:if test="cat_ru:OrganizationName">
		<xsl:value-of select="cat_ru:OrganizationName" />
	</xsl:if>
	<xsl:if test="cat_ru:ShortName">
		<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
			<span class="normal"> (</span>
		</xsl:if>
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
		<xsl:value-of select="cat_ru:INN" />
	</xsl:if>
	<xsl:if test="cat_ru:KPP">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0">
			<span class="normal"> / </span>
		</xsl:if>
		<xsl:value-of select="cat_ru:KPP" />
	</xsl:if>
	<!--xsl:if test="cat_ru:OGRN">
		<span class="normal">, </span>
		<span class="italic">ОГРН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:OGRN" />
	</xsl:if-->
</xsl:template>

<!-- Шаблон для типа cat_ru:RKOrganizationFeatures -->
<xsl:template match="cat_ru:RKOrganizationFeatures">
	<xsl:if test="cat_ru:BIN">
		<span class="normal">, </span>
		<span class="italic">БИН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:BIN" />
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
		<xsl:value-of select="cat_ru:IIN" />
	</xsl:if>
	<xsl:if test="cat_ru:ITN">
		<span class="normal">, </span>
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
		<span class="normal">, </span>
		<span class="italic">УНП</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:UNP" />
	</xsl:if>
	<xsl:if test="cat_ru:RBIdentificationNumber">
		<span class="normal">, </span>
		<span class="italic">ИНФЛ</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:RBIdentificationNumber" />
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:RAOrganizationFeatures -->
<xsl:template match="cat_ru:RAOrganizationFeatures">
	<xsl:if test="cat_ru:UNN">
		<span class="normal">, </span>
		<span class="italic">УНН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:UNN" />
	</xsl:if>
	<xsl:if test="cat_ru:SocialServiceNumber">
		<span class="normal">, </span>
		<span class="italic">НЗОУ</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:SocialServiceNumber" />
	</xsl:if>
	<xsl:if test="cat_ru:SocialServiceCertificate">
		<span class="normal">, </span>
		<span class="italic">№ справки об отсутв. НЗОУ</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:SocialServiceCertificate" />
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:KGOrganizationFeatures -->
<xsl:template match="cat_ru:KGOrganizationFeatures">
	<xsl:if test="cat_ru:KGINN">
		<span class="italic">, ИНН(ПИН)</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:KGINN" />
	</xsl:if>
	<xsl:if test="cat_ru:KGOKPO">
		<span class="italic">, ОКПО</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:KGOKPO" />
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:PersonBaseType -->
<xsl:template match="drp:Executor">
	<span class="normal">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>,&#160;
		</xsl:if>
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			&#160;<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
	</span>
</xsl:template>

<!-- Шаблон для типа drp:DRP_DocumentReferenceType -->
<xsl:template name="DocNumber">
	<xsl:param name="DocumentReference"/>
	<xsl:param name="DocType"/>
	<span class="normal">
		<xsl:value-of select="$DocumentReference/drp:CustomsCode"/>/<xsl:value-of select="$DocumentReference/drp:RegistrationYear"/>/<xsl:value-of select="$DocType"/>/<xsl:value-of select="$DocumentReference/drp:DocNumber"/>
	</span>
</xsl:template>

<xsl:template name="russian_date">
	<xsl:param name="dateIn" />
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<span class="normal">
				<xsl:value-of select="substring($dateIn,9,2)" />
			</span>
			<span class="normal">.</span>
			<span class="normal">
				<xsl:value-of select="substring($dateIn,6,2)" />
			</span>
			<span class="normal">.</span>
			<span class="normal">
				<xsl:value-of select="substring($dateIn,1,4)" />
			</span>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="Date">
	<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="border_bottom"><xsl:value-of select="substring($date,9,2)"/></td>
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
					<td width="2%" align="right">20</td>
					<td width="9%" class="border_bottom" align="left"><xsl:value-of select="substring($date,3,2)"/></td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>	
	</xsl:template>
	
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}" style="align: {$data_align};"> <!--да, выравнивание дважды, нужно для кроссплатформенности-->
					<td class="border_bottom">
						<xsl:value-of select="$data"/><br/>
					</td>
				</tr>
				<tr align="center">
					<td class="graphLittle">
						<xsl:value-of select="$description"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
</xsl:stylesheet>