<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.13.3" xmlns:mpi="urn:customs.ru:Information:CustomsDocuments:MPOPayInfo:5.13.3">
	<!-- Шаблон для типа MPOPayInfoType -->
	<xsl:template match="mpi:MPOPayInfo">
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
										<b>Сведения об уплате таможенных платежей по МПО</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="mpi:DocType=0">
										<xsl:text>Уведомление об уплате таможенных платежей</xsl:text>
									</xsl:when>
									<xsl:when test="mpi:DocType=1">
										<xsl:text>Уведомление об истечении срока уплаты таможенных платежей</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="mpi:DocType"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="mpi:Reestr_ID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный номер реестра</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mpi:Reestr_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpi:MPOReestr"/>
					<xsl:if test="mpi:MPOReestr">
						<div class="title marg-top">Регистрационный номер реестра МПО</div>
					</xsl:if>
					<xsl:apply-templates select="mpi:MPOReestr"/>
					<xsl:if test="mpi:MPO_Registration">
						<div class="title marg-top">Регистрационный номер МПО</div>
					</xsl:if>
					<xsl:apply-templates select="mpi:MPO_Registration"/>
					<xsl:if test="mpi:DocDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время формирования документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="mpi:DocDate"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(mpi:DocDate, 12, 8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpi:PayDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время формирования квитанции на уплату</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="mpi:PayDate"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(mpi:PayDate, 12, 8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpi:TotalAmount">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Общая сумма таможенных платежей в рублях</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="translate(mpi:TotalAmount, '.', ',')"/>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа mpco:MPO_RegistrationType -->
	<xsl:template match="mpi:MPOReestr">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="mpco:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="mpco:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Уникальный номер МПО</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="mpco:MPO_Number"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа mpco:MPO_RegistrationType -->
	<xsl:template match="mpi:MPO_Registration">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="mpco:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="mpco:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Уникальный номер МПО</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="mpco:MPO_Number"/>
				</td>
			</tr>
		</table>
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
