<?xml version="1.0" encoding="utf-8"?>
<!--
Приказ ФТС от 27.12.18 № 2138  "Об утверждении Порядка списания сумм таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, признанных безнадежными к взысканию, форм документов, оформляемых таможеными органами при их списании, и перечня документов, подтверждающих обстоятельства признания сумм таможенных платежей, специальых, антидемпинговых, компенсационных пошлин, процентов и пеней безнадежными к взысканию" (Приложение 1 "Решение таможенного органа о признаии  безнадежными к взысканию и списании сумм таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней")-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dwop="urn:customs.ru:Information:CommercialFinanceDocuments:DecisionWriteOffPayments:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:template match="dwop:DecisionWriteOffPayments">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									font-family: Arial;}

									div
									{
									/*white-space: nowrap;*/
									}

									div.page {
									width: 180mm;
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
									font-style: italic;
									}

									div.title, tr.title td { font-weight:bold;  }
									.bordered { border-collapse: collapse; }
									td.bordered
									{
									border: solid 1px windowtext;
									}

			                        .delim_3 {
				                    height: 3pt;
			                        }

									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}
									.graph8{
									font-size:8pt;
									}
									div.cellwidener {
									margin-top: 0pt;
									margin-left: 0pt;
									margin-bottom: 0pt;
									margin-right: 5pt;
									}
									.indent{
						             text-indent: 1.5em;
					                }	
									underline 
									{ text-decoration: underline; }
								</style>
			</head>
			<body>
				<div class="page">
					<table width="100%">
						<tbody>
							<tr align="center" valign="top">
								<td>
									<b>
										<xsl:text>Решение таможенного органа</xsl:text>
										<xsl:text> о признаии  безнадежными к взысканию и списании </xsl:text>
										<xsl:text>сумм таможенных платежей, специальных, антидемпинговых, </xsl:text>
										<xsl:text>компенсационных пошлин, процентов и пеней</xsl:text>
										<br/>
										<br/>
										<xsl:text>от </xsl:text>
										<xsl:call-template name="text_date">
											<xsl:with-param select="dwop:DocDate" name="date"/>
										</xsl:call-template>
										<xsl:text> № </xsl:text>
										<span class="value">
											<xsl:value-of select="dwop:DocNumber"/>
										</span>
									</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table width="100%">
						<tbody>
							<tr valign="top" align="center">
								<td class="value">
									<xsl:apply-templates select="dwop:Customs"/>
								</td>
							</tr>
							<tr align="center">
								<td class="graph8">(наименование таможенного органа)</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>в соответствии со статьей 82 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение о признании безнадежными к взысканию и списании сумм таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов, пеней, учитываемых в таможенном органе, в размере</xsl:text>
									<xsl:text>&#160;&#160;</xsl:text>
									<span class="value">
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="translate(translate(format-number(dwop:Amount, '#,###.00'),',',' '),'.',',')"/>
										<xsl:text>&#160;</xsl:text>
									</span>
									<xsl:text>рублей, </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr align="left">
								<td>в том числе:</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<xsl:if test="dwop:CustomsPaymentAmount">
												<tr>
													<td width="80%">таможенные платежи - </td>
													<td valign="bottom" class="value" width="17%">
														<xsl:text>&#160;</xsl:text>
														<xsl:value-of select="translate(translate(format-number(dwop:CustomsPaymentAmount, '#,###.00'),',',' '),'.',',')"/>
													</td>
													<td valign="bottom" width="3%">руб</td>
												</tr>
											</xsl:if>
											<xsl:if test="dwop:PaymentsFeesAmount">
												<tr>
													<td width="80%">специальные, антидемпинговые, компенсационные пошлины - </td>
													<td valign="bottom" class="value" width="17%">
														<xsl:text>&#160;</xsl:text>
														<xsl:value-of select="translate(translate(format-number(dwop:PaymentsFeesAmount, '#,###.00'),',',' '),'.',',')"/>
													</td>
													<td valign="bottom" width="3%">руб</td>
												</tr>
											</xsl:if>
											<xsl:if test="dwop:PenaltyAmount">
												<tr>
													<td width="80%">пени - </td>
													<td valign="bottom" class="value" width="17%">
														<xsl:text>&#160;</xsl:text>
														<xsl:value-of select="translate(translate(format-number(dwop:PenaltyAmount, '#,###.00'),',',' '),'.',',')"/>
													</td>
													<td valign="bottom" width="3%">руб</td>
												</tr>
											</xsl:if>
											<xsl:if test="dwop:PercentAmount">
												<tr>
													<td width="80%">проценты - </td>
													<td valign="bottom" class="value" width="17%">
														<xsl:text>&#160;</xsl:text>
														<xsl:value-of select="translate(translate(format-number(dwop:PercentAmount, '#,###.00'),',',' '),'.',',')"/>
													</td>
													<td valign="bottom" width="3%">руб</td>
												</tr>
											</xsl:if>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td align="left">
									<xsl:text>Решение принято на основании следующих документов:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<xsl:for-each select="dwop:DecisionDocument">
												<tr>
													<td width="99%" class="value" align="left">
														<xsl:value-of select="cat_ru:PrDocumentName"/>
														<xsl:if test="cat_ru:PrDocumentNumber">
															<xsl:text> № </xsl:text>
															<xsl:value-of select="cat_ru:PrDocumentNumber"/>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentDate">
															<xsl:text> от </xsl:text>
															<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
														</xsl:if>
													</td>
													<td width="1%">
														<xsl:if test="position()!=last()">,</xsl:if>
														<xsl:if test="position()=last()">.</xsl:if>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
						</tbody>
					</table>
					<br/>
					<table width="100%">
						<tbody>
							<tr>
								<td>
									<xsl:apply-templates select="dwop:CustomsChief"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table width="100%">
						<tbody>
							<tr>
								<td>
									<xsl:apply-templates select="dwop:Executor"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:for-each select="RUScat_ru:PostalCode|RUScat_ru:CountryCode|RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="executor" match="dwop:Executor">
		<xsl:param name="executor"/>
		<xsl:param name="hasPhone"/>
		<table width="100%">
			<tbody>
				<tr valign="bottom">
					<td width="16%">Исполнитель</td>
					<td width="55%" class="value" align="center">
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
					<td/>
				</tr>
				<tr align="center" valign="top">
					<td/>
					<td class="graph8">(фамилия, инициалы должностного лица таможенного органа)</td>
					<td/>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="dwop:CustomsChief">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="40%" align="left">Начальник таможенного органа<br/>(или лицо, им уполномоченное)</td>
					<td/>
					<td class="value" width="15%"/>
					<td/>
					<td class="value" width="30%">
						<xsl:value-of select="cat_ru:PersonName"/>
					</td>
				</tr>
				<tr align="center">
					<td class="graph8"/>
					<td/>
					<td class="graph8">(подпись)</td>
					<td/>
					<td class="graph8">(фамилия, инициалы)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="organization" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="dwop:Customs">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="not(cat_ru:OfficeName) and dwop:FullOfficeName">
			<xsl:value-of select="dwop:FullOfficeName"/>
		</xsl:if>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text>)</xsl:text>
	</xsl:template>
	<xsl:template mode="num_date" match="*">
		<xsl:param name="dateIn" select="."/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="text_date">
		<xsl:param name="date"/>«<span class="value">&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</span>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>»&#160;<span class="value">&#160;<xsl:choose>
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
			</xsl:choose>&#160;</span>&#160;<xsl:value-of select="substring($date,1,2)"/>
		<span class="value">
			<xsl:value-of select="substring($date,3,2)"/>
		</span> г.</xsl:template>
	<xsl:template mode="russian_date" match="*">
		<xsl:param name="dateIn" select="."/>
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
