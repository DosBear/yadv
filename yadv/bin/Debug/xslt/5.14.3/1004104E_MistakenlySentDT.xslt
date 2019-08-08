<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:mstkDT="urn:customs.ru:Information:ExchangeDocuments:MistakenlySentDT:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
		<xsl:template match="mstkDT:MistakenlySentDT">
		<html>
			<head>
				<title>Уведомление о прибытии товарной партии</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					body {
						background: #cccccc;
					}

					div.page {
						width: 190mm;
						margin: 10px auto;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding: 10mm 10mm 10mm 20mm;
						background: #ffffff;
						border: solid 1pt #000000;
					}

					.marg-top {
						margin-top:5mm;
					}

					table {
						width: 100%;
						border: 0;
						empty-cells: show;
						border-collapse: collapse;
						margin-top: 1px;
					}

					table.border tr td {
						border: 1px solid gray;
					}

					.graph {
						font-family: Arial;
						font-size: 10pt;
					}

					.value {
						border-bottom: solid 1px black;
					}

					div.title, tr.title td { font-weight:bold;  }

					.bordered { border-collapse: collapse; }

					td.bordered {
						border: solid 1px windowtext;
					}

					td.graphMain {
						vertical-align:top;
					}

					td.value.graphMain {
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
										<span style="font-size:large; font-weight:bold; ">Уведомление об ошибочно направленной ДТ
										<xsl:if test="mstkDT:CreateDate">
											<br/>
											от 
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="mstkDT:CreateDate"/>
											</xsl:call-template>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:if test="mstkDT:CreateTime">
												<xsl:variable name="createTime" select="mstkDT:CreateTime"/>
												<xsl:value-of select="substring($createTime, 1, 8)"/>
											</xsl:if>
										</xsl:if>
										</span>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:48%">
									Идентификатор процедуры, в которой зарегистрирована ДТ:
							</td>
							<td class="value graphMain" style="width:52%">
								<xsl:value-of select="mstkDT:ProcedureID"/>
							</td>
						</tr>
					</table>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:48%">Уникальный идентификатор ДТ:</td>
							<td class="value graphMain" style="width:52%">
								<xsl:value-of select="mstkDT:DeclarationID"/>
							</td>
						</tr>
					</table>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:48%">Принятое решение:</td>
							<td class="value graphMain" style="width:52%">
								<xsl:value-of select="mstkDT:Decision/mstkDT:DecisionDescription"/>
							</td>
						</tr>
					</table>
					<xsl:if test="mstkDT:Decision/mstkDT:Reasons">
						<br/>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:48%">Обоснование принятого решения:</td>
								<td class="value graphMain" style="width:52%">
									<xsl:value-of select="mstkDT:Decision/mstkDT:Reasons"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:48%">Код таможенного органа, принявшего решение:</td>
							<td class="value graphMain" style="width:52%">
								<xsl:value-of select="mstkDT:DecisionCustoms/cat_ru:Code"/>
							</td>
						</tr>
					</table>
					<xsl:if test="mstkDT:DecisionCustoms/cat_ru:OfficeName">
						<br/>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:48%">Наименование таможенного органа, принявшего решение:</td>
								<td class="value graphMain" style="width:52%">
									<xsl:value-of select="mstkDT:DecisionCustoms/cat_ru:OfficeName"/>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
