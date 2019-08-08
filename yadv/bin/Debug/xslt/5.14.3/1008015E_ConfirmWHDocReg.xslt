<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="condr cat_ru catWH_ru" version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:condr="urn:customs.ru:Information:WarehouseDocuments:ConfirmWHDocReg:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="condr:ConfirmWHDocReg">
		<html>
			<head>
				<title>Подтверждение о регистрации представленных документов</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
                    body {background: #CCCCCC; font-size: 9pt;}
                    div.page {
                        width: 180mm;
                        margin: 10px auto;
                        padding: 5mm 10mm;
                        background: white;
                        border: solid 1px black;
                        page-break-after: always;
                    }
                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}
                    div.goods {background: white;}
                    .bordered {
                        border: solid 1px black;
                        padding-top: 4pt;
                        padding-bottom: 4pt;
                        font-family: Arial;
                        font-size: 9pt;
                        font-weight: bold;
                    }
                    .underlined {border-bottom: solid 0.8pt black;}
                    p.NumberDate {font-weight: bold;}
                    .graph {font-family: Arial; font-size: 10pt;}
                    .graphColumn {font-family: Arial; font-size: 6.5pt;}
                    .graphLittle {font-family: Arial; font-size: 7pt;}
                    .graphTitleIt {font-family: Arial; font-size: 7pt; font-style: italic;}
                    .graphMain {font-family: Arial; font-size: 11pt; font-weight: bold; }
                    .graphNum {font-family: Arial; font-size: 7pt; font-weight: bold;}
                    .graphNo {font-size: 7pt; font-weight: bold;}
                    .value {border-bottom: solid 1px black; font-style: italic;}
                    .delim_3 {height: 3pt;}
                    h1{font-size: 12pt;}
                    table.addInfo {border-collapse: collapse; vertical-align: top;}
                    table.addInfo th {border: 1px solid black; background-color: LightGrey;}
                    table.addInfo td {border: 1px solid black; vertical-align: top;}
                    hr {border: 0; border-bottom: 1px solid black; margin: 0;}
                    .tr {border-right: 1px solid black;}
                    .tl {border-left: 1px solid black;}
                    .tb {border-bottom: 1px solid black;}
                    .tt {border-top: 1px solid black;}
                    .br {border-right: 2px solid black;}
                    .bl {border-left: 2px solid black;}
                    .bb {border-bottom: 2px solid black;}
                    .bt {border-top: 2px solid black;}
                    .db {border-bottom: 1px dashed black;}
                    .dl {border-left: 1px dashed black;}
                    .number {
                        text-align: center;
                        color: black;
                        font-size: 11pt;
                        font-weight: bold;
                        vertical-align: middle;
                    }
                </style>
			</head>
			<body>
				<div class="page">
					<h2 align="center" class="graphMain">Подтверждение о регистрации документов, представленных для помещения товаров на временное хранение</h2>
					<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
						<tbody>
							<tr>
								<td align="center" class="graph">
									<u>
										<xsl:value-of select="condr:Customs/cat_ru:Code"/>
										<xsl:text>&#160;</xsl:text>
										<xsl:value-of select="condr:Customs/cat_ru:OfficeName"/>
									</u>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">
									(наименование таможенного поста)
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
									<table>
										<tbody>
											<tr>
												<td class="graph" align="left">Подтверждается, что в
									<span class="graph value">
														<xsl:if test="condr:RegTime">
															<xsl:value-of select="substring(condr:RegTime,1,8)"/>
														</xsl:if>
													</span>
													<xsl:text>&#160;</xsl:text>
													<xsl:call-template name="text_date">
														<xsl:with-param name="date" select="condr:RegDate"/>
													</xsl:call-template> зарегистрированы документы,</td>
											</tr>
											<tr>
												<td align="center" class="graphLittle">(время и дата регистрации документов)</td>
											</tr>
											<tr>
												<td class="graph" align="left">представленные </td>
											</tr>
											<tr>
												<td align="center" class="graph value">
													<xsl:value-of select="condr:Organization/cat_ru:OrganizationName"/>
												</td>
											</tr>
											<tr>
												<td align="center" class="graphLittle">(организационно-правовая форма и наименование лица, представившего документ)</td>
											</tr>
											<tr>
												<td class="delim_3"/>
											</tr>
											<tr>
												<td class="graph">
													<xsl:text>  в </xsl:text>
													<span class="graph value">
														<xsl:if test="condr:PresentTime">
															<xsl:value-of select="substring(condr:PresentTime,1,8)"/>
														</xsl:if>
													</span>
													<xsl:text> &#160;</xsl:text>
													<xsl:call-template name="text_date">
														<xsl:with-param name="date" select="condr:PresentDate"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="delim_3"/>
											</tr>
											<xsl:if test="condr:WarehouseLicense">
												<tr>
													<td class="graph">Разрешительный документ склада, на который помещаются товары: <span class="graph value">
															<xsl:apply-templates select="condr:WarehouseLicense"/>
														</span>
													</td>
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
								<td cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
									<table>
										<tbody>
											<tr>
												<td width="40%" align="center" class="graph value">
													<xsl:text> &#160;</xsl:text>
												</td>
												<td width="10%"/>
												<td width="40%" align="center" class="graph value">/<xsl:value-of select="condr:CustomsPerson/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="condr:CustomsPerson/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="condr:CustomsPerson/cat_ru:PersonMiddleName"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="condr:CustomsPerson/cat_ru:PersonPost"/>
													<xsl:text> </xsl:text>
											ЛНП: <xsl:value-of select="condr:CustomsPerson/catWH_ru:LNP"/>/</td>
											</tr>
											<tr>
												<td align="center" class="graphLittle" width="40%">
									(подпись должностного лица таможенного поста, зарегистрировавшего документы)
								</td>
												<td width="10%"/>
												<td align="center" width="40%" valign="top" class="graphLittle">
									(расшифровка подписи)
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
	<xsl:template name="text_date">
		<xsl:param name="date"/>«<span class="graph value">
			<xsl:value-of select="substring($date,9,2)"/>
		</span>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>»&#160;<span class="graph value">
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
		</span>&#160;<xsl:value-of select="substring($date,1,2)"/>
		<span class="graph value">
			<xsl:value-of select="substring($date,3,2)"/>
		</span> г.</xsl:template>
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
	<xsl:template match="condr:WarehouseLicense">
		<xsl:text> № </xsl:text>
		<xsl:value-of select="catWH_ru:CertificateNumber"/>
		<xsl:if test="catWH_ru:CertificateDate"> от 
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="catWH_ru:CertificateDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
