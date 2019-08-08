<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.14.3" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:predec="urn:customs.ru:Information:TransportDocuments:PrelimDecisionMsg:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
 <!-- Шаблон для типа PrelimDecisionMsgType -->
<xsl:template match="predec:PrelimDecisionMsg">
<html>
	<head>
		<style>
			body 
				{background: #cccccc; }

			div
				{white-space: nowrap; }

			div.page 
				{
				width: 295mm;
				margin-top: 6pt;
				margin-bottom: 6pt;
				padding:	10mm;
				padding-left:	10mm;
				background: #ffffff;
				border: solid .5pt #000000;				
				}

			.marg-top
				{margin-top:5mm; }

			table
				{
				width: 100%;
				border: 0;
				empty-cells: show;
				border-collapse: collapse;
				margin-top: 1px;
				}

			table.border tr td
				{border: 1px solid gray; }
	
			.graph 
				{
				font-family: Arial;
				font-size: 10pt;
				}

			.value
				{border-bottom: solid 1px black; }

			div.title, tr.title td 
				{ font-weight:bold;  }
				
			.bordered { border-collapse: collapse; }
									
			td.bordered
				{border: solid 1px windowtext;	}

			td.graphMain
				{vertical-align:top; }
									
			td.value.graphMain
				{vertical-align:bottom;	}
		</style>
	</head>
	<body>
		<div class="page">
			<table class="w190">
				<tbody>
					<tr>
						<td align="center" class="graphMain">
							<font size="4"><b>Сообщение о принятии предварительного решения в ТО</b></font>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<xsl:if test="predec:PI_URN">
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор товарной партии</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="predec:PI_URN" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата / время принятия решения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="predec:DecisionDate" />
						</xsl:call-template>
						<xsl:text>  </xsl:text>
						<xsl:if test="predec:DecisionTime">
							<xsl:value-of select="substring(predec:DecisionTime, 1,8)" />
						</xsl:if>
					</td>
				</tr>
			</table>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного поста</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="predec:CustomsCode" /></td>
				</tr>
			</table>
			<xsl:if test="predec:TSControlDecision">
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:50%">Принятое решение по ТС</td>
						<td class="value graphMain" style="width:50%"><xsl:value-of select="predec:TSControlDecision" /></td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="predec:CustomsPerson">
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:50%">Должностное лицо, принимающее решение</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="predec:CustomsPerson/cat_ru:PersonName" />
							<xsl:if test="predec:CustomsPerson/cat_ru:LNP">
								<xsl:text> (ЛНП: </xsl:text>
								<xsl:value-of select="predec:CustomsPerson/cat_ru:LNP" />
								<xsl:text>)</xsl:text>
							</xsl:if>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="predec:Consignments">
				<div class="title marg-top">Сведения о товарных партиях</div>
				<table class="bordered w190">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Номер товарной партии</td>
							<td class="graphMain bordered">Серийный номер накладной</td>
							<td class="graphMain bordered">Номер товара по порядку</td>
							<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
							<td class="graphMain bordered">Описание товара</td>
							<td class="graphMain bordered">Вес товара брутто (кг)</td>
							<td class="graphMain bordered">Вес товара нетто (кг)</td>
							<td class="graphMain bordered">Форма таможенного контроля</td>
							<td class="graphMain bordered">Результат таможенного контроля</td>
							<td class="graphMain bordered">Принятое решение</td>
							<td class="graphMain bordered">Номер вагона</td>
							<td class="graphMain bordered">Номер контейнера</td>
						</tr>
						<xsl:for-each select="predec:Consignments">
							<xsl:variable name="rowspan">
								<xsl:choose>
									<xsl:when test="count(predec:Goods) &gt; 0"><xsl:value-of select="count(predec:Goods)"/></xsl:when>
									<xsl:otherwise><xsl:value-of select="number('1')"/></xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<tr>
								<td class="graphMain bordered" rowspan="{$rowspan}"><xsl:value-of select="predec:ConsignmentNum" /></td>
								<td class="graphMain bordered" rowspan="{$rowspan}"><xsl:value-of select="predec:BillSerialNumber" /></td>
								<!--GOODS-->
								<xsl:apply-templates select="predec:Goods[position() = 1]"/>
							</tr>
							<xsl:for-each select="predec:Goods[position() &gt; 1]">
								<xsl:apply-templates select="."/>
							</xsl:for-each>	
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="predec:Railway">
				<div class="title marg-top">Сведения о железной дороге</div>
			</xsl:if>
			<xsl:apply-templates select="predec:Railway" />
		</div>
	</body>
</html>
</xsl:template>

<!-- Шаблон для типа predec:GoodsType -->
<xsl:template match="predec:Goods">
	<td class="graphMain bordered"><xsl:value-of select="cat_ru:GoodsNumeric" /></td>
	<td class="graphMain bordered"><xsl:value-of select="cat_ru:GoodsTNVEDCode" /></td>
	<td class="graphMain bordered"><xsl:for-each select="cat_ru:GoodsDescription"><xsl:value-of select="."/></xsl:for-each></td>
	<td class="graphMain bordered"><xsl:value-of select="translate(cat_ru:GrossWeightQuantity, '.', ',')" /></td>
	<td class="graphMain bordered"><xsl:value-of select="translate(cat_ru:NetWeightQuantity, '.', ',')" /></td>
	<td class="graphMain bordered"><xsl:value-of select="predec:CustControlForm" /></td>
	<td class="graphMain bordered"><xsl:value-of select="predec:CustControlResult" /></td>
	<td class="graphMain bordered"><xsl:value-of select="predec:CustControlDecision" /></td>
	<td class="graphMain bordered"><xsl:value-of select="predec:WagonNumber" /></td>
	<td class="graphMain bordered"><xsl:value-of select="predec:ContainerNumber" /></td>
</xsl:template>

<!-- Шаблон для типа predec:RailwayType -->
<xsl:template match="predec:Railway">
	<table class="w190">
		<xsl:if test="predec:RailwayCode">	
			<tr>
				<td class="annot graphMain" style="width:50%">Код железнодорожной дороги </td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="predec:RailwayCode" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="predec:StationCode">
			<tr>
				<td class="annot graphMain" style="width:50%">Код железнодорожной станции</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="predec:StationCode" /></td>
			</tr>
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Наименование дороги и станции назначения</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="predec:RailwayAndStationName" /></td>
		</tr>		
		<xsl:if test="predec:TrainIndex">
			<tr>
				<td class="annot graphMain" style="width:50%">Индекс поезда</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="predec:TrainIndex" /></td>
			</tr>
		</xsl:if>	
		<xsl:if test="predec:TrainNumber">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер поезда</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="predec:TrainNumber" /></td>
			</tr>
		</xsl:if>
	</table>
</xsl:template>

<xsl:template name="russian_date">
	<xsl:param name="dateIn" />
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,6,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,1,4)" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>