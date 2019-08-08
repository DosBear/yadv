<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltExch_ru="urn:customs.ru:Information:ExchangeDocuments:ExchangeCommonLeafTypes:5.0.8" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:ramr="urn:customs.ru:Information:ExchangeDocuments:ReservedAmountRelease:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ReservedAmountReleaseType -->
	<xsl:template match="ramr:ReservedAmountRelease">
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
									width: 190mm;
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
										<b>Информация о зарезервированной сумме по дополнению к договору поручительства</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
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
							<td class="annot graphMain" style="width:50%">Дата резервирования  суммы</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="ramr:ReserveDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Сумма, которая была зарезервирована/ высвобождена</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="translate(ramr:ReserveAmount, '.', ',')"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ramr:ReleaseReserveDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата высвобождения зарезервированной суммы</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="ramr:ReleaseReserveDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ramr:ReleaseReason">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Причина высвобождения зарезервированной суммы</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="ramr:ReleaseReason"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип совершаемой операции</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="ramr:OperationIndicator='1'">
										<xsl:text>резервирование суммы</xsl:text>
									</xsl:when>
									<xsl:when test="ramr:OperationIndicator='0'">
										<xsl:text>высвобождение зарезервированной суммы</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="ramr:OperationIndicator"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="ramr:AdditionalInfo">
						<div class="title marg-top">Сведения о дополнении к договору поручительства</div>
						<xsl:apply-templates select="ramr:AdditionalInfo"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ramr:AdditionalInfoType -->
	<xsl:template match="ramr:AdditionalInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование поручителя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ramr:Guarantor"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Cрок, до истечения которого возможно использование дополнения в целях обеспечения уплаты таможенных пошлин, налогов при таможенном транзите товаров</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ramr:ValidityDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="ramr:GRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Cсылочный номер гарантии в транзите</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ramr:GRN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Уникальный идентификатор, присваиваемый дополнению к договору поручительства при регистрации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ramr:AdditionalID"/>
				</td>
			</tr>
		</table>
		<xsl:if test="ramr:AdditionalNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Присвоенный номер дополнения к договору поручительства</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="ramr:AdditionalNumber"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="ramr:AdditionalNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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
</xsl:stylesheet>
