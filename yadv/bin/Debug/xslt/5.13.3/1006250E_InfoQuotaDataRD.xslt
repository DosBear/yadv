<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:iqdrd="urn:customs.ru:Information:CustomsDocuments:InfoQuotaDataRD:5.13.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа InfoQuotaDataRDType -->
	<xsl:template match="iqdrd:InfoQuotaDataRD">
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
										<b>Информация о квоте разрешительного документа</b>
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
						<xsl:if test="cat_ru:RefDocumentID">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</xsl:if>
					</table-->
					<table class="w190">
						<xsl:if test="iqdrd:Status">
							<tr>
								<td class="annot graphMain" style="width:50%">Статус РД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="iqdrd:Status=1">ACTIVE - Действует</xsl:when>
										<xsl:when test="iqdrd:Status=2"><span style="color:red">SUSPENDED - Действие приостановлено</span></xsl:when>
										<xsl:when test="iqdrd:Status=3"><span style="color:orange">PARTIALSUSPENSION - Действие временно приостановлено</span></xsl:when>
										<xsl:when test="iqdrd:Status=4">REVIVED - Действие возобновлено</xsl:when>
										<xsl:when test="iqdrd:Status=5"><span style="color:red">DISCONTINUED - Действие прекращено</span></xsl:when>
										<xsl:when test="iqdrd:Status=6">EXTENDED - Продлено</xsl:when>
										<xsl:when test="iqdrd:Status=7"><span style="color:red">CANCELED - Аннулировано</span></xsl:when>
										<xsl:when test="iqdrd:Status=8"><span style="color:silver">ARCHIVED - Архивно</span></xsl:when>
										<xsl:when test="iqdrd:Status=9"><span style="color:silver">NOTPUBLISHED - Не опубликован</span></xsl:when>
										<xsl:when test="iqdrd:Status=10"><span style="color:red">EXCLUDEDREG - Исключен из реестра</span></xsl:when>
										<xsl:otherwise><xsl:value-of select="iqdrd:Status"/></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный номер по БД РД</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="iqdrd:BDRDID"/></td>
						</tr>
						<xsl:if test="iqdrd:UseDateTime">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время последнего списания квот</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="iqdrd:UseDateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(iqdrd:UseDateTime,12,8)"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="iqdrd:RDDocument">
							<tr>
								<td class="annot graphMain" style="width:50%">Прикладной номер и дата разрешительного документа</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="iqdrd:RDDocument"/></td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:50%">Исходное количество товара по всему РД</td>
							<td class="value graphMain" style="width:50%">
								<xsl:for-each select="iqdrd:TotalSupplementaryQuantity">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Остаток квоты по всему РД</td>
							<td class="value graphMain" style="width:50%">
								<xsl:for-each select="iqdrd:TotalBalanceQuantity">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<xsl:if test="iqdrd:Goods">
						<div class="title marg-top">Сведения о товарах РД</div>
						<table class="bordered w190">
							<tr class="title">
								<td class="graphMain bordered">Номер товара</td>
								<td class="graphMain bordered">Исходное количество и единицы измерения</td>
								<td class="graphMain bordered">Остаток квоты</td>
							</tr>
							<xsl:for-each select="iqdrd:Goods">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="iqdrd:BalanceQuantity| iqdrd:SupplementaryQuantity| iqdrd:TotalBalanceQuantity| iqdrd:TotalSupplementaryQuantity">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="not(cat_ru:MeasureUnitQualifierName) and cat_ru:MeasureUnitQualifierCode">
			<xsl:text>(код: </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа iqdrd:GoodsDescriptionType -->
	<xsl:template match="iqdrd:Goods">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="iqdrd:GoodsNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="iqdrd:SupplementaryQuantity">
					<xsl:apply-templates select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="iqdrd:BalanceQuantity">
					<xsl:apply-templates select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="iqdrd:RDDocument">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
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
