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
											<xsl:call-template name="base">
												<xsl:with-param name="node" select="$base"/>
											</xsl:call-template>
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
													<xsl:call-template name="base">
														<xsl:with-param name="node" select="$base"/>
													</xsl:call-template>
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
															<xsl:call-template name="base">
																<xsl:with-param name="node" select="$base"/>
															</xsl:call-template>
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
					<xsl:if test="qrdr:GoodsBalance">
						<br/>
						<br/>
						<table class="no_bordered">
							<tbody>
								<tr>
									<td align="center" class="graphMain graphHeader no_bordered">
											Итого остаток квоты по товарам разрешительного документа
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<col width="20%"/>
							<col width="10%"/>
							<col width="15%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="15%"/>
							<col width="10%"/>
							<thead>
								<tr align="center" valign="top">
									<th rowspan="2">Номер разреши-<br/>тельного документа</th>
									<th rowspan="2">Вид<br/>доку-<br/>мента</th>
									<th rowspan="2">ФОИВ</th>
									<th rowspan="2">Статус документа</th>
									<th rowspan="2">№<br/>това-<br/>ра<br/>в РД</th>
									<th colspan="3">Итого остаток квоты</th>
								</tr>
								<tr align="center" valign="top">
									<th>Количество товара</th>
									<th>Условное обозначение единицы измерения</th>
									<th>Код единицы измерения</th>
								</tr>
							</thead>
							<tbody>
								<xsl:variable name="base1" select="."/>
								<xsl:for-each select="qrdr:GoodsBalance">
									<xsl:variable name="bq_cnt" select="count(qrdr:BalanceQuantity)"/>
									<xsl:variable name="gn" select="qrdr:GoodsNumber"/>
									<xsl:choose>
										<xsl:when test="$bq_cnt = 0">
											<tr>
												<xsl:call-template name="base">
													<xsl:with-param name="node" select="$base1"/>
												</xsl:call-template>
												<td align="center"><xsl:value-of select="$gn"/></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="qrdr:BalanceQuantity">
												<tr>
													<xsl:if test="position()=1">
														<xsl:call-template name="base">
															<xsl:with-param name="node" select="$base1"/>
															<xsl:with-param name="row_cnt" select="$bq_cnt"/>
														</xsl:call-template>
														<td rowspan="{$bq_cnt}" align="center"><xsl:value-of select="$gn"/></td>
													</xsl:if>
													<td align="center"><xsl:value-of select="cat_ru:GoodsQuantity"/></td>
													<td align="center"><xsl:value-of select="cat_ru:MeasureUnitQualifierName"/></td>
													<td align="center"><xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/></td>
												</tr>
											</xsl:for-each>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>			
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<br/>
					<table class="no_bordered">
						<tbody>
							<tr>
								<td align="center" class="graphMain graphHeader no_bordered">
										Итого остаток квоты по всему разрешительному документу
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<col width="20%"/>
						<col width="10%"/>
						<col width="15%"/>
						<col width="10%"/>
						<col width="15%"/>
						<col width="15%"/>
						<col width="15%"/>
						<thead>
							<tr align="center" valign="top">
								<th rowspan="2">Номер разреши-<br/>тельного документа</th>
								<th rowspan="2">Вид<br/>доку-<br/>мента</th>
								<th rowspan="2">ФОИВ</th>
								<th rowspan="2">Статус документа</th>
								<th colspan="3">Итого остаток квоты</th>
							</tr>
							<tr align="center" valign="top">
								<th>Количество товара</th>
								<th>Условное обозначение единицы измерения</th>
								<th>Код единицы измерения</th>
							</tr>
						</thead>
						<tbody>
							<xsl:variable name="base2" select="."/>
							<xsl:variable name="ab_cnt" select="count(qrdr:AllBalance)"/>
							<xsl:for-each select="qrdr:AllBalance">
								<tr>
									<xsl:if test="position()=1">
										<xsl:call-template name="base">
											<xsl:with-param name="node" select="$base2"/>
											<xsl:with-param name="row_cnt" select="$ab_cnt"/>
										</xsl:call-template>
									</xsl:if>
									<td align="center"><xsl:value-of select="cat_ru:GoodsQuantity"/></td>
									<td align="center"><xsl:value-of select="cat_ru:MeasureUnitQualifierName"/></td>
									<td align="center"><xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/></td>
								</tr>
							</xsl:for-each>			
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="base">
		<xsl:param name="node"/>
		<xsl:param name="row_cnt" select="1"/>
		<td rowspan="{$row_cnt}">
			<span class="normal"><xsl:value-of select="$node/qrdr:RDDocument/cat_ru:PrDocumentNumber"/></span>
		</td>
		<td rowspan="{$row_cnt}" align="center">
			<span class="normal"><xsl:value-of select="$node/qrdr:RDDocument/RUScat_ru:DocKindCode"/></span>
		</td>
		<td rowspan="{$row_cnt}">
			<span class="normal"><xsl:value-of select="$node/qrdr:RDDocument/cat_ru:PrDocumentName"/></span>
		</td>
		<td rowspan="{$row_cnt}">
			<xsl:choose>
				<xsl:when test="$node/qrdr:Status=1"><span class="normal_green">Действует</span></xsl:when>
				<xsl:when test="$node/qrdr:Status=2"><span class="normal_red">Действие приостановлено</span></xsl:when>
				<xsl:when test="$node/qrdr:Status=3"><span class="normal_red">Действие временно приостановлено</span></xsl:when>
				<xsl:when test="$node/qrdr:Status=4"><span class="normal_green">Действие возобновлено</span></xsl:when>
				<xsl:when test="$node/qrdr:Status=5"><span class="normal_red">Действие прекращено</span></xsl:when>
				<xsl:when test="$node/qrdr:Status=6"><span class="normal_green">Продлено</span></xsl:when>
				<xsl:when test="$node/qrdr:Status=7"><span class="normal_red">Аннулировано</span></xsl:when>
				<xsl:when test="$node/qrdr:Status=8"><span class="normal">Архивно</span></xsl:when>
				<xsl:when test="$node/qrdr:Status=9"><span class="normal_red">Не опубликован</span></xsl:when>
				<xsl:when test="$node/qrdr:Status=10"><span class="normal_red">Исключен из реестра</span></xsl:when>
				<xsl:otherwise><span class="normal"><xsl:value-of select="$node/qrdr:Status"/></span></xsl:otherwise>
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
