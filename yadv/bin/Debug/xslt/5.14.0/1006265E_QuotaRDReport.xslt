<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:qrdr="urn:customs.ru:Information:CustomsDocuments:QuotaRDReport:5.14.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа QuotaRDReportType -->
	<xsl:template match="qrdr:QuotaRDReport">
		<html>
			<head>
				<style>
									@media print {div.page {border: none; margin: 0; padding: 0;}}
									
              						body {
									background: #cccccc;
									}

									div
									{
									white-space: nowrap;
									}

									div.page {
									width: 270mm;
									max-width: 270mm;
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
									empty-cells: show;
									border-collapse: collapse;
									border: 1px solid windowtext;
									margin-top: 1px;
									table-layout: fixed;
									}

									td, th
									{
									border: 1px solid windowtext;
									}
									
									td
									{
									word-break: break-all;
									}
									
									.graph {
									font-family: Arial;
									font-size: 18pt;
									}

									.value
									{
									border-bottom: solid 1px black;
									}

									div.title, tr.title td { font-weight:bold;  }

									table.no_bordered, tr.no_bordered, td.no_bordered
									{
									border: 0px;
									}

									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}
									
									.graphHeader
									{
									font-family: Arial;
									font-size: 14pt;
									font-weight:bold;
									}
									
									.normal
									{
									font-size: 11pt;
									font-family:Arial;
									}			

									.normal_green
									{
									font-weight: bold;
									font-size: 11pt;
									font-family:Arial;
									color: green;
									}			

									.normal_red
									{
									font-weight: bold;
									font-size: 11pt;
									font-family:Arial;
									color: red;
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
								</style>
			</head>
			<body>
				<div class="page">
					<table class="no_bordered">
						<tbody>
							<tr>
								<td align="center" class="graphMain graphHeader no_bordered">
										Детальная информация по списанию квоты
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<col width="10%"/>
						<col width="5%"/>
						<col width="10%"/>
						<col width="10%"/>
						<col width="10%"/>
						<col width="10%"/>
						<col width="5%"/>
						<col width="6%"/>
						<col width="9%"/>
						<col width="9%"/>
						<col width="8%"/>
						<!--col width="8%"/-->
						<thead>
							<tr align="center" valign="top">
								<th>Номер разреши-<br/>тельного документа</th>
								<th>Вид<br/>доку-<br/>мента</th>
								<th>ФОИВ</th>
								<th>Статус документа</th>
								<th>Дата ис-<br/>поль-<br/>зова-<br/>ния</th>
								<th>Документ, по которому произво-<br/>дилось списание</th>
								<th>№<br/>това-<br/>ра в ДТ</th>
								<th>№ п/п<br/>това-<br/>ра<br/>в РД</th>
								<th>Общее<br/>коли-<br/>чество<br/>товара в РД</th>
								<th>Единица измерения</th>
								<th>Коли-<br/>чество<br/>списанной<br/>квоты</th>
								<!--th>Остаток квоты</th-->
							</tr>
						</thead>
						<tbody>
							<xsl:variable name="base" select="."/>
							<xsl:for-each select="qrdr:CustomsDoc">
								<xsl:variable name="doc" select="."/>
								<xsl:choose>
									<xsl:when test="count(qrdr:Goods) = 0">
										<tr>
											<xsl:apply-templates mode="base" select="$base"/>
											<xsl:apply-templates mode="doc" select="$doc"/>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<!--td></td-->
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<xsl:for-each select="qrdr:Goods">
											<xsl:variable name="goods" select="."/>
											<xsl:choose>
												<xsl:when test="count(qrdr:AllRDQuantity) = 0">
												<tr>
													<xsl:apply-templates mode="base" select="$base"/>
													<xsl:apply-templates mode="doc" select="$doc"/>
													<xsl:apply-templates mode="goods" select="$goods"/>
													<td></td>
													<td></td>
													<td></td>
													<!--td></td-->
												</tr>
												</xsl:when>
												<xsl:otherwise>
													<xsl:for-each select="qrdr:AllRDQuantity">
														<xsl:variable name="AllRDQuantity" select="."/>
														<tr>
															<xsl:apply-templates mode="base" select="$base"/>
															<xsl:apply-templates mode="doc" select="$doc"/>
															<xsl:apply-templates mode="goods" select="$goods"/>
															<xsl:apply-templates mode="AllRDQuantity" select="$AllRDQuantity"/>
														</tr>
													</xsl:for-each>	
												</xsl:otherwise>	
											</xsl:choose>
										</xsl:for-each>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>			
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="base" match="*">
		<td>
			<span class="normal"><xsl:value-of select="qrdr:RDDocument/cat_ru:PrDocumentNumber"/></span>
		</td>
		<td align="center">
			<span class="normal"><xsl:value-of select="qrdr:RDDocument/RUScat_ru:DocKindCode"/></span>
		</td>
		<td>
			<span class="normal"><xsl:value-of select="qrdr:RDDocument/cat_ru:PrDocumentName"/></span>
		</td>
		<td>
			<xsl:choose>
				<xsl:when test="qrdr:Status=1"><span class="normal_green">Действует</span></xsl:when>
				<xsl:when test="qrdr:Status=2"><span class="normal_red">Действие приостановлено</span></xsl:when>
				<xsl:when test="qrdr:Status=3"><span class="normal_red">Действие временно приостановлено</span></xsl:when>
				<xsl:when test="qrdr:Status=4"><span class="normal_green">Действие возобновлено</span></xsl:when>
				<xsl:when test="qrdr:Status=5"><span class="normal_red">Действие прекращено</span></xsl:when>
				<xsl:when test="qrdr:Status=6"><span class="normal_green">Продлено</span></xsl:when>
				<xsl:when test="qrdr:Status=7"><span class="normal_red">Аннулировано</span></xsl:when>
				<xsl:when test="qrdr:Status=8"><span class="normal">Архивно</span></xsl:when>
				<xsl:when test="qrdr:Status=9"><span class="normal_red">Не опубликован</span></xsl:when>
				<xsl:when test="qrdr:Status=10"><span class="normal_red">Исключен из реестра</span></xsl:when>
				<xsl:otherwise><span class="normal"><xsl:value-of select="qrdr:Status"/></span></xsl:otherwise>
			</xsl:choose>
		</td>
	</xsl:template>
	<xsl:template mode="doc" match="*">
		<td align="center" style="word-break: normal;">
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="qrdr:UseDateTime"/></xsl:call-template>
		</td>
		<td>
			<xsl:choose>
				<xsl:when test="qrdr:CustDocType='ДТ'"><span class="normal">Декларация на товары: </span></xsl:when>
				<xsl:when test="qrdr:CustDocType='ПР'"><span class="normal">Сообщение о прибытии: </span></xsl:when>
				<xsl:when test="qrdr:CustDocType='УБ'"><span class="normal">Сообщение об убытии: </span></xsl:when>
				<xsl:when test="qrdr:CustDocType='ТД'"><span class="normal">Транзитная декларация: </span></xsl:when>
			</xsl:choose>
			<xsl:apply-templates select="qrdr:GTDID"/>
		</td>
	</xsl:template>
	<xsl:template mode="goods" match="*">
		<td align="center">
			<span class="normal"><xsl:value-of select="qrdr:GoodsNumber"/></span>
		</td>
		<td align="center">
			<span class="normal"><xsl:value-of select="qrdr:LicenseGoods/catESAD_cu:GoodsNumericLic"/></span>
		</td>
	</xsl:template>
	<xsl:template mode="AllRDQuantity" match="*">
		<td align="center">
			<span class="normal"><xsl:value-of select="cat_ru:GoodsQuantity"/></span>
		</td>
		<td align="center">
			<span class="normal"><xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/></span>
			<xsl:text> - </xsl:text>
			<span class="normal"><xsl:value-of select="cat_ru:MeasureUnitQualifierName"/></span>
		</td>
		<td align="center">
			<span class="normal"><xsl:value-of select="qrdr:SupplementaryQuantity"/></span>
		</td>
		<!--td align="center">
			<xsl:choose>
				<xsl:when test="(cat_ru:GoodsQuantity - qrdr:SupplementaryQuantity) &lt; 0">
					<span class="normal_red"><xsl:value-of select="cat_ru:GoodsQuantity - qrdr:SupplementaryQuantity"/></span>
				</xsl:when>
				<xsl:otherwise>
					<span class="normal"><xsl:value-of select="cat_ru:GoodsQuantity - qrdr:SupplementaryQuantity"/></span>
				</xsl:otherwise>
			</xsl:choose>
		</td-->
	</xsl:template>
	<xsl:template match="qrdr:GTDID">
		<span class="normal"><xsl:value-of select="cat_ru:CustomsCode"/></span>
		<xsl:text>/</xsl:text>
		<span class="normal"><xsl:call-template name="gtd_date"><xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/></xsl:call-template></span>
		<xsl:text>/</xsl:text>
		<span class="normal"><xsl:value-of select="cat_ru:GTDNumber"/></span>
	</xsl:template>
	
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<span class="normal"><xsl:value-of select="substring($dateIn,9,2)"/></span>
				<span class="normal"></span>
				<span class="normal"><xsl:value-of select="substring($dateIn,6,2)"/></span>
				<span class="normal"></span>
				<span class="normal"><xsl:value-of select="substring($dateIn,3,2)"/></span>
			</xsl:when>
			<xsl:otherwise>
				<span class="normal"><xsl:value-of select="$dateIn"/></span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<span class="normal"><xsl:value-of select="substring($dateIn,9,2)"/></span>
				<span class="normal">.</span>
				<span class="normal"><xsl:value-of select="substring($dateIn,6,2)"/></span>
				<span class="normal">.</span>
				<span class="normal"><xsl:value-of select="substring($dateIn,1,4)"/></span>
			</xsl:when>
			<xsl:otherwise>
				<span class="normal"><xsl:value-of select="$dateIn"/></span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
